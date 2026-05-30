---
title: "The redesign series I never finished (and the one I'm doing instead)"
date: 2026-05-30
tags:
  - Building Things
  - Figuring Things Out
  - Playing with AI
---

If you're keeping score, you would've noticed that we never finished the [Building a Website with AI: A Website Redesign Experiment](/series/building-with-ai-website-redesign.html) series. It contained four posts that I had high hopes for but never saw the light of day (like a goblin). 

And now I've redesigned the site again. I have a problem call for help. 

<!-- more //-->

## The graveyard, briefly

In my defence (citation needed), the redesign I was writing about *did* ship. It just got hard to explain what happened. There was a lot of planning and I just stopped writing about it because explaining how I got from words to design was soo convoluted It was hard to actually write. 

The honest summary of those four posts, condensed: I set up some rules, I built things without wireframes, I shipped one feature at a time, and at the end I had an (ok) website.

There. Done. Series complete (in spirit).

## So we are here again? Why?

Honestly, [Claude Design](https://claude.ai/design) came out and it felt like a huge missing piece in the workflow. Plus, I looked at the site I had spent ~~half of~~ 1 month of 2025 building and didn't quite recognize myself in it. It was fine. It worked but it was just meh.

## So how did this work?

Honestly, it started with FOMO. Claude Design had launched and I was watching everyone else try it. So I opened it up and gave it a starting prompt:

```
Here's my github repository: https://github.com/rsmacapinlac/macapinlac.com.

I want to refresh my site. Collect all the relevant technical information. You can start building this whole thing from scratch. Interview me until you have enough direction to produce at least 3 designs.
```

It took a few quick iterations to land on a direction I liked. Once I had it, I asked Claude Design to generate a design system from the finalized version.

The beauty of Claude Design is that it provides you a way to hand things over to Claude Code quite easily. So over to the codebase. I handed the design system to [Claude Code](https://claude.com/claude-code) (Sonnet) on a new branch and asked it to update the documentation. After that I gave it the rendered HTML too, and asked it to update the technical docs and flag any gaps it found along the way.

## Yolo!

The actual implementation went to Opus 4.7. One shot, with this _simpleish_ prompt:

```
You are a senior Ruby, Javascript developer with experience in Middleman.

Read the codebase. Read the documentation folders. Here is a redesigned website. You will be implementing the redesign. Understand any gaps that need to be addressed. Ask questions, and clarify with me until you are at least 95% certain that you can execute. After, go into planning mode; summarize everything and confirm with me before you start. 
```

Then I went to take a shower. I came back, it wasn't finished so I started writing this post.

It finished after an hour and a half.

## Code review

I asked [Pi](https://pi.dev) (connected to my OpenAI+ subscription) to do a code review. Since everything was running in tmux, I could tell Pi which pane Claude Code was sitting in. Pi started feeding Claude Code notes via `tmux send-keys`, and Claude Code happily fixed everything it was told to.

So at this point one AI was reviewing another AI's work by typing into its terminal. I was watching.

## The end?

For now. The next redesign is already drafting itself somewhere quiet in my brain, and the only thing slowing it down is that I haven't finished writing about this one.

My call for help still applies.
