# Samsara — Software Engineering Intern

> ## ⛔ BLOCKED — you are not eligible for this posting
>
> **Minimum requirement:** graduation between *Spring/Summer/Fall 2028 or
> Winter 2029*. **You graduate May 2027** — a full year before the earliest
> accepted date.
>
> This is a hard filter, not a soft preference. Intern cohorts are built for
> students who return to school afterward; by the summer this cohort runs, you
> will have already graduated. The posting contains no "apply anyway" language
> (unlike ST, which explicitly invited candidates missing a requirement).
>
> **Do not spend an application on this req.** Do not adjust your graduation
> date to fit it.
>
> **What to do instead:** apply to Samsara's **new-grad / entry-level software
> engineer** openings, which are the correct door for a May 2027 graduate.
> Watch their careers page from roughly Fall 2026 onward.

- **Job URL:** https://www.samsara.com/company/careers
- **Job ID:**
- **Date posted:**
- **Date applied:** — (blocked)
- **Priority:** A — *for the company, not this req*
- **Base used:** software_backend
- **Referral / contact:**

## Why this is worth keeping in the system anyway

Samsara is, on the merits, the **best-matched company you have shown me so far**,
and it isn't close:

- Their product *is* vehicle telematics and IoT fleet data.
- Their backend problem *is* ingesting and storing telemetry from thousands of
  hardware assets.
- You have built, end to end, a **wireless CAN telemetry platform** with live
  streaming, DBC signal decoding, replay, and a web dashboard.

SR-Wireless-CAN is essentially a miniature Samsara. Very few interns anywhere
can say they have shipped vehicle telemetry ingestion *and* the web app on top
of it. Keep this resume ready.

## Step 1 — Actual job family

Backend / full-stack at an IoT company, with an embedded track available. Their
stack is Go + TypeScript/React + GraphQL + React Native; they explicitly say
direct stack experience is not required.

→ Base: **software_backend**, repositioned so the CAN/telemetry work reads as
IoT data infrastructure rather than as a racing hobby.

## Step 2 — Top 5 technical requirements

1. Backend services and data models at scale (their words: data ingestion and
   storage for 15,000+ hardware assets)
2. Full-stack web — TypeScript/React turning data into insights
3. APIs and data access
4. Embedded / real-time data processing on hardware (alternate track)
5. "AI-forward" — they call this out explicitly as a hiring signal

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id |
| --- | --- | --- |
| Telemetry ingestion + storage | SR-Wireless-CAN: FastAPI + WebSocket streaming, SQLite persistence for DBC files, runs, logs | `srcan-fastapi-ws-swe` |
| Data modeling under load | DBC merge with conflict resolution; bounded search window keeping large signal catalogs responsive | `srcan-dbc-merge-swe` |
| Full-stack web | React dashboard on the CAN platform; Tickr React app; Scent Showdown Flask app | `srcan-fastapi-ws-swe`, `tickr-flows-swe`, `scent-flask-app-swe` |
| REST APIs, production debugging | Zip Intelligence: hardened REST endpoints, structured logging for triage, ticket → verified release | `zip-validation-rest-swe`, `zip-sqlserver-logging-swe`, `zip-feature-ownership-swe` |
| Embedded / real-time on hardware | VCU firmware in C, STM32H7, PX4 flight firmware, CAN diagnostics | `fsae-power-limit-firmware-emb`, `fsae-can-diagnostics-emb`, `argus-firmware-c-emb` |
| Deployment / infra | Docker Compose across backend, frontend, DB | `srcan-docker-swe` |
| AI-forward | Tickr's AI coach is real LLM product integration | `tickr-flows-swe` |

**Gaps:** Go, GraphQL, React Native, and cloud platforms — none of which you
have. They say direct stack experience isn't required, so this is fine, but be
ready to say what you'd pick up first and why.

## Step 4 — Changes made to the base

Starting from `bases/software_backend.tex`:

- **SR-Wireless-CAN added as the lead project.** It is the single most
  Samsara-shaped thing you have built.
- **FSAE Software Controls Engineer added** to the experience section, framed
  around CAN diagnostics and telemetry pipelines rather than motor control — it
  is IoT data plumbing on a vehicle, which is their product.
- **Sailfish dropped** for space. It was one thin bullet with the weakest
  metric on your resume, and it earns the least here.
- **Skills** regrouped with an explicit `IoT & Embedded` line so the CAN work
  reads as domain expertise rather than a hobby.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched
- [x] No unverifiable metric used (32% Sailfish bullet deliberately dropped)
- [x] Titles and dates consistent with every other version
- [x] **SR-Wireless-CAN scope confirmed** — 2026-08-03: you led the entire
      backend. Bullets now say "Led backend development" rather than implying
      you built the whole platform. The wireless-flashing bullet was added —
      your own initiative, decoded from CAN trace captures.
- [x] Filename is `Akash Karthik Samsara Resume.pdf`
- [x] Company name appears in the filename only
- [x] Tracker row added

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-03 | Posting captured; found ineligible on graduation window |
| 2026-08-03 | Resume prepared anyway for Samsara new-grad / future reqs |
