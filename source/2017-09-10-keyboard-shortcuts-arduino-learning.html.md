---
layout: post
title:  "Keyboard shortcuts, payloads, and some Arduino learning"
date: 2017-09-10
tags:
  - Building Things
---

I've been a software guy all my life. I love building software systems. Things
that store data in large databases, you login, and the system does something.
I've never really understood hardware. So when the Arduino and the Raspberry PI
came out I ignored them for the most part. Lately though I've been seeing things
through a different lens.

<!-- more //-->

## Hardware and me

If you scour the [googles](https://www.google.ca/search?q=arduino+projects) for
projects for the Arduino, you'll see a lot of weather stations. You will see a
lot of lights turning themselves on and off. There isn't much excitement there
(and yes I understand that this is mostly to entice beginners). I saw a bunch of
infosec focused Youtube videos emulating devices like keyboards and something
clicked. I caught myself saying, "Wouldn't it be cool if..." a lot. For example,
I saw our beta fish aquarium and said, "Wouldn't it be cool if there was a fish
feeder that had more precise controls to manage the small pellet fish food?"

But I think it's a good idea to start small.

## So, the idea

I love productivity apps. I've been using a lot of keyboard shortcut
applications and macros in my day to day life. It is usually the first thing
that I install on a new computer. However, _that_ is the main drawback: the fact
that you have to install something. There are scenarios where this is not
possible: a corporately owned computer (with strict policies), Citrix, or the
simple fact that the productivity tool doesn't exist for your operating system
(like Ubuntu).

So what are we out to accomplish?

> To build a device that plugs between a keyboard and a computer (ie uses the
keyboard as its input device) where the computer recognizes it as a keyboard. It
should function as a keyboard passthrough and trap certain keyboard
combinations. There should be multiple combinations available such as ctrl-alt-0
through ctrl-alt-9. When the device traps a valid key combination it will "type
out" an defined template.

## Where is this at?

I'm putting this project "out there" and releasing it into the wild. Warts an'
all. You can check it out through the [Github project
page](https://github.com/rsmacapinlac/untitled).

### Is this just a pipe dream?

~~Well, I actually have a few things working. I went out and bought an Arduino
Leonardo and a USB host shield. The code posted in the repo has a working
keyboard passthrough (I'm typing this post using the hardware) except for a few
weird things with the shift key (I'm not sure if it's this keyboard or something
wrong with my code) and holding down keys do not work... yet.~~

~~The rest of the functionality is missing. There was a short attempt to get an
SD card shield working this morning but it didn't quite work. [There is a bunch
of reading to do on that topic me
thinks.](https://www.google.ca/search?q=sd+card+shield+and+usb+host+shield) I'd
also like to learn how to print a 3d case for this eventually.~~

So it isn't a pipe dream. I actually have a good working model that I'm
(generally) happy with. I switched to the Arduino YUN for a bit so I can have
the USB Shield and an available SD card, but I wasn't happy that you had to wait
to boot things up. I was also getting inconsistent behavior.

Now, I've gone back to the Leonardo, cleaned up the files and included some
instructions on how to modify the payloads. 

Here's a high level idea of how to get this up and running.

1. Buy Arduino Leonardo and USB Shield
2. Connect two together
3. Install Arudino software and configure for Arduino Leonardo (get the blinkity
   blink sketch to work and you're good)
   4. Clone the repository, open the Untitled.ino file
   5. Rename the `Templates.h.example` to `Templates.h`
   6. Modify the data in the Templates file
   7. Compile and upload the sketch
   8. Plug in your keyboard into the USB host
   9. Start using: ctrl-alt-0 to ctrl-alt-9

## Help?

While this is an endevour of learning for me, if you're a hardware expert and
have some ideas I'd love to hear them even if you see a big huge glaring mistake
(ie. Yo! This hardware is really the better one to use). "Untitled" can only go
so far as a project title, I've also learned that me + name choosing really
don't mix. So if you'd like to help me pick a name, I'm open to suggestions:
<ritchie@macapinlac.com>.
