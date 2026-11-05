---
type: article
status: published
link: https://bamr87.github.io/posts/2026/11/02/quest-log-bamr87-github-io/
title: "bamr87.github.io: a portfolio that runs on data, not memory"
description: "A tour of Amr Abdel-Motaleb's profile site: one project list, a nightly generator that fails closed, a features index, and what a daily AI review found"
image: assets/images/quest-log/quest-log-bamr87-github-io.png
linkedin_urn: urn:li:share:7523983778701041664
---

A failed data feed should stop a report, not quietly fill it with wrong numbers. Our founder's portfolio site is built on that rule.

Amr Abdel-Motaleb keeps the site's project list in one file. Every night a script adds live data from GitHub and rebuilds the pages. If any lookup fails, the script stops before it writes anything, so the site keeps its last good numbers. It is the same discipline you want under a month-end close.

The site also shows the review loop we hold artificial intelligence (AI) work to. An audit logged each finding as a tracked issue, AI agents proposed each fix as a change for review (a pull request), and nothing changed until a person approved it. When a daily AI review found a security setting switched off, it left the change to a person, because agents may not touch settings.

Read the write-up for how it is built and what is still open.

#AIGovernance #Automation #DataQuality
