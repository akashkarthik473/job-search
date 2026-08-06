# Project Inventory

One entry per project: what it is, what it proves, where the code lives.
This is the answer sheet for "tell me about this project" and for mapping a
job requirement to real evidence.

---

## Formula SAE EV Power Limiter / Energy Management

**Where:** Spartan Racing, Formula SAE — Software Intern → Software Controls Engineer → Software Lead
**Timeline:** Aug 2024 – present
**Stack:** C, TTC 60 VCU, TASKING, TTC Downloader, CAN, BusMaster, MoTeC i2 Pro

**What it is:** Embedded firmware on the vehicle control unit that caps output
power to the FSAE 80 kW limit while maximizing motor output, plus a lap-adaptive
energy-management layer that sets the per-lap power cap from cumulative energy
against the endurance budget.

**What it proves:**
- Real-time embedded C on a production-ish automotive controller
- Fixed-point PI control with saturation, anti-windup, slew limiting
- Deterministic execution and state-machine design
- Regulatory/rule constraint satisfaction under hard limits
- CAN bus design and live diagnostics

**Repo / artifacts:** _fill in_
**Evidence:** endurance logs, dyno runs, CAN captures, MIS EV 2025 results

---

## Formula SAE SIL Replay & Regression Harness

**Where:** Spartan Racing, Formula SAE
**Timeline:** 2024 – 2026
**Stack:** Python, pytest, CSV telemetry, GitHub Actions

**What it is:** A desktop harness that runs the production controller logic
against recorded vehicle telemetry, plus a regression suite that reproduces
field scenarios and runs controller parameter sweeps offline.

**What it proves:**
- Software-in-the-loop test design
- Regression testing against real recorded data
- Python data pipelines and parsers
- Catching controller regressions before they reach hardware

This is the strongest single story in the whole inventory — it spans controller
design, simulation, instrumentation, validation, and hardware debug.

**Repo / artifacts:** _fill in_

---

## Formula SAE EV Vehicle Simulation

**Where:** Spartan Racing, Formula SAE
**Timeline:** Jul 2025
**Stack:** Python, Pygame, Matplotlib, CSV logging

**What it is:** A physics-based EV simulator modeling mass, drag, gearing, motor
torque, acceleration, and steering, with PID power limiting to the 80 kW rule,
headless batch runs, seeded scenarios, and CSV/plot output.

**What it proves:** vehicle dynamics modeling, control strategy validation
before hardware, reproducible offline experimentation.

**Repo / artifacts:** _fill in_

---

## Formula SAE EV Dashboard

**Where:** Spartan Racing, Formula SAE
**Timeline:** Feb 2026 – present
**Stack:** C, STM32H7, CAN, SPI

**What it is:** Real-time driver display over CAN showing HV voltage, throttle,
cell temperature, and power budget, with an energy bar and LED alert system for
lap-by-lap energy feedback.

**What it proves:** STM32 bare-metal/RTOS work, SPI display driving, real-time
CAN consumption, driver-facing UX under hard timing constraints.

**Repo / artifacts:** _fill in_

---

## PX4 Flight Control & Visual-Inertial Odometry

**Where:** Argus Defense — Software Engineer Intern
**Timeline:** Feb 2026 – present
**Stack:** C, PX4 flight stack, VIO, IMU, flight telemetry logs

**What it is:** PID flight-control loop tuning to reduce vertical and horizontal
position drift in autonomous flight, plus integration and tuning of visual-inertial
odometry for onboard state estimation.

**What it proves:** control tuning on a real airframe, state estimation and sensor
fusion, embedded C on a flight controller, log-driven iteration, repeatable
flight test procedure.

**Repo / artifacts:** _internal — describe verbally, do not share code_
**Note:** check what you're permitted to say publicly about this work before
putting specifics in a resume or portfolio.

---

## SR-Wireless-CAN — Wireless CAN Telemetry Platform

**Where:** Spartan Racing, Formula SAE (team project)
**Repo:** https://github.com/tanishqtyagii/SR-Wireless-CAN
**Stack:** Python, FastAPI, uvicorn, WebSockets, python-can, React, SQLite, Docker Compose

**What it is:** A VCU backend for wireless CAN telemetry. Structured DBC upload
and merge with automatic conflict resolution, a browsable master signal catalog
with a bounded search window, live run streaming over WebSockets so multiple
users can watch the same run from different devices, three signal monitoring
modes (table, graph, value/condition tracking), replay of recorded `.trc` CAN
traces, flash history with a deduped library view, and both simulated and
hardware capture modes (`can0` via python-can).

**What it proves:** this is the most versatile project in the inventory — it is
simultaneously

- **backend evidence:** FastAPI, REST + WebSocket APIs, SQLite schema design,
  Docker Compose, React frontend served from the API
- **test/tooling evidence:** trace replay, simulated vs. hardware modes,
  run capture and offline re-examination
- **embedded/CAN evidence:** DBC signal semantics, python-can, live bus capture

It is the cleanest single answer to "have you built a full-stack application?"
*and* "have you worked with CAN?" — which very few candidates can say at once.

**Your scope (confirmed 2026-08-03): you led the entire backend.** The repo sits
under a teammate's account and the frontend wasn't yours, so phrase it as "led
backend development" rather than "built the platform."

**The part to lead with — wireless flashing over CAN.** Your idea. The TTC 60's
flashing procedure wasn't documented to you, so you captured CAN traces of the
vendor tool doing it, decoded the message sequence, and reimplemented the whole
flashing routine in Python over the bus. That is protocol reverse engineering
from first principles, self-initiated, on real hardware.

Very few undergraduates have done anything like this, and it reads as strongly
to a firmware team as to a backend team — it proves you can work without
documentation, read a bus at the byte level, and turn observation into working
tooling. Interviewers will ask about it, which is exactly what you want. Be
ready to walk through how you isolated the flashing frames from ordinary
traffic, how you handled sequencing and acknowledgements, and what you did when
a write failed partway.

---

## Posture Detection System

**Timeline:** 2025
**Stack:** Python, OpenCV

**What it is:** Webcam pose-detection pipeline with overlays, temporal smoothing,
debounce logic, configurable alert thresholds, FPS/latency instrumentation, and
labeled frame + CSV export.

**What it proves:** real-time computer vision, pipeline latency awareness,
dataset generation. Doubles as the CV evidence for robotics/perception roles.

**Repo / artifacts:** _fill in_

---

## Zip Intelligence (professional)

**Timeline:** Sep 2024 – Oct 2024
**Stack:** REST APIs, SQL Server, frontend validation, structured logging

**What it proves:** shipping in a real codebase — ticket to verified release,
PR workflow, hardening endpoints, database migration scripts, triage tooling.
Short tenure, so lead with ownership rather than scope.

---

## Sailfish (professional)

**Timeline:** Jan 2024 – Aug 2024
**Stack:** dashboards, reporting, QA process

**What it proves:** data reporting and process improvement.
**Gap:** eight months compressed into one bullet. Expand it — see the bullet bank.

---

## Tickr — AI-Coached Paper-Trading Game

**Timeline:** 2025
**Stack:** TypeScript/JavaScript, React, flat-file datastore

**What it proves:** full application build — auth flows, game state, history,
client-side state management, responsive UI, LLM integration.

**Repo / artifacts:** _fill in_

---

## Scent Showdown

**Timeline:** 2025
**Stack:** Flask, SQLite, REST/JSON, HTML/CSS/JS

**What it proves:** backend CRUD + API design, compact schema design, input
validation, admin tooling, deployment, documentation.

**Repo / artifacts:** _fill in_

---

## Educational Trading Bot

**Timeline:** _fill in_
**Stack:** _fill in_

**Status:** named in the job-search plan as a backend/software project, but no
bullets or details exist yet in any resume version. Fill this in or drop it from
the plan.
