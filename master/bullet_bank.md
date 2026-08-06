# Bullet Bank

Source of truth for bullet wording. `master/master_resume.tex` is the printable
mirror of this file — when you change wording here, mirror it there.

## How to read an entry

```
- id: unique handle, used in application notes.md to record what you shipped
  bases: which base resumes this bullet belongs on (emb / sim / swe / lead)
  skills: what a recruiter or ATS would match on
  confidence: completed | in-progress | proposed
  evidence: what you would show or describe if pressed in an interview
```

**`confidence` is the guardrail.** Never put an `in-progress` or `proposed`
bullet on a submitted resume in past tense. Anything marked **VERIFY** has a
number in it that you must be able to defend before it goes out.

---

## Spartan Racing — Software Lead (Jun 2026 – Present)

- **id:** `lead-software-planning-emb`
  **bases:** emb
  **skills:** technical leadership, embedded planning, CAN, telemetry
  **confidence:** completed
  **evidence:** project plans, review notes
  > Lead software planning for VCU controls, embedded firmware, telemetry, CAN diagnostics, and validation workflows

- **id:** `lead-priorities-reviews-emb`
  **bases:** emb
  **skills:** cross-project coordination, technical review
  **confidence:** completed
  **evidence:** review cadence, project list
  > Coordinate priorities and technical reviews across power limiting, launch control, dashboard, simulation, and vehicle testing

- **id:** `lead-validation-strategy-sim`
  **bases:** sim
  **skills:** validation strategy, test planning, SIL
  **confidence:** completed
  **evidence:** test plan documents
  > Lead validation strategy for VCU controls, telemetry, CAN diagnostics, simulation, and on-vehicle test workflows

- **id:** `lead-testable-requirements-sim`
  **bases:** sim
  **skills:** requirements, reviews, SIL
  **confidence:** completed
  **evidence:** written requirements per project
  > Define testable software requirements and coordinate reviews across power limiting, launch control, dashboard, and SIL projects

- **id:** `lead-python-tooling-swe`
  **bases:** swe
  **skills:** Python tooling, validation, shared workflows
  **confidence:** completed
  **evidence:** telemetry tooling repo
  > Lead software planning for Python telemetry tooling, controller validation, CAN diagnostics, and shared testing workflows

- **id:** `lead-standardize-evidence-swe`
  **bases:** swe
  **skills:** process, test evidence, code review
  **confidence:** completed
  **evidence:** standardized templates
  > Standardize project requirements, test evidence, and technical reviews across dashboard, simulation, and vehicle software projects

- **id:** `lead-requirements-validation-plans`
  **bases:** lead
  **skills:** requirements, validation planning, ownership
  **confidence:** completed
  **evidence:** validation plans per subsystem
  > Defined software requirements and validation plans across controls, telemetry, launch control, efficiency, and vehicle integration projects

---

## Argus Defense — Software Engineer Intern (Feb 2026 – Present)

- **id:** `argus-pid-drift-emb`
  **bases:** emb
  **skills:** PID tuning, PX4, flight control, real-time
  **confidence:** completed
  **evidence:** before/after flight logs showing drift reduction
  > Tuned PID flight-control loops on a PX4 flight controller to reduce vertical and horizontal position drift in autonomous flight

- **id:** `argus-vio-emb`
  **bases:** emb
  **skills:** VIO, state estimation, sensor fusion
  **confidence:** completed
  **evidence:** position-hold accuracy comparison
  > Integrated and tuned visual-inertial odometry for onboard state estimation, improving position-hold accuracy

- **id:** `argus-firmware-c-emb`
  **bases:** emb
  **skills:** C, embedded firmware, PX4, telemetry-driven iteration
  **confidence:** completed
  **evidence:** commits, gain iteration history
  > Developed and validated embedded flight-control firmware in C on PX4, iterating control gains against logged flight telemetry

- **id:** `argus-pid-drift-sim`
  **bases:** sim
  **skills:** PID tuning, position hold, test iteration
  **confidence:** completed
  **evidence:** same as `argus-pid-drift-emb`
  > Tuned PX4 PID flight-control loops to reduce vertical and horizontal drift during autonomous position hold

- **id:** `argus-vio-eval-sim`
  **bases:** sim
  **skills:** VIO, log-based evaluation
  **confidence:** completed
  **evidence:** telemetry analysis
  > Integrated and tuned visual-inertial odometry for onboard state estimation and evaluated performance against logged telemetry

- **id:** `argus-repeatable-flight-tests-sim`
  **bases:** sim
  **skills:** repeatable test procedure, log review, C
  **confidence:** completed
  **evidence:** test procedure, log review notes
  > Developed embedded flight-control changes in C and iterated gains through repeatable flight tests and log review

- **id:** `argus-repro-issues-swe`
  **bases:** swe
  **skills:** C, structured logging, debugging, validation
  **confidence:** completed
  **evidence:** issue reproduction workflow
  > Developed and validated flight-control software in C on PX4, using structured telemetry logs to reproduce issues and evaluate changes

- **id:** `argus-vio-documented-swe`
  **bases:** swe
  **skills:** integration, documentation, repeatable testing
  **confidence:** completed
  **evidence:** written results
  > Integrated visual-inertial odometry and iterated configuration through repeatable tests and documented results

---

## Spartan Racing — Software Controls Engineer (Jul 2025 – Jun 2026)

- **id:** `fsae-energy-mgmt-emb`
  **bases:** emb
  **skills:** energy management, adaptive control, setpoint tracking, endurance strategy
  **confidence:** completed
  **evidence:** logged actual power vs. commanded setpoint. **Defined 2026-08-03:** the 0.01% is the error between the commanded power setpoint and the power actually reached — i.e. tracking accuracy of the power loop, *not* an efficiency or energy-budget figure. Say it that way.
  > Designed a lap-adaptive energy-management algorithm that sets a power setpoint from cumulative energy versus budget, with the controller holding actual power within **0.01%** of setpoint

- **id:** `fsae-power-limit-firmware-emb`
  **bases:** emb
  **skills:** C, PI control, VCU firmware, FSAE 80 kW rule
  **confidence:** completed
  **evidence:** firmware source, dyno/track logs
  > Developed embedded power-limiting firmware with a PI controller on the VCU, maximizing motor output while enforcing FSAE's 80 kW limit

- **id:** `fsae-can-diagnostics-emb`
  **bases:** emb
  **skills:** CAN, diagnostics, BusMaster, real-time monitoring
  **confidence:** completed
  **evidence:** CAN DBC / frame definitions, BusMaster captures
  > Built CAN diagnostics firmware for live power and torque frames, status bits, and error counters for real-time BusMaster monitoring

- **id:** `fsae-fixed-point-pi-sim`
  **bases:** sim, emb
  **skills:** fixed-point arithmetic, anti-windup, saturation, slew limiting, determinism
  **confidence:** completed
  **evidence:** controller source, timing analysis
  > Implemented a torque-to-power controller with fixed-point PI control, saturation, anti-windup, and slew limits for deterministic VCU execution

- **id:** `fsae-sil-replay-sim`
  **bases:** sim
  **skills:** software-in-the-loop, replay testing, Python, CSV telemetry
  **confidence:** completed
  **evidence:** replay harness repo, recorded log corpus
  > Built Python telemetry parsers and a software-in-the-loop replay harness to validate controller changes against recorded CSV logs

- **id:** `fsae-onvehicle-test-sim`
  **bases:** sim
  **skills:** test planning, latency measurement, plotting, regression review
  **confidence:** completed
  **evidence:** test plans, response/latency plots
  > Planned and executed on-vehicle tests, measured response and latency, and generated plots for parameter tuning and regression review

- **id:** `fsae-telemetry-pipeline-swe`
  **bases:** swe
  **skills:** Python, pandas, data pipelines, metrics, plotting
  **confidence:** completed
  **evidence:** parser scripts, generated plots
  > Developed Python telemetry pipelines to parse vehicle logs, calculate controller response metrics, and generate plots for tuning and validation

---

## Spartan Racing — Software Intern (Aug 2024 – Jun 2025)

- **id:** `fsae-state-logic-emb`
  **bases:** emb
  **skills:** state machines, deterministic logic, embedded C
  **confidence:** completed
  **evidence:** state diagram, source
  > Built deterministic entry and exit state logic for power limiting from measured power, requested torque, and threshold flags

- **id:** `fsae-pi-torque-tune-emb`
  **bases:** emb
  **skills:** PI tuning, steady-state error, drivability
  **confidence:** completed
  **evidence:** step-response logs. **Defined 2026-08-03:** 2% error in the torque controller used for power limiting. Prefer stating the error directly — "within 2% error" is more credible to an engineer than "98% accuracy", which sounds like marketing.
  > Tuned the PI torque controller used for power limiting to within **2%** error, smoothing torque transitions to preserve drivability

- **id:** `fsae-desktop-sim-regression-sim`
  **bases:** sim
  **skills:** desktop simulator, regression suite, parameter sweeps
  **confidence:** completed
  **evidence:** simulator repo, regression results
  > Extracted a desktop simulator and regression suite to reproduce field scenarios, run controller sweeps, and prevent regressions

- **id:** `fsae-pi-state-logged-sim`
  **bases:** sim
  **skills:** log-driven tuning, state transitions
  **confidence:** completed
  **evidence:** logged power/torque data
  > Tuned PI torque control and deterministic state transitions using logged power, torque, and threshold data

- **id:** `fsae-endurance-result` — **VERIFY (1st place)**
  **bases:** emb, sim
  **skills:** competition result
  **confidence:** completed
  **evidence:** official MIS EV 2025 results. *Confirm it was 1st in endurance specifically, not overall.*
  > **Results:** 1st in endurance at MIS EV 2025

---

## Zip Intelligence — Software Development Intern (Sep 2024 – Oct 2024)

- **id:** `zip-validation-rest-swe`
  **bases:** swe
  **skills:** frontend validation, REST, status codes, edge cases
  **confidence:** completed
  **evidence:** PRs
  > Implemented frontend validation and clearer error states, then paired with engineers to harden REST endpoints for status codes and edge cases

- **id:** `zip-sqlserver-logging-swe`
  **bases:** swe
  **skills:** SQL Server, structured logging, triage
  **confidence:** completed
  **evidence:** migration scripts
  > Added SQL Server update scripts and structured logs to speed reproduction and issue triage

- **id:** `zip-feature-ownership-swe`
  **bases:** swe
  **skills:** end-to-end ownership, PR workflow, documentation
  **confidence:** completed
  **evidence:** ticket-to-release trail
  > Took ownership of a small feature from ticket through verified release, shipping via pull requests with setup and change documentation

---

## Sailfish — Data Analyst (Jan 2024 – Aug 2024)

- **id:** `sailfish-dashboards-swe` — **VERIFY (32%)**
  **bases:** swe
  **skills:** dashboards, reporting, QA, data entry
  **confidence:** completed
  **evidence:** *Which metric improved 32%, measured how, over what baseline? Weakest-defended number on your resume — fix or drop it.*
  > Built structured dashboards, weekly summaries, and maintainable QA notes while streamlining data entry and reporting a 32% improvement in tracked metrics

---

## Project — Formula SAE EV Dashboard (Feb 2026 – Present)

**Tech:** C, STM32H7, CAN, SPI

- **id:** `dash-can-display-emb`
  **bases:** emb
  **skills:** real-time display, CAN, STM32, SPI
  **confidence:** completed
  > Built a real-time CAN telemetry display for HV voltage, throttle, cell temperature, and power budget on an LCD

- **id:** `dash-energy-bar-emb`
  **bases:** emb
  **skills:** driver UX, alerting, energy budget
  **confidence:** completed
  > Designed an energy bar and LED alert system giving the driver lap-by-lap feedback on energy budget

---

## Project — Formula SAE EV Vehicle Simulation (Jul 2025)

**Tech:** Python, Pygame, Matplotlib, vehicle dynamics, PID control, CSV logging

- **id:** `vsim-physics-emb`
  **bases:** emb
  **skills:** vehicle dynamics, physics modeling, Python
  **confidence:** completed
  > Built a physics-based FSAE EV simulation to model acceleration using vehicle mass, drag, gearing, and motor torque

- **id:** `vsim-pid-power-limit-emb`
  **bases:** emb
  **skills:** PID, rule compliance, CSV logging, validation
  **confidence:** completed
  > Implemented PID-based power limiting to the FSAE 80 kW rule and logged runs to CSV for repeatable tuning and validation

- **id:** `vsim-preflight-eval-sim`
  **bases:** sim
  **skills:** simulation-before-hardware, vehicle dynamics
  **confidence:** completed
  > Built a physics-based vehicle simulator for torque, drag, acceleration, and steering to evaluate control changes before hardware tests

- **id:** `vsim-headless-batch-sim`
  **bases:** sim
  **skills:** headless batch runs, seeded scenarios, reproducibility
  **confidence:** completed
  > Added headless batch runs, seeded scenarios, CSV summaries, and plots for repeatable offline comparisons

---

## Project — SR-Wireless-CAN, Wireless CAN Telemetry Platform

**Tech:** Python, FastAPI, WebSockets, python-can, React, SQLite, Docker Compose
**Repo:** https://github.com/tanishqtyagii/SR-Wireless-CAN

**Scope confirmed 2026-08-03: you led the entire backend.** Bullets below are
written in that voice. The repo lives under a teammate's account, so say
"led backend" rather than "built the platform" if asked — the frontend was not
yours.

- **id:** `srcan-flash-protocol-emb` ⭐
  **bases:** emb, sim, swe
  **skills:** protocol reverse engineering, CAN trace analysis, bootloader/flashing, Python, embedded tooling
  **confidence:** completed
  **evidence:** the Python flashing implementation; the CAN trace captures you decoded it from
  > Proposed and implemented wireless firmware flashing for the TTC 60 VCU, decoding the flashing sequence from CAN trace captures and reimplementing it in Python over the bus

  **This is your best single bullet — use it everywhere it fits.** Reverse-engineering
  an undocumented flashing protocol off bus captures is a genuinely uncommon thing
  for an undergraduate to have done, it was your own initiative, and it reads as
  strongly to a firmware team as it does to a backend team. Lead with it for any
  embedded, firmware, or tooling role.

- **id:** `srcan-backend-lead-swe`
  **bases:** swe
  **skills:** backend ownership, FastAPI, WebSockets, real-time streaming, SQLite
  **confidence:** completed
  **evidence:** repo
  > Led backend development for a wireless CAN telemetry platform, building a FastAPI and WebSocket service that streams live vehicle telemetry to a React dashboard with SQLite persistence

- **id:** `srcan-dbc-merge-swe`
  **bases:** swe
  **skills:** merge/conflict resolution, schema design, query performance
  **confidence:** completed
  **evidence:** repo
  > Implemented structured DBC upload and merge with automatic conflict resolution, and a bounded search window that keeps large signal catalogs responsive

- **id:** `srcan-docker-swe`
  **bases:** swe
  **skills:** Docker Compose, deployment, serving a SPA from the API
  **confidence:** completed
  **evidence:** repo
  > Containerized the backend, frontend, and database with Docker Compose for one-command setup across team machines

- **id:** `srcan-replay-sim`
  **bases:** sim
  **skills:** trace replay, simulated vs. hardware modes, python-can
  **confidence:** completed
  **evidence:** repo, `.trc` trace corpus
  > Added replay of recorded `.trc` CAN traces plus simulated and hardware (`can0`) capture modes, so runs could be reproduced and re-examined off the vehicle

- **id:** `srcan-monitoring-modes-sim`
  **bases:** sim
  **skills:** signal monitoring, condition tracking, multi-client sync
  **confidence:** completed
  **evidence:** repo
  > Built table, graph, and value/condition monitoring modes for arbitrary CAN signals, with live run observation shared across devices over WebSockets

- **id:** `srcan-can-tooling-emb`
  **bases:** emb
  **skills:** CAN, DBC signal semantics, bus capture, diagnostics tooling
  **confidence:** completed
  **evidence:** repo
  > Developed wireless CAN capture and diagnostics tooling with DBC-driven signal decoding, replacing tethered bench monitoring during vehicle testing

---

## Project — Posture Detection System (2025)

**Tech:** Python, OpenCV, real-time vision, telemetry

- **id:** `posture-pipeline-sim`
  **bases:** sim
  **skills:** OpenCV, pose detection, smoothing, debounce
  **confidence:** completed
  > Developed a webcam pose-detection pipeline with overlays, smoothing, debounce logic, and configurable alert thresholds

- **id:** `posture-metrics-sim`
  **bases:** sim
  **skills:** FPS/latency instrumentation, dataset export
  **confidence:** completed
  > Tracked FPS and latency, recorded sessions, and exported labeled frames and CSV metrics for offline analysis

---

## Project — Tickr, AI-Coached Paper-Trading Game (2025)

**Tech:** TypeScript/JavaScript, React, flat-file datastore, responsive UI

- **id:** `tickr-flows-swe`
  **bases:** swe
  **skills:** auth flows, React, application state
  **confidence:** completed
  > Built registration, sign-in, game, and history flows for a scenario-driven trading game with an AI coach

- **id:** `tickr-quest-logic-swe`
  **bases:** swe
  **skills:** client state management, prompt logic, responsive UI
  **confidence:** completed
  > Implemented quest and prompt logic, client-side state management, and a mobile-responsive interface

---

## Project — Scent Showdown (2025)

**Tech:** Flask, HTML/CSS/JavaScript, SQLite, REST/JSON

- **id:** `scent-flask-app-swe`
  **bases:** swe
  **skills:** Flask, SQLite, schema design, input validation
  **confidence:** completed
  > Built a matchup and leaderboard application with Flask routes, templates, a compact SQLite schema, input validation, and an admin view

- **id:** `scent-json-deploy-swe`
  **bases:** swe
  **skills:** JSON APIs, seed/export scripts, deployment, docs
  **confidence:** completed
  > Added JSON endpoints, seed and export scripts, deployment setup, and a maintainer-focused README

---

## Gaps to fill

These were named in the job-search plan but have **no bullets written yet**.
Write two each and they become usable immediately.

- **Educational Trading Bot** — named as a `swe` project. No bullets exist.
- **Sailfish** beyond the single dashboard bullet — eight months of work is
  currently one line. Worth two or three.
- **Traction control / regen** — flagged in the plan as *research, not shipped*.
  If you add these, set `confidence: in-progress` or `proposed` and write them
  in that tense. Do not let them drift into completed past tense.
