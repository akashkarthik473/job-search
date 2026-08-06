# Roblox — Software Engineer Intern

- **Job URL:**
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** software_backend
- **Referral / contact:**

**Eligibility: clear.** "Pursuing an undergraduate or graduate degree in computer
science" — yes, through May 2027. No graduation window. The language bar is
"one or more" of Go, Node.js, Ruby, Python, C++, Lua, Swift, C#, Java — you have
four of the nine.

**Missing from what was captured:** location and term. Roblox interns are
normally San Mateo, CA, but confirm both before applying — and pull the full
posting into `job_description.txt`.

## Step 1 — Actual job family

General SWE internship at a large company, with **team matching after you're
accepted**. That changes the strategy: you are not writing for one team, you are
writing to clear a general bar and then to be legible to the teams you'd want.

Their five named teams and how you'd land:

| Team | Your case |
| --- | --- |
| **Infra** | Strongest. Backend services, WebSockets, Docker, SQLite/SQL Server, telemetry ingestion |
| **Engine** | Real second. C/C++, real-time deterministic execution, fixed-point arithmetic, embedded performance work — unusual for an intern and directly relevant to engine work |
| **Foundational AI** | Weak. Tickr's AI coach is LLM *integration*, not ML development. Don't aim here |
| Search & Discovery | No evidence |
| Economy | No evidence |

→ Base: **software_backend**, with the C/C++ real-time work kept visible so
Infra *and* Engine both read as plausible.

## Step 2 — Top 5 things they actually want

1. Ship to **production** end to end — code, test, deploy
2. Proficiency in one or more of their languages (you have Python, C++, Java, JS/Node)
3. **ML frameworks, agentic coding tools, LLMs** — called out prominently
4. Cross-functional collaboration (Design, Product, Data, QA, DevOps)
5. Curiosity, feedback, collaboration — culture-fit signals they repeat three times

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id |
| --- | --- | --- |
| End-to-end production ownership | Zip Intelligence: ticket → verified release, shipped via PRs with documentation | `zip-feature-ownership-swe` |
| Coding + testing + deploying | pytest, Jest, GitHub Actions; Docker Compose deployment; Scent Showdown deploy setup | `srcan-docker-swe`, `scent-json-deploy-swe` |
| Backend services (Infra) | FastAPI + WebSocket telemetry service with SQLite persistence | `srcan-backend-lead-swe` |
| C++ / real-time (Engine) | Fixed-point PI with deterministic execution; embedded firmware in C on VCU and PX4 | `fsae-fixed-point-pi-sim`, `argus-firmware-c-emb` |
| LLM experience | Tickr's AI coach — prompt logic and product integration | `tickr-flows-swe`, `tickr-quest-logic-swe` |
| Debugging production issues | Structured logs to speed reproduction and triage | `zip-sqlserver-logging-swe` |
| Cross-functional collaboration | Software Lead — coordinating reviews and requirements across five project teams | `lead-standardize-evidence-swe` |

**Requirements I have no evidence for:**

- **ML frameworks.** Same gap as ST. You have LLM *integration*, not model
  development — no training, no scikit-learn/PyTorch/TensorFlow. Do not write
  "machine learning" on this resume. If Foundational AI comes up in team
  matching, be honest that you're a systems person who has shipped LLM features.
- **Go, Ruby, Lua, Swift, C#.** The bar is "one or more," so this is fine.
  Lua is worth 20 minutes of curiosity before an interview — it is the language
  Roblox users write, and knowing why that matters is cheap signal.

**One thing to raise in interviews, not on the resume:** they call out *agentic
coding tools* explicitly. You have been using one to build this entire job-search
system — resume bases with a shared LaTeX style, a bullet bank, a scaffolding
script, a local tracker app. That is a real, current, specific answer to "how do
you use AI in your work," and most candidates will only have "I use it for
autocomplete."

## Step 4 — Changes made to the base

Starting from `bases/software_backend.tex`:

- **Languages line reordered to Python, C++, Java, TypeScript/JavaScript** —
  their four that you actually have, in their order of appearance, with Node.js
  named explicitly since they name it.
- **FSAE Software Controls Engineer added back** to Experience. The backend base
  drops it, but for Roblox the C/C++ real-time work is what makes Engine a live
  option during team matching. Framed around deterministic execution and
  performance, not motor control.
- **Tickr promoted to first project**, tech line names LLM integration.
- **SR-Wireless-CAN second** — the Infra case: real-time service, persistence,
  containerized deployment.
- **Sailfish dropped** — weakest-defended metric, earns nothing here.
- **Testing and deployment surfaced** into its own skills line, since "coding and
  testing to deploying it to production" is their phrasing.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched
- [x] No unverifiable metric on this version (Sailfish 32% dropped; no 0.01%/2%)
- [x] Titles and dates consistent with every other version
- [x] SR-Wireless-CAN scope confirmed (backend lead)
- [x] No ML claims
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Roblox Resume.pdf`
- [x] Company name appears in the filename only
- [x] Tracker row added

## Interview prep

- **Team matching is the real game here.** Have a ranked preference ready:
  Infra first, Engine second, and a genuine reason for each. "I've built a
  real-time telemetry service and I've written deterministic fixed-point control
  loops — I want to work where latency is a correctness property" covers both.
- Expect standard DS&A at a company this size. More rounds, more algorithmic
  than the startups on your list.
- "Tell me about owning something end to end" — Zip Intelligence, ticket to
  verified release.
- Have the agentic-coding-tools answer ready. It's the one place your recent
  work is directly on their stated interest.
- Roblox is a platform where users build. Have a view on what makes a creator
  platform good — this is a culture question they'll appreciate a real answer to.

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-04 | Tailored resume prepared |
