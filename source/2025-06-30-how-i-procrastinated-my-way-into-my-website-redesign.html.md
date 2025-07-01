---
title: "How I Procrastinated my way into my website redesign"
date: 2025-06-30
tags:
  - Playing with AI
  - Figuring Things Out
layout: post
---

*Or: How strategic procrastination became the most valuable part of my entire redesign process*

I was bored with macapinlac.com's design. Not just mildly dissatisfied — properly bored. You know that feeling when you look at something you've been staring at for years and suddenly realize it's just... there?

<!-- more //-->

The classic scenario: I'd started this blog redesign work two years ago, got distracted by life, and never finished.  Classic me. 

One day I was supposed to be working on something else entirely. Instead, I found myself deep in a rabbit hole of people using AI to build applications from scratch. The promise was intoxicating — just describe what you want, and then boom! Working code!

I thought to myself, I can do that right? I have a degree and a long career in IT. I've lived through the first dotcom bubble and I've launched a bunch of websites. How hard could it be?

## The Anti-Pattern Discovery

Here's what I learned: single-shot prompting doesn't work for complex projects. You know those YouTube videos where someone says "build me a complete website" and it just works? Yeah, that's not real life.

Those demos work because they're starting with a blank canvas. When you're redesigning an existing site, you're dealing with years of content decisions, random technical choices, and whatever seemed like a good idea at 2 AM three years ago. The AI needs to understand what you're actually working with, not just what you're dreaming about.

The conversational approach—having multiple focused conversations was the key. Each conversation built on the previous ones, and the AI could reference earlier decisions and constraints.

## The Three-Chat Approach

This was when I stumbled across a video of [Vicky Zhao](https://www.youtube.com/watch?v=pUG7_03G_Ac). The concept was to use AI to help refine a problem space (5 why's etc). 

I decided to have three separate conversations with Claude, each with a different persona:

1. **Business Analyst**: Help me understand my assumptions, what do I need this blog to do? 
2. **Brand Strategist**: Help me define my voice? Who am I writing for? What's the overall message?
3. **UX Designer**: How should this actually work? What's the user experience?

Looking back, this was probably overkill for a personal blog redesign project but treating these chats like contractors you'd actually hire (complete with some level of formality) felt oddly satisfying. My procrastination game is absolutely strong! I asked each persona to be thorough, think things through, identify and clarify any assumptions in my response. 

This took a while (days!) because I did really think through my responses. I always gave more information and not less.

## The Foundation Documents Revelation

I ended up creating three documents that completely changed how I thought about the redesign:

- **Redesign Brief**: What am I actually trying to accomplish?
- **Content Strategy**: How do I organize and present my content?
- **Design System**: What are the visual and interaction patterns?

If you're curious here's what I ended up with: [the foundation documents are available on GitHub](https://github.com/rsmacapinlac/macapinlac.com/tree/main/docs). They're not perfect, but they're honest about the process and the decisions that came out of it.

I've also reverse-engineered the actual prompt I used for these conversations. You can [download the AI Website Redesign Team Instructions here](/files/2025-06-30/ai-website-redesign-team-instructions.txt) if you want to try this approach yourself.

## The Strategic Procrastination Payoff

What I thought was procrastination turned out to be the most strategic part of the entire process.

These documents became the guardrails. When I inevitably tried to shortcut the process later (spoiler: it didn't work), I had something to fall back on. When AI hallucinated, I simply asked for it to check against these documents and it self-corrected. 

My next brilliant idea was to skip right past all this careful planning and just start building. How'd that work out? Well, let's just say there's a reason this is a series and not a single "I redesigned my website in one afternoon" post.