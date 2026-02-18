# LinkedIn Post — Olympus Launch

> **Instructions**: Copy-paste the text below directly into LinkedIn.
> Attach a screenshot of the terminal showing a Council review output.
> Post on a Tuesday or Wednesday between 8:00 and 9:30 AM CET for max reach.

---

I've spent 20 years reviewing code.

Banking. Insurance. Telecom. Energy. The kind of environments where a production bug can cost millions.

And here's what I've learned: the best reviewers aren't the ones who find the most bugs.

They're the ones who look at code from completely different angles.

The security guy spots the SQL injection nobody else noticed.
The DDD purist catches that "account" and "customer" are used interchangeably — while the business treats them as very different things.
The battle-scarred veteran sees the February 29th edge case that'll blow up in 4 years.
The pragmatist sees the 400-line class that could be 40.

4 brains. 4 angles. 4 different filters.

The problem? Having 4 senior engineers available for every review is a luxury nobody can afford.

So I built Olympus.

4 specialized AI agents that review every piece of code you write:

🛡️ Athena — Security (OWASP, injection, secrets, broken auth)
📐 Hermes — Domain-Driven Design (ubiquitous language, bounded contexts)
🔮 Cassandra — Edge Cases (the things that blow up in production)
☀️ Apollo — Simplicity (cyclomatic complexity, over-engineering)

Not a framework. Not a SaaS. No code to maintain.

Just professional-grade prompts, a battle-tested Kanban workflow, and structured vibe coding — all native to Claude Code.

Here's what it looks like on real code:

```
⚡ Olympus Council Review
Score: 35/100 — Verdict: ❌ Rejected

🛡️ Athena: CRITICAL — SQL injection via f-string (line 23)
🔮 Cassandra: CRITICAL — No handling for API timeout
📐 Hermes: WARNING — "data_point" doesn't match established domain vocabulary
☀️ Apollo: WARNING — 78-line function, 5 levels of nesting
```

3 minutes. 4 angles. Zero complacency.

The idea came from watching vibe coding in action: the generated code works, but silently piles up technical debt. So I packaged 20 years of code review experience into 4 reusable AI agents that work on any project.

The repo is open source (MIT structure, CC BY-NC-SA agents).

Link in comments 👇

---

If you're a data engineer, architect, or senior dev using Claude Code for vibe coding — give it a spin and tell me what you think.

And if you deliver code to clients: imagine attaching this quality report to every delivery.

That's exactly what I do.

#ClaudeCode #VibeCoding #CodeReview #DataEngineering #AI #OpenSource

---

> **First comment to post immediately after publishing**:
>
> 🔗 The Olympus repo: https://github.com/ludovicschmetz-stack/olympus
>
> Get started in 2 minutes:
> ```
> git clone https://github.com/ludovicschmetz-stack/olympus.git my-project
> cd my-project
> ./init.sh --template data-platform --name "My Project"
> claude
> ```
>
> 4 templates included: data-platform, web-api, dbt-project, generic.
> PRs and feedback welcome.
