---
title: "Teaching AI My Weird Little Money System"
date: 2026-05-09
tags:
  - Playing with AI
  - Tech Life
layout: post
---

Like most people, the question I ask myself when I stare at my family's finances is "Are we ok?" I read some finance self-help books. I'm not a CPA or strategic financial advisor but I generally have a pretty good overall grip on our family's books.

That said, I still hate it when expenses don't line up. Sometimes to the point that I treat it like an ex-girlfriend you broke up with over text - cross the street, avoid eye contact, pretend it isn't happening.

<!-- more //-->

Who doesn't hate that sinking feeling in their stomach when you're staring at numbers wondering why things are coming up short. Is it because I decided to buy another gadget on a whim (eg. [3D Printer?](https://bambulab.com/en-us/a1-mini), [Raspberry PI?](https://www.raspberrypi.com/products/raspberry-pi-5/)) or subscribed to that AI app that [a YouTuber](https://www.youtube.com/@raroque) built.

It was a lot of background noise and mental brain power that didn't need expending. I didn't need to know that eating out costs money. I needed to know how much I'd messed up and whether the month was still recoverable.

So at the end of 2025 I wrote down the following:

 - Reduce the chronic background financial stress.
 - Understand where the "leaks" are?
 - Create a small consistent monthly surplus.

## The starting point

I think I'm making it sound more dire than it actually is. It really isn't. I think I had a pretty good system / process but there were a few places that created some blind spots. So let me explain how things work, also a caveat that I'm not an expert; there are probably better ways. This just fit my mental model better.

On a regular basis (generally every 2ish weeks, when I could muster the courage to do it), I would sit down on my computer:

  - Download bank and credit card transactions.
  - Import transactions from the different accounts into [GnuCash](https://www.gnucash.org/).
  - Categorize everything manually.
  - Panic when things don't line up.
  - Stare at it more, move some money around.
  - Action on things: Pay bills
  - Repress the memory of the session until the next cycle.

## The System

Don't judge me. This is overly complicated for sure.

### The Tools and the Rules

I keep a budget in an XLSX file. These are targets (or aspirations). Bookkeeping happens in an open source software program called: [GnuCash](https://www.gnucash.org/).

The "rules" — what falls under what category — is a combination of things in my head and what is written down in a "notes" column in the XLSX file.

### The Escrow accounts

Known expenses that are predictable. Yearly costs are converted into bi-weekly numbers which are transferred out on a regular basis.

Examples:

  - Insurance renewals
  - Annual subscriptions
  - Savings

The point is to avoid annual or semi-annual bills feeling like emergencies or unplanned expenses.

### The Variable budget for day-to-day spending

Then there is a variable spending budget. This covers categories like:

  - Groceries
  - Eating out

Unlike the escrow buckets, this is where things go sideways. Fixed bills are fixed. Escrow transfers are automatic. Variable is where the budget goblins lurk in the darkness ready to eat up all your money.

## Getting help, Gwen to the rescue.

By now you're probably thinking, "Ritchie get to the f*ckin' point. That's ~400 words just on background and context." To which I will say, there is no editor here this is just _my_ blog. Ok continuing.

I already had an existing AI Agent (from a failed [OpenClaw](https://openclaw.ai/) experiment), her name was Gwen. I defined a subagent to do financial analysis rather than asking the main chat to improvise each time.

At its core, the subagent's job is simple: respond to anything related to budget and financials.

It also had a repeatable startup sequence:

  - Read the finance README / context file.
  - Download the latest [GnuCash](https://www.gnucash.org/) file.
  - Download the latest budget spreadsheet.
  - Read some documentation to understand the categorization rules.
  - Read the logs for any decisions and projection logic from prior sessions.

It had some context:

  - The household budget lives in an Excel spreadsheet.
  - Actual bookkeeping lives in [GnuCash](https://www.gnucash.org/).
  - I explained that [GnuCash](https://www.gnucash.org/) is the source of truth for actual spending.
  - I explained that the budget spreadsheet is the source of truth for planned spending.

The magic wasn't asking better questions. It was giving the AI better context.

The subagent's job is not just to summarize numbers. She's supposed to behave like a financial partner:

  - Compare budget vs actuals.
  - Flag unusual spending.
  - Identify ambiguous categorizations.
  - Check whether a transaction belongs in variable spending or was separately funded.
  - Ask for direction when it cannot infer the right category.
  - Record decisions so the system gets smarter over time.

## Did my process change? A little.

Now, I do this on a weekly basis and it takes about 15-20m.

  - Download bank and credit card transactions.
  - Import transactions from the different accounts into [GnuCash](https://www.gnucash.org/).
  - Categorize everything manually.
  - Ask Gwen some variant of this question: "Can you create a financial report for this month?"
  - Gwen (runs the subagent) and then creates a simple report with some highlights:

      - Which categories are tracking normally?
      - Which categories need attention?
      - Which transactions look miscategorized?
      - Which charges are one-offs and should be funded separately?
      - Which spending is distorting the picture?

Instead of waiting until the end of the month to discover the damage, I can course-correct while there is still the remainder of the month left.

When I did this today, we (re-)discovered a tire repair that I had completely forgotten about. Gwen surfaced it, highlighted how it impacts the May variable spending budget and suggested a high-level approach on how it could be treated as a one-time expense through one of the "incidentals" escrow accounts.

Gwen doesn't forget, and I do. She held the context from the start of the month, connected the expense to the right bucket, and surfaced it when it mattered. What to do with it was still my call. But at least I was making that call with the full picture in front of me.

## What actually surprised me

Honestly, I expected this to save time. And it does. But that wasn't the interesting part.

The interesting part was the decisions log.

Every time Gwen and I work through an ambiguous transaction — is this amazon purchase house stuff or miscellaneous? Is this donation fixed or variable? — the answer gets written down. Not in my head, in a file that Gwen reads at the start of every session. So we don't go into detective mode every week.

What I didn't expect was how much that would teach me about my own system. Turns out I had a lot of financial rules I'd never made explicit. Rules I was applying inconsistently, or that I assumed were obvious until I had to explain them to something that doesn't guess.

That might be the real value here — not the reports, not the anomaly detection, not even the time savings. It's that teaching Gwen my system forced me to actually understand it myself.

To be clear about what Gwen is and isn't doing: she reads, she doesn't write. She surfaces things; I decide what to do with them. She's not making financial decisions, she's not replacing the bookkeeping discipline, and she's definitely not magically creating a surplus. She's useful precisely because the underlying data, rules, and workflow are already structured.

Less robo-advisor, more extremely patient financial clerk who remembers my rules and occasionally reminds me what my rules actually are.
