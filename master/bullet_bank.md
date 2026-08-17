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

**Rewritten 2026-08-16** from the SR-18 Electronics & Software Meeting #5 deck
(Aug 12 2026), which is the primary evidence artifact for everything below. The
previous seven bullets here were generic ("lead software planning", "coordinate
priorities") and named no system, number, or outcome — they have been replaced.
Keep the deck; it is a dated, per-project written record with your name on it.

**Two scope assumptions, stated 2026-08-16 — correct them if wrong:**
1. **Custom BMS** — you own the *software/firmware* side. The deck lists Hendson
   and Alex on the BMS controller and follower *boards* under Electronics, so
   claiming the whole BMS program would not survive a reference check. Bullets
   below say "BMS firmware".
2. **Software dash** — the firmware for the new three-CAN dash board (Carson is
   doing the hardware). Treated as the continuation of the existing
   `Formula SAE EV Dashboard` project, not a separate one.

**One wording caution.** The Custom VCU console banner in the deck reads
"Roku LT OS — Copyright 2026, Roku, Inc." Do **not** describe that OS as
team-built or your own until you can say exactly what it is and where it came
from. The bullets below claim only the CAN driver and the program leadership,
which are yours regardless.

### Organization

- **id:** `lead-org-scale` — **VERIFY (12 engineers / 10+ projects)**
  **bases:** lead, emb, swe
  **skills:** engineering leadership, org scale, program management
  **confidence:** completed
  **evidence:** meeting deck, per-project owner slides. *Counted 2026-08-16 from
  the Aug 12 deck: 13 named software contributors including you, and 9 software
  projects on the slides plus BMS firmware and the software dash, which are not.
  Confirm your own count before it goes out — do not inherit mine.*
  > Lead the software organization for a Formula SAE electric racecar, directing **12 engineers** across **10+ concurrent projects** spanning a custom vehicle control unit, torque vectoring, traction control, derating, launch control, plant modeling, BMS firmware, and telemetry

- **id:** `lead-weekly-review-cadence-swe`
  **bases:** swe, lead
  **skills:** process, technical review, status reporting, onboarding
  **confidence:** completed
  **evidence:** the meeting decks themselves — one per cycle, completed/to-do per project
  > Run a weekly technical review cadence where every project reports written completed and to-do status against plan, and authored onboarding documentation and a software curriculum for new members

### Custom VCU program — the strongest new material

- **id:** `lead-custom-vcu-program-emb` ⭐
  **bases:** emb, lead
  **skills:** embedded program ownership, STM32H7, RTOS, CAN, watchdog, real-time control
  **confidence:** in-progress
  **evidence:** SRE-VCU repo (`vcuport` branch), boot/console logs in the deck
  > Leading an in-house vehicle control unit program replacing a vendor VCU with a custom STM32H755 controller, with a 10 ms deterministic control task and a watchdog that reboots the controller if that task hangs

  **This is now your best leadership bullet**, the way `srcan-flash-protocol-emb`
  is your best individual one. Replacing a commercial VCU with in-house hardware
  and firmware is a program a company would staff with several full-time
  engineers. Lead with it for any embedded or firmware role.

- **id:** `lead-vcu-seam-port-emb` — **VERIFY (4,100 / 5,400 lines)**
  **bases:** emb, sim
  **skills:** large-scale refactor, interface design, portability, migration strategy
  **confidence:** in-progress
  **evidence:** `vcuport` branch diff. *Numbers are straight off the deck; be
  ready to say what counts as a "line refactored" if pressed.*
  > Directed a seam-based port of a **5,400-line** production VCU codebase, fixing the sensor and CAN layer as the interface so everything below it could be rewritten for new silicon while control logic above carried over unmodified — **4,100 lines** migrated to date

  The reason this is a good bullet is the *strategy*, not the line count. Say the
  strategy out loud: the team keeps a codebase it already knows, and the rewrite
  stays confined to driver and OS level. That is a real engineering decision with
  a stated tradeoff, which is what an interviewer is listening for.

- **id:** `lead-vcu-can-driver-emb`
  **bases:** emb
  **skills:** CAN, device drivers, bare-metal, dual-bus, bring-up
  **confidence:** in-progress
  **evidence:** driver source; bench test on two live buses is still to do
  > Built the CAN driver for the custom VCU, sending and receiving on both controller buses, and specified the analog front-end changes needed for bring-up on the car

  Note the constraint you caught — the STM32H755 analog pins are **not 5 V
  tolerant**, so the analog lines need dividers before the board can be plugged
  into the car. That detail is worth mentioning in an interview: it shows you
  read the datasheet before letting hardware get damaged.

### Vehicle dynamics controls

- **id:** `lead-torque-vectoring-emb`
  **bases:** emb, sim
  **skills:** torque vectoring, four-motor control, project phasing, simulation
  **confidence:** in-progress
  **evidence:** TV kickoff meeting, motor and track sims, phase plan
  > Started a four-motor torque vectoring program, defining a phased plan from an R&D minimum viable controller through motor and track simulation, with traction control layered on top of it

- **id:** `lead-traction-control-scope-emb`
  **bases:** emb, sim
  **skills:** slip estimation, sensor fusion, control loop design, real-time budgets
  **confidence:** proposed
  **evidence:** written control-loop scope and block diagram in the deck
  > Scoped a traction control loop for a four-motor car — per-wheel slip from wheel speed against an IMU-integrated speed estimate, converted to per-wheel torque limits handed to torque vectoring and clamped to the 80 kW rule on a **5 ms** cycle

  **Keep this in proposed tense until it runs.** Scoped, not shipped. What makes
  it a good answer anyway: a four-motor car has no measured ground speed, so the
  interesting part is estimating it — integrate the IMU and correct toward the
  least-spinning wheel. That is a real sensor-fusion problem and you can whiteboard
  it today.

- **id:** `lead-derating-oversight-emb`
  **bases:** emb
  **skills:** thermal derating, config release, GPU acceleration
  **confidence:** in-progress
  **evidence:** derating repo, MIS 2026 data set
  > Overseeing a thermal derating model heading to a first release as the season's baseline configuration, including GPU-accelerated sweeps and validation of VCU derating code through software- and hardware-in-the-loop

### Modeling and validation

- **id:** `lead-plant-models-sim`
  **bases:** sim, emb
  **skills:** MIL/SIL/HIL, plant modeling, battery/motor/inverter models
  **confidence:** in-progress
  **evidence:** model repo, integration meeting notes
  > Leading a model-, software-, and hardware-in-the-loop effort building battery, BMS, motor, and inverter plant models so VCU control code can be validated against a simulated vehicle before it reaches hardware

- **id:** `lead-model-integration-standards-sim`
  **bases:** sim, swe
  **skills:** interface standards, integration, code review, multi-developer coordination
  **confidence:** in-progress
  **evidence:** code standards doc, integration meeting
  > Set code standards and an integration plan across a **7-engineer** modeling team so independently developed subsystem models compose into a single testbench

- **id:** `lead-release-pipeline-swe`
  **bases:** swe, lead
  **skills:** build/release infrastructure, CI, infrastructure sourcing
  **confidence:** in-progress
  **evidence:** pipeline design, 120+ company outreach sheet
  > Standing up a build and release pipeline for VCU firmware, specifying the compute, storage, and CI infrastructure it needs and driving sponsorship outreach to **120+** hardware, cloud, and developer-infrastructure companies to fund it

### Analysis

- **id:** `lead-points-model-sim` — **VERIFY (59.25 s / 40.73 pts)**
  **bases:** sim, swe
  **skills:** quantitative modeling, competition strategy, MoTeC i2 Pro, data analysis
  **confidence:** completed
  **evidence:** points model spreadsheet, i2 Pro channel definitions. *Be able to
  state what the 40.73 efficiency score is scored against and that it assumes the
  0.17 CO₂ minimum.*
  > Built a competition points model relating average lap time and efficiency score to points delta against the benchmark team, identifying a **59.25 s** lap target at a **40.73**-point efficiency score, and derived MoTeC i2 Pro channels to automate the underlying power-limit and regen analysis

  This is the bullet that shows you make *decisions* with data, not just plots.
  The chain is: analysis → lap-time and efficiency target → which control projects
  get staffed. Say it in that order.

### Subsystem firmware

- **id:** `lead-bms-firmware-emb`
  **bases:** emb
  **skills:** BMS firmware, cell monitoring, SoC estimation, HV/current sense
  **confidence:** in-progress
  **evidence:** BMS controller design reviews, ADBMS2950 integration
  > Leading firmware for a custom battery management system, covering cell monitoring, high-voltage and current sense over an ADBMS2950 front end, and the state-of-charge estimation built on it

  **Scope guard:** say "BMS firmware", not "designed the BMS". The boards are
  owned by electronics designers. Overclaiming here is the easiest way to lose
  credibility on an otherwise strong story.

- **id:** `lead-software-dash-emb`
  **bases:** emb
  **skills:** STM32, multi-bus CAN, driver display firmware
  **confidence:** in-progress
  **evidence:** dash firmware; pairs with `dash-can-display-emb` and `dash-energy-bar-emb`
  > Leading dashboard firmware for a new three-CAN STM32 driver display, carrying the existing telemetry, energy-budget, and alerting features onto the new hardware

- **id:** `lead-wireless-flashing-vehicle-emb`
  **bases:** emb, swe
  **skills:** OTA flashing, telemetry, field tooling
  **confidence:** in-progress
  **evidence:** modems sourced; on-car test at Crows still to do
  > Driving wireless firmware flashing onto the race car for track testing, taking the CAN flashing work from bench tooling to a modem-backed link usable at the test site

  This is the direct continuation of `srcan-flash-protocol-emb` — same protocol
  work, now going on-vehicle. Mention them together; the pair reads as "built the
  thing, then got it adopted."

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
- ~~**Traction control / regen**~~ — **closed 2026-08-16.** Both now have bullets
  under Software Lead: `lead-traction-control-scope-emb` (proposed — scoped, not
  running) and `lead-points-model-sim` (completed — the regen and power-limit
  analysis that fed the points model). The original warning still stands: traction
  control does not move to completed tense until the loop runs on the car.

## Things to bring back from the next meeting

The Aug 12 deck turned seven empty leadership bullets into fifteen specific ones.
The same deck cycle will keep doing that, so watch for these as they land — each
one converts a bullet from `in-progress` to `completed`:

- **Custom VCU on the car.** GPIO, ADC/PWM drivers and canManager are the
  remaining blockers, plus the analog dividers and soldered IO ports. The day it
  runs the car, `lead-custom-vcu-program-emb` becomes past tense and is arguably
  the best bullet on the resume.
- **The seam port finishing.** 4,100 of 5,400 lines. State the final number.
- **Traction control running.** The whole `proposed` → `completed` jump.
- **Wireless flashing at Crows.** Turns bench tooling into deployed tooling.
- **A validated lap time against the 59.25 s target.** Predicted-versus-actual is
  a much stronger claim than predicted alone.
