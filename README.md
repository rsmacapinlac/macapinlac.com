macapinlac.com
==============

My minimal website!

# What is this?

So you know, how you build something and completely forget what it's for. You end
up having to look through the code to try and figure it out? This time around,
I'm writing me a README file. Which is why you're probably reading this.

## This is the source code to help me manage my website

You see, I'm thinking about starting a new website at macapinlac.com. I didn't
want to run Wordpress or Blogger because it was just way to complicated. 

I'm using [Jekyll](https://jekyllrb.com/) which is a static site generator.

## Great, how do I run it then?

Wait, you want to run my website locally? Why? Ok...

Assuming that you know how to check out code (you are reading this on GitHub). Go clone this repository, fork it or download it on to your computer. Whichever floats your boat.

### Install some stuff (dependencies)

* rvm (cause it's probably good practice)
* ncftp

```
# Use bundler to ensure that you have all the necessary dependencies
bundle

# I build a rake task
rake serve
```
Open browser and point to `http://localhost:4000` <-- Boom! working copy of macapinlac.com

# TODO

[ ] A nice way to take _post drafts to actual blog posts (maybe using Rake) 

# Moar

* https://www.macapinlac.com/blog/2021/08/26/simplification.html
