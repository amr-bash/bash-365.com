---
title: "Version control for month-end CSV exports"
sub-title: "Date the period, never the version: let the history keep every copy, and let the diff show what moved after sign-off"
description: "Keep each close's CSV exports in Git and VS Code, and what changed after sign-off becomes a dated, line-by-line diff a reviewer can read in minutes"
author: "Amr Abdel-Motaleb"
layout: article
date: 2026-11-04T12:00:00.000Z
lastmod: 2026-11-04T12:00:00.000Z
draft: false
categories: [tech]
tags: [accounting, month-end-close, internal-controls, audit-trail, version-control, vscode]
keywords: [version control for accountants, git for finance teams, csv audit trail, compare csv files in vs code, month-end close audit trail, post-close adjustment review, vendor master change review, denver accounting systems consultant]
preview: /images/previews/version-control-for-month-end-csv-exports.png
excerpt: "Every close leaves a folder of exports, and every next close starts with a question nobody can answer quickly: what changed since we signed off?"
---

Every close leaves a folder of exports behind: the trial balance, the accounts receivable (AR) aging, the vendor list, the bank activity. And every next close starts with a question nobody can answer quickly: what changed since we signed off?

The usual answer is a file called `TB_Sept_FINAL_v2.csv` sitting beside `TB_Sept_FINAL_v2 (1).csv`, and someone comparing them by eye. Software teams solved this exact problem decades ago. The tool is called version control, it's free, and it works on the comma-separated values (CSV) files your accounting system already produces.

## Why a folder of dated copies isn't an audit trail

A dated copy proves a file existed. It doesn't say what changed between two copies, who saved each one, or why. Comparing two 3,000-row exports by eye is how a late entry in a closed period gets missed, and building a side-by-side lookup sheet to compare them is a small project every month.

Version control answers all three questions by itself:

- **What changed:** a line-by-line comparison of any two versions of a file, called a *diff*, with added, removed and changed rows highlighted.
- **When and by whom:** every saved version, called a *commit*, records a timestamp and an author. The author is the name configured on that computer, so when it has to stand up in an audit, pair it with a hosted repository's login records.
- **Why:** every commit carries a message, which works as the memo line on the change.

That is the evidence a journal entry already carries, applied to the files your close depends on. [[The AI audit trail: log prompts like journal entries]] makes the same argument for AI steps in the close.

## What we'd set up

Two free tools:

- **Git**, the version-control system most software teams run on. It keeps the history.
- **Visual Studio Code (VS Code)**, Microsoft's free editor. It opens a CSV as plain text, puts Git's everyday actions behind buttons, and shows any two versions of a file side by side.

There's no server to buy. A Git repository is an ordinary folder with its history stored inside it, so you can start on one laptop and move it to a shared, access-controlled home once the habit sticks.

## How it plays out

### 1. Make one folder the close repository

Install Git from [git-scm.com](https://git-scm.com/downloads) (VS Code points you there if it can't find Git), open an empty folder in VS Code, and choose **Initialize Repository** in the Source Control view. Start with one repository per legal entity. The [VS Code source control guide](https://code.visualstudio.com/docs/sourcecontrol/overview) walks through the view itself.

### 2. Date the period, never the version

This is the habit that feels wrong at first, and it's the whole trick. Name each file for what it is, never for which version it is. The accounting period goes in a folder name; the versions live in the history.

```text
close/
  vendor-master.csv        replaced every month
  chart-of-accounts.csv    replaced every month
  2026-09/
    trial-balance.csv
    ar-aging.csv
  2026-10/
    trial-balance.csv
    ar-aging.csv
```

Period reports go in that period's folder. Master lists, such as the vendor master and the chart of accounts, sit at the top and are replaced with a fresh export every month, so their history becomes a month-by-month record of every change.

Run each export with the same report settings and the same sort order every time: by account number, by vendor number. A diff compares line by line, so a report that comes out in a different order on each run shows every line as changed. Turn off any "printed on" date or page header the report can add, too, or that line changes on every run.

### 3. Commit at sign-off and label the close

When the month is signed off, commit the exports with a message that says what this state is, and give that commit a label, called a *tag*, so you can find it next year without scrolling. VS Code does both from the Source Control view. In a terminal it's three lines:

```bash
git add .
git commit -m "September 2026 close, signed off by the controller"
git tag close-2026-09
```

Copy the commit's short code, the string of letters and digits Git shows beside it, into your close checklist. That code is a fingerprint of the files and of every version before them. Rewrite any earlier version and every code after it changes, so a checklist entry that no longer matches the history is worth chasing.

### 4. Re-export the closed period and read the diff

This is where it pays for itself. A week into October, run September's trial balance and AR aging again and save them over the files in `2026-09/`. If nothing was posted to September after sign-off, Source Control shows nothing to commit. If something was, the file shows as changed, and clicking it opens the comparison: the signed-off figures on the left, today's on the right, the moved accounts highlighted.

Commit that too, with the explanation in the message, such as `September re-export: accrual adjusted after sign-off, approved by the controller`. The diff found the change; the message records why it was allowed.

### 5. Read the master lists every month

Each month's fresh `vendor-master.csv` turns into a diff of new vendors, deactivated vendors, and the line to read first: a changed bank account or remit-to address on a vendor you already pay. Changed payment details on a familiar vendor are one of the oldest payment-fraud patterns, and a monthly diff puts every one of them in front of a reviewer. The same routine works for the chart of accounts and for an export of your accounting system's users and roles, which hands your segregation-of-duties review a monthly list of who gained or lost which role.

VS Code's Timeline view lists every version of whichever file is open, so "when did this vendor's bank change?" means clicking back through the months rather than searching the archive.

## Watch-outs

- **Excel rewrites the CSVs it saves.** Opening an export in Excel and saving it can strip the leading zeros from account and vendor numbers and reformat dates, and the next diff then shows every line as changed. Commit exports exactly as the system produced them, read them in VS Code, or open them in Excel without saving. One line in a file named `.gitattributes`, `*.csv -text`, also tells Git to store them byte for byte instead of converting line endings ([Git's attribute reference](https://git-scm.com/docs/gitattributes)).
- **The exports are sensitive, and so is where they live.** A vendor master holds bank details and an AR aging holds customer balances, so the repository needs the same access controls as the system they came from. Share it as a private repository on a hosted service your IT lead administers, with the main branch protected so nobody can rewrite history, and not by dropping the folder into OneDrive or Dropbox: sync clients copy Git's internal files one at a time and can leave the history damaged. Keep payroll and other personal data out unless your IT lead has approved where it lives.
- **It adds to your system's audit log; it doesn't replace it.** The accounting system records who posted what. The repository records what the reports said at sign-off and how they changed afterwards. You want both, and the diff tells you where to look in the log.

## The first step toward scripts

Once the exports land in one folder with a history, the next moves are small. A script that runs the exports on a schedule. A check that flags any closed period whose re-export no longer matches. A short query in place of a lookup formula. Each is a few lines, and each brings in the programming way of working one habit at a time, which is the path [[Your best programmer thinks they're just good at Excel]] argues your strongest spreadsheet person is already on.

Start with two files at your next close: the trial balance and the vendor master. After two closes you'll have your first real diff and you'll know whether the habit sticks. If you'd rather have the repository, its access controls and the export routine set up around your accounting system, [tell us which reports your close runs on](/contact/).
