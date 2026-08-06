# Jobright — Software Engineer Intern

- **Job URL:**
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** software_backend
- **Referral / contact:**

**Eligibility: clear.** "Currently pursuing a degree in Computer Science" — you
are, through May 2027. No graduation-window filter. Onsite Santa Clara, a normal
commute from San Jose. This one you can actually take.

## Step 1 — Actual job family

Full-stack product engineering at an early-stage AI company. Frontend + backend
+ API/data modeling, with LLM-agent product work around it. Not an ML research
role — they want someone who ships features and debugs production.

→ Base: **software_backend**, essentially unchanged in shape. This posting is
what that base was built for.

## Step 2 — Top 5 technical requirements

1. Frontend **and** backend product features (full stack, not one side)
2. API, service, and data model design
3. Clean, well-tested code
4. Debugging production issues, performance and reliability
5. AI / LLM / agent product interest

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id |
| --- | --- | --- |
| Full-stack feature work | Tickr: auth, game, history flows in React. Scent Showdown: Flask routes, templates, admin view. SR-Wireless-CAN: React dashboard on a FastAPI backend | `tickr-flows-swe`, `scent-flask-app-swe`, `srcan-fastapi-ws-swe` |
| API + data model design | Scent Showdown SQLite schema + JSON endpoints; SR-Wireless-CAN DBC merge with conflict resolution; Zip Intelligence REST hardening | `scent-json-deploy-swe`, `srcan-dbc-merge-swe`, `zip-validation-rest-swe` |
| Well-tested code | pytest, Jest, GitHub Actions, SIL regression suite | `fsae-sil-replay-sim` |
| Debugging production issues | Zip Intelligence: structured logs to speed reproduction and triage; ticket → verified release | `zip-sqlserver-logging-swe`, `zip-feature-ownership-swe` |
| Performance / reliability | Bounded search window keeping large signal catalogs responsive; real-time streaming | `srcan-dbc-merge-swe`, `srcan-fastapi-ws-swe` |
| AI / LLM interest | **Tickr's AI coach** — real LLM product integration with prompt logic | `tickr-flows-swe`, `tickr-quest-logic-swe` |
| Languages (Python/TS/Java/Go/C++) | Python, TypeScript/JavaScript, C/C++, Java — four of their five | — |
| Git / collaborative workflow | PR-based shipping at Zip Intelligence; multi-person repos on Spartan Racing | `zip-feature-ownership-swe` |

**Requirements I have no evidence for:**

- **Go** and **cloud platforms** — listed as *preferred*, not required, and you
  cover four of the five named languages. Not worth faking; be ready to say
  which you'd pick up first.
- **Distributed systems** at real scale. SR-Wireless-CAN is multi-client over
  WebSockets, which is honest to describe as such — but don't call it
  distributed.

## Step 4 — Changes made to the base

Lightest tailoring of the three, because this posting is squarely what the
backend base is for.

- **Tickr promoted to first project**, tech line now names LLM integration
  explicitly. They lead with "build real, production AI agents" — the AI coach
  is your only LLM product evidence and it was buried second.
- **SR-Wireless-CAN added** as the second project, for API design, real-time
  streaming, and Docker. CAN/DBC jargon deliberately generalized to "signal
  definitions" — the automotive specifics mean nothing to this reader, and the
  transferable part is the streaming backend.
- **Scent Showdown kept** as a third project. Dropping Sailfish freed the room,
  and it's the cleanest small example of schema design plus REST endpoints.
- **Sailfish dropped** — the 32% metric is the weakest-defended thing on your
  resume and this posting gives it nothing to do.
- **Skills** reordered to lead Python/TypeScript, with AI/LLM integration
  surfaced on the web line rather than buried.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched
- [x] No unverifiable metric used (32% Sailfish bullet dropped)
- [x] Titles and dates consistent with every other version
- [x] **SR-Wireless-CAN scope confirmed** — 2026-08-03: you led the entire
      backend. Bullets say "Led backend development". Added the protocol
      reverse-engineering bullet, deliberately worded without CAN jargon
      ("undocumented device flashing protocol from bus trace captures") since
      this reader cares about the debugging skill, not the automotive detail.
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Jobright Resume.pdf`
- [x] Company name appears in the filename only
- [x] Tracker row added

## Interview prep

- They build an **AI job search agent**, and you have been building a **job
  search system** for yourself — resume bases, a bullet bank, a tailoring
  workflow, a tracker app. Bring it up: you are the user, and you have opinions
  about the problem. Have one concrete idea for something their product should
  do that it doesn't.
- "Tell me about debugging a production issue" — use the Zip Intelligence
  structured-logging work.
- Expect standard DS&A. Your coursework covers it; brush up.
- Small company, onsite, high ownership. They will probe whether you actually
  ship things.

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-03 | Tailored resume prepared |
