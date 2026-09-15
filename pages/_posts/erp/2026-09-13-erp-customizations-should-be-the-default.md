---
title: "ERP customizations should be the default"
sub-title: "The word that used to blow up implementations is how you win with AI agents"
description: "ERP customizations used to mean upgrade pain and vendor fights. With AI and Grok Bots, they should be the default — with governance, not guilt."
author: "Amr Abdel-Motaleb"
layout: article
date: 2026-09-13T03:45:00.000Z
lastmod: 2026-09-13T03:45:00.000Z
draft: false
categories: [erp, ai]
tags: [erp, customizations, ai, grok-bot, governance, upgrades, vendor-lock-in, smb]
keywords: [ERP customizations, AI agents ERP, Grok Bot customizations, Business Central customization, NetSuite customization strategy, ERP upgrade risk, Denver ERP consultant, fit-to-standard vs customize]
preview: /images/previews/erp-customizations-should-be-the-default.png
---

For twenty years, "customization" was the word that made Enterprise Resource Planning (ERP) vendors clear their throats and implementation partners reach for the change-order form. The business wanted the system to match how work actually ran. The vendor wanted "fit to standard." Both sides were defending a real interest. Both sides turned the word into a fight.

That fight made sense when every change meant hand-written code, a brittle upgrade path, and a specialist who might retire before the next release. It makes less sense now that AI agents and Grok Bots can draft, document, test, and re-apply adaptations at a fraction of the old cost. Customizations should not be treated like a confession. They should be the default — governed, owned, and expected.

## Why businesses and vendors fought over the word

The business case for customizing was never mysterious. Your warehouse receives against a process the vendor never modeled. Your project costing needs a dimension the template chart of accounts does not care about. Your month-end close depends on a spreadsheet that became load-bearing software while nobody was looking. Fitting the company to the package means changing people, controls, and sometimes customer promises. Fitting the package to the company means changing software.

Vendors pushed back for equally concrete reasons:

- **Upgrade economics.** Heavy custom code raised the cost and risk of moving to the next release, which is how vendors monetize the roadmap.
- **Support boundaries.** "Modified" environments become "you own that defect" conversations.
- **Template sales.** Standard processes are easier to demo, staff, and productize across hundreds of customers.

So the negotiation settled into a ritual: the partner scores a fit-gap, the vendor sells "best practice," the business sneaks in side systems, and five years later IT is maintaining Frankenstein while marketing slides still say "out of the box."

## What actually changed with AI agents

The old objection was not morality. It was **total cost of ownership (TCO)** on change. Writing the customization was expensive. Explaining it to the next hire was expensive. Rebuilding it after an upgrade was the bill that killed budgets.

AI agents compress those three costs:

1. **Drafting the adaptation.** A Grok Bot or similar desktop agent can turn a recorded process, a sample file, and a clear acceptance test into a first-pass extension, script, or integration sketch — then iterate with the controller in the room.
2. **Documentation as a byproduct.** The same session that builds the change can leave an Architecture Decision Record (ADR), a runbook, and a test checklist. The customization stops living only in one developer's head.
3. **Re-application after upgrades.** When the vendor ships a new release, agents can diff what broke, propose patches, and re-run the acceptance checks you already wrote. You still need a human merge gate. You no longer need a six-month archaeology project to remember why field X exists.

None of that makes reckless customization free. It changes the default question from "how do we avoid customizing?" to "how do we customize so the next upgrade is boring?"

## Embrace does not mean "modify the core"

"Customizations should be the default" is not permission to edit base objects with a crowbar. The durable pattern for small and medium businesses (SMBs) looks like this:

| Prefer | Avoid |
|---|---|
| Extensions, plugins, and documented APIs | Direct edits to vendor base code |
| Configuration and dimensions before code | New general ledger (GL) accounts for every reporting whim |
| Side-by-side services that integrate cleanly | Shadow ERPs in Excel with no owner |
| Acceptance tests the business can re-run | "It works on the consultant's laptop" |
| Named owners and an ADR for each change | Tribal knowledge and Slack archaeology |

AI makes the left column cheaper. It does not make the right column wise.

## How it plays out for a Denver SMB

For a typical 40–150 person manufacturer, distributor, or professional-services firm on Microsoft Dynamics 365 Business Central, NetSuite, or a similar mid-market ERP, a practical sequence is:

1. **Inventory the "unauthorized ERP."** List the spreadsheets, Access databases, and tribal procedures that already customize the business. That inventory is your real gap list.
2. **Rank by cash and risk.** Start with the adaptations that burn the most hours in the close, the warehouse, or revenue recognition — not the loudest opinion in the kickoff meeting.
3. **Build with an agent, gate with a human.** Use AI to draft the extension or integration; require a named business owner to accept tests; keep segregation of duties on anything that touches postings.
4. **Treat each customization as a product.** Version it, document why it exists, and schedule a revisit when the vendor's roadmap overlaps.
5. **Budget upgrades as re-apply, not rewrite.** Hold a small reserve each year for agent-assisted revalidation instead of a panic project every major release.

Timeline ranges vary, but standing up that governance habit is usually weeks of part-time work, not a multi-year program. The expensive part remains deciding what the business actually needs.

## Watch-outs

- **Agents invent confidently.** Untested customizations are still liabilities. If a hack did not run, it is a note, not a deployment.
- **Vendor terms still matter.** Some clouds restrict what you may extend. Read the contract before you celebrate.
- **Unowned AI output is yesterday's side spreadsheet.** If nobody is accountable for the customization, you rebuilt shadow IT with better autocomplete.
- **Fit-to-standard is still right for commodity processes.** Payroll tax calculations and bank file formats rarely deserve a personal rewrite. Customize where your process is the product; standardize where the law already decided.

## Next step

If your last ERP debate treated "customization" like a risk to be minimized instead of a capability to be governed, it is time to update the playbook. See our [ERP consulting](/services/erp/) service for how we scope fit-gap work, extensions, and AI-assisted delivery for Denver SMBs — or [contact](/contact/) us when you are ready to turn the old fight into an owned roadmap.
