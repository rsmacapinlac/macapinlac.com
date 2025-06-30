---
title: "How I Learned to Stop Worrying and Trust My AI Overlords"
date: 2025-06-15
tags:
  - Playing with AI

---

*Or: How I gave myself one week to stop being precious about my Linux setup*

I have a confession: I'm a serial computer rebuilder. Every few months, I get that familiar itch—the one that whispers "you know what would be fun? Completely nuking your perfectly functional Linux setup and starting over." It's like digital spring cleaning, except I do it year-round and it always takes way longer than expected.

The YouTube algorithm had been feeding me Arch Hyprland rice videos, and honestly? They looked pretty slick. But here's the thing — I've been stuck in my own over-engineering hell for years.

<!-- more //-->

## The Problem: I Love to Over-Complicate Everything

Take a look at my current setup madness:

- [dots](https://github.com/rsmacapinlac/dots) - My dotfiles
- [workstation-builder](https://github.com/rsmacapinlac/workstation-builder) - Ansible scripts
- [wallpaper](https://github.com/rsmacapinlac/wallpaper) - Because apparently wallpapers need their own repo

Don't get me wrong — I love that it's mostly passive. install the operating system, run a few commands, copy some keys, and within minutes you have a fully working computer. But three separate repositories for a personal computer setup? Come on, Ritchie.

And then there's my ongoing distro and desktop environment dance. I've been ping-ponging between Arch and Debian depending on my current level of annoyance, and cycling through AwesomeWM, i3, Gnome, and most recently KDE. I know, I have distro committment issues.

Most recently, I'd been on Linux Mint — stable, boring, functional. But those Hyprland videos kept calling to me, and my over-engineering tendencies were ready for another round.

## My One-Week Challenge

I was using Cursor AI for another project when I decided to take a break and tackle this setup refresh. But this time, I gave myself a constraint: **one week from archinstall to fully working computer**. No more months of research paralysis.

The plan was simple: install this on an old spare laptop I had lying around. If unsuccessful, I'd stay with Mint. If it worked out, I'd reinstall my main computer. Low stakes, clear deadline.

The real challenge? Picking all new tools for Hyprland. I needed my minimum viable toolset for a laptop setup — all those quality-of-life shortcuts that make my world simple. This is usually where I disappear down rabbit holes for months.

But then I had an idea: What if I used Claude to help with the research? I was already paying for both Claude and Cursor, so why not put them to work on this side quest? Plus, I had my AwesomeWM shortcuts in my dotfiles to build from — at least I wouldn't be starting completely from scratch.

## AI-Assisted Research

I created a detailed prompt to help me navigate software selection for Hyprland. Instead of spending weeks comparing every possible combination of tools, I could focus on criteria that actually mattered: hardware specs, battery life trade-offs, my i3/AwesomeWM experience, and practical minimalism.

*[Note: The full prompt is available [here](/files/2025-06-15/hyprland-prompt.txt) if you're curious about the approach]*

## From Research to Implementation

Armed with Claude's recommendations, I switched to Cursor to integrate everything into my dotfiles and Ansible scripts. I didn't blindly accept every change—I reviewed each modification as Cursor made it. But here's what was cool: there were multiple occasions where Cursor did something I wasn't familiar with. Instead of rejecting it, I'd research the approach and actually learn something new.

Key wins:

- Consolidated my wallpaper repo into dotfiles (one less thing to break!)
- Learned new Ansible patterns for managing Arch packages
- Discovered better ways to handle Hyprland configuration
- Even let Cursor update all my README files (okay, this one I admit I did blindly)

## The Results

Two days. That's how long it took to go from archinstall to a fully functional Hyprland setup. Everything worked — window management, status bar, notifications, even my weird keyboard shortcuts transferred over somewhat smoothly.

The constraint of one week forced me to make decisions quickly instead of endlessly optimizing, and I had time left over to clean up my repositories and fix some long-standing organizational issues.

## What I Learned

**AI as a research assistant works.** Instead of getting lost in endless comparisons, I could focus on criteria that actually mattered for my specific use case.

**Constraints breed creativity.** Giving myself one week eliminated analysis paralysis and forced practical decisions.

**Over-engineering is often just falling down rabbit holes.** When I'm learning new technologies, I tend to get lost researching every possible option instead of just picking something that works and moving forward.

**Code review applies to AI suggestions too.** The sweet spot wasn't blindly accepting or rejecting AI help, but treating it like a very knowledgeable pair programming partner.

## What's Next?

I'm actually happy with this setup, which is rare for my rebuild projects. Hyprland feels solid, the toolchain is coherent, and my repositories are cleaner. 

The real test? Whether I can resist the urge to rebuild everything again in six months. But hey, if I do, at least now I have a process that doesn't take forever.

*Now if you'll excuse me, I need to go ask my AI overlords what else I can automate in my setup...*
