---
layout: post
title:  "Simplification"
date: 2021-08-26
tags:
  - Building Things
---

You know when your smart phone has that 'unread' notification badge on an App? That really irritates me! If you have more than 3 unread messages, don't show me your phone. I might explode with anxiety.

<!-- more //-->

I've always been a fan of minimalist CMS systems. This isn't a slam against platforms like Drupal or Wordpress.  I like them but for a personal site as small as mine they're all overkill. They have a time and a place. If you're a content creator who also has a blog, and will eventually sell merc to your 1M followers. Go nuts with those larger platforms. It isn't for me.

I moved this site to [Grav](https://getgrav.org/) a few years back, and it has been great! It's biggest selling point is that it uses Markdown files and doesn't require a database. It isn't perfect (- it still requires PHP), but it was a good enough.

My biggest is challenge is really my own doing. You see, I host this website on a shared server. Why? Because I'm too cheap to pay for a dedicated server. This essentially means that I'm at the mercy of the sysadmins of the providers. Normally this isn't a big deal, however a few months back [Grav changed their minimum PHP version requirements](https://getgrav.org/blog/raising-php-requirements-2020). I'm sure for good reason. I do what I normally do. I wait for my provider to upgrade the required version of PHP.

Since then, the number of notification badges looking to update Grav has slowly piled up and it has been slowly driving me crazy. I just got tired of waiting.

## Enter Jekyll

[Jekyll](https://jekyllrb.com/) is a Ruby and Markdown powered static site generator. What does that mean? You install some stuff on your desktop (or laptop), you write your content in markdown (like I usually do) and it generates a website for you. This website is plain 'ol HTML, CSS and JavaScript, like a website from 1998. The files are uploaded (in my case via FTP) to a webserver. 

The requirements to "run" the site is ultimately simplified. All you need is a plain 'ol vanilla webserver; not PHP, not a MySQL database either. I use my local computer to write content in Markdown and publish the site.

Jekyll [isn't the only tool](https://www.google.com/search?q=static+site+generator) that does this (I'm not even sure if it is the best -- I didn't do much research) but I'm a Ruby guy at heart and it seemed simple enough to use.

A few ruby versions installation, a [Jekyll version change](https://github.com/riggraz/no-style-please/issues/5), a strong contemplation of my life choices later and I got everything up and running.

## Workflow?

So what does the workflow look like?

 >  The initial setup installs Jekyll, and uses the `jekyll new` command to generate a skeleton of the website. This is captured in the 'get running in seconds' on the front page of the Jekyll site.

Once you've created that skeleton. My high-level workflow looks like this:

1. Create the .md (Markdown) file (and populate with content)
* This part generally differs if you're writing a blog post vs a static page
2. Clean up the published folder (by default it is \_site) using the `jekyl clean` command
3. Run the built in web server (`jekyll serve -D -H 0.0.0.0`) to see your work on http://localhost:4000
4. Check everything is good
5. Run a clean build (`jekyll clean && jekyll build`)
6. Upload the files from \_site to your hosting using an FTP client like FileZilla

It isn't the most optimal, I admit. Which leads me to my next step.

### (An) Automation

I used [Rake](https://github.com/ruby/rake), [Dotenv](https://github.com/bkeepers/dotenv) and [ncftp](https://docs.oracle.com/cd/E88353_01/html/E37839/ncftp-1.html) to smooth out parts of the workflow above starting on the last two steps. Thanks to the good 'ol Google, I found [an article](https://mikeconroy.com/2020/04/automating-jekyll-deployments-github-actions/) that had most of the commands already defined.

I added the following commands:
```
rake clean    # this really just calls jekyll clean
rake build    # this calls the clean command, and then builds the site 
rake serve    # this calls the clean command, and the the jekyll serve with -D and -H switches (I like to be able to access the site from different devices)
rake publish  # calls the rake build, and uses ncftpput to FTP the _site folder to whats been defined in the .env file
```
I will probably add more as I continue to use this new tool. So if you'd like to continue to follow along my website shananigans, here is the [github repository](https://github.com/rsmacapinlac/macapinlac.com).


