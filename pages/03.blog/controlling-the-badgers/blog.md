---
title: 'Controlling our badgers (ie capistrano deploys in a dynamic infrastructure)'
content:
    items: '@self.children'
    limit: 5
    pagination: true
    url_taxonomy_filters: true
    order:
        dir: desc
        by: date
taxonomy:
    tag:
        - Nucleoid
        - Technical
        - 'Geek talk'
---

Let's say you have a fairly dynamic infrastructure for your new Rails application mostly because you're scared of the [Fail Whale](http://www.theatlantic.com/technology/archive/2015/01/the-story-behind-twitters-fail-whale/384313/). At the same time, you need to make sure that you can deploy code quickly using capistrano. And... you don't necessarily want to hard-code all the things. Here is how we solved it.

===

We're pretty proud of ourselves with this solution so I figured that I'd put it out into the world cause you know, karma. But first a bit of context, we've launched (hummm probably the better term is 'birthed') our baby: [Nucleoid.com](https://www.nucleoid.com) (more on that in a different blog post - maybe). 

To allow for scaling our infrastructure we use [Saltstack](https://saltstack.com/) with agreed upon naming conventions to specify each host's roles. We also have a jenkins build host that run a bunch of capistrano scripts that deploy our Rails codebase to these hosts.

For the sake of this argument let's call our front-end hosts where our code is deployed: _badgers_. The convention (kinda) looks like this: badgers[x].macapinlac.com which allows us to scale by incrementing x. Salt then provisions our infrastructure configuration to these hosts by matching the naming convention.

I _think_ this is pretty common practice with SaltStack.

From the Rails' code though we use [Capistrano](http://capistranorb.com/) and it expects the host part of it's configuration to be fairly static with a set number of servers assigned to specific roles (ie these set of hosts are app servers, these other sets of hosts are 'web' server). Here's a sample part of that configuration: 

```ruby
role :app, %w{badger1.macapinlac.com badger2.macapinlac.com}  
role :db,  %w{badger1.macapinlac.com}  
```

This made it pretty cumbersome to change and update the jenkins configuration when new badgers are added (or removed for that matter). And because of that hard-coding, here is what our host provision / solution deploy process looked like:

1. Provision new badger, salt builds the config (badger[x+1])
2. Update the capistrano deploy script with new host(s)
3. Check in the new deploy script
4. Provision new capistrano deploy to the jenkins build
5. Trigger the jenkins deploy, when SaltStack is finished (maybe fail the build because _I_ configured the Capistrano deploy incorrectly, go back to step 2)

It's a bit scary in an urgent scaling situation where we need to provision a bunch of badgers to handle scale. 

## Make it smarter

So initial solutions that we came up with required having registering hosts in a DB, shared flat file, etc. I personally didn't like that approach because it involved building and maintaining a 'new' thing (eg. a new database, or a share file storage, etc). Cheap Asian co-founder really didn't want to add a new 'thing' in our monthly financial burn.

I mean, in reality why can't the capistrano script be 'smarter' somehow. Here is the solution we came up with:

```ruby
#config/deploy/shared.rb
require 'net/http'

def get_server_role(host)
  role = %w{web app}
  role.push 'db' if host.include? 'badger1'
  return role
end

def get_active_servers()
  active_servers = []
  (1..10000000).each do |index|
    host = "badger#{index}.macapinlac.com"
    uri = URI "http://#{host}/"
    begin
      Net::HTTP.get_response(uri)
      active_servers.push host

      rescue(SocketError)
        puts "host not found: #{host}; breaking"
        break
    end
  end
 active_servers
end

# config/deploy/prod.rb
require_relative 'shared'

for host in get_active_servers()
  server_role = get_server_role(host)
  server host, roles: server_role, user: 'deploy'
end

```

Basically it loops through badger1 to badger10000000 (or some really high number) and attempts to do an HTTP request. If it receives a successful HTTP request, then it adds the host to Capistrano's host configuration and when it finds a badger that doesn't respond back the script stops looking.

It also adds the DB role to badger1 because I know that host will always exist. In Rails, you need 1 host to have the DB role to run the necessary database migrations. Without adding this role, then any DB migrations won't run (I learned that the hard way).

_Also a note, this works for us because our SaltStack configuration will always ensure that the application / web container is running._

So now our host provision / solution deploy process looks like this:

1. Provision new badger(s), salt builds the config
2. Trigger the jenkins deploy, when SaltStack is finished

** Whoohoo! **
