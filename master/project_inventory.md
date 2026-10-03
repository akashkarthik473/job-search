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

## SRE-7b Custom-Inverter VCU Integration

**Where:** Spartan Racing, Formula SAE — Software Lead and individual firmware contributor
**Timeline:** Aug 2026 – present (active vehicle integration)
**Stack:** C, TTC 60 VCU, CAN, VESC-compatible inverter commands, custom BMS
**Repo:** SRE-VCU — `custom-inverters`, `dutycycle-but-better`, and
`precharge-and-rtd-gate` branches

**What it is:** An MVP powertrain path adapting the team's existing four-motor
VCU architecture to custom inverters. The current branch maps calibrated pedal
travel to bounded CAN current requests for the two rear custom inverters on the
VCU's 10 ms application loop. It retains four wheel-position objects so the path
can grow into the full four-inverter configuration without replacing the
powertrain abstraction.

The same work adapts the VCU to the team's custom 96-cell BMS. The parser covers
46 CAN message IDs across 96 cells, 96 thermistors, and 8 modules, including
pack voltage/current and state of charge, cell voltages and temperatures,
balancing state, environmental telemetry, faults, and precharge status. A 1 s
CAN heartbeat timeout turns loss of BMS communication into a fault rather than
allowing stale data to appear healthy.

**Your individual implementation:**
- Mapped calibrated accelerator travel into bounded custom-inverter CAN current
  commands and iterated the current/duty-cycle strategy during bring-up
- Added a precharge request and ready-to-drive state machine that kept inverter
  requests at zero until BMS heartbeat/fault/precharge state, HV presence, pedal
  calibration, low-throttle arming, and the RTD button were valid
- Reworked the VCU-side BMS CAN parser and integrated its status into the safety
  checker

**What it proves:** hands-on embedded C within the same role where you lead the
software organization; CAN protocol implementation; powertrain state-machine
design; defensive handling of stale safety data; and iterative vehicle bring-up.

**Status discipline:** The repository proves implemented code, not a completed
four-inverter vehicle deployment. The active MVP output currently targets the
rear pair. Say "developing the custom-inverter VCU path for a four-motor EV," not
"deployed four custom inverters," until the complete configuration runs on-car.

---

## Custom VCU — In-House Vehicle Control Unit (SR-18)

**Where:** Spartan Racing, Formula SAE — Software Lead
**Timeline:** 2026 – present (active)
**Stack:** C, STM32H755 (dual-core), CAN, GPIO/ADC/PWM drivers, real-time OS, watchdog
**Repo:** SRE-VCU, `vcuport` branch
**Added 2026-08-16** from the Aug 12 2026 Electronics & Software meeting deck.

**What it is:** Replacing the vendor TTC 60 VCU with an in-house controller. Two
halves: an OS/driver layer on the STM32H755, and a "seam" port of the existing
5,400-line production firmware onto it.

The seam idea is the part worth explaining. The sensor and CAN layer is fixed as
the interface. Everything *below* the seam is rewritten for the new silicon;
everything *above* it — the control logic the team has been building for years —
is adapted with minimal modification. The team keeps a codebase it already knows,
and the rewrite stays confined to driver and OS level.

**Status as of Aug 12 2026:**
- Done: 10 ms control task, watchdog that reboots on control-task hang, CAN
  driver sending and receiving on both buses, seam foundations (sensors,
  mathFunctions, sensorCalculations, vcuInputs/vcuOutputs), 4,100 of 5,400 lines
  refactored
- To do: GPIO driver, ADC/PWM driver, canManager, replacing stubs with real
  CAN/GPIO, more console commands, dual-bus test on two live buses
- Hardware blockers: IO ports need soldering to the dev board; the STM32H755
  analog pins are **not 5 V tolerant**, so the analog lines need voltage dividers

**What it proves:** embedded program ownership at a scale most undergraduates
never touch — silicon selection, OS and driver bring-up, a deliberate migration
strategy for a large existing codebase, real-time task scheduling, watchdog
design, and dual-bus CAN.

**Caution:** the console banner reads "Roku LT OS — Copyright 2026, Roku, Inc."
Find out exactly what that OS is and where it came from before describing it in
an interview. Claim the CAN driver, the seam strategy, and the program — those
are unambiguous.

---

## Torque Vectoring & Traction Control (SR-18)

**Where:** Spartan Racing, Formula SAE — Software Lead
**Timeline:** 2026 – present (**scoped, not yet running**)
**Stack:** C, four independent motors, IMU, wheel speed sensors, AMK inverters

**What it is:** Two stacked controllers for a four-motor car. Torque vectoring
splits torque across the wheels; traction control sits on top, computing a
per-wheel torque limit and handing it down.

The control loop, every 5 ms: read wheel speeds, IMU, pedal and brake → safety
check (fault or not in drive → zero torque) → estimate car speed → per-wheel slip
→ per-wheel torque limit → hand limits to torque vectoring → clamp to 80 kW and
send one CAN command per inverter.

`slip = (wheel speed × wheel radius − car speed) / (wheel speed × wheel radius)`

**The interesting problem:** a four-motor car has no measured ground speed, so it
has to be estimated — integrate the IMU and correct toward the least-spinning
wheel. Good whiteboard answer today, even though nothing runs yet.

**Open items:** verify AMK motor speed data decodes correctly (right bytes, right
units) before trusting any of it.

**What it proves:** control system design from scratch, sensor fusion under
missing measurements, real-time budgeting, layered controller architecture.

**Status discipline:** this is `proposed`. Do not let it drift into past tense.

---

## MIL / SIL / HIL Plant Modeling (SR-18)

**Where:** Spartan Racing, Formula SAE — Software Lead
**Timeline:** 2026 – present
**Stack:** battery, BMS, motor and inverter plant models; VCU control code under test

**What it is:** Plant models of the vehicle's electrical driveline so VCU control
code can be exercised against a simulated car before touching hardware. Battery,
BMS, motor and inverter models are substantially complete; the work now is
integration and code standards across a seven-engineer team so independently
built models compose into one testbench.

**What it proves:** validation architecture, interface standardization across
multiple developers, and the discipline of testing control code before it can
damage a car. Pairs directly with the SIL replay harness below — that one replays
recorded data, this one simulates the plant.

---

## VCU Build & Release Pipeline (SR-18)

**Where:** Spartan Racing, Formula SAE — Software Lead
**Timeline:** 2026 – present
**Stack:** CI, build infrastructure, storage, sponsorship-funded compute

**What it is:** A real build and release pipeline for VCU firmware, plus the
infrastructure sourcing to pay for it — a categorized list of 120+ target
companies across hardware, storage, refurb cloud, VPS, dev infra, networking,
ISP, embedded, SBC, cellular, IoT, and satellite.

**What it proves:** the unglamorous half of engineering leadership. You identified
that the team's release process needed infrastructure, specified what it needed,
and went after funding rather than waiting for it. Also genuine CI/build-system
exposure, which is rare on a student resume.

**Open item:** integrate the modeling work into the pipeline; finish PDR.

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

**Where:** Spartan Racing, Formula SAE — contributor → Software Lead (dash firmware)
**Timeline:** Feb 2026 – present
**Stack:** C, STM32H7, CAN, SPI

**What it is:** Real-time driver display over CAN showing HV voltage, throttle,
cell temperature, and power budget, with an energy bar and LED alert system for
lap-by-lap energy feedback.

**What it proves:** STM32 bare-metal/RTOS work, SPI display driving, real-time
CAN consumption, driver-facing UX under hard timing constraints.

**Updated 2026-08-16:** now carrying onto new SR-18 hardware — a three-CAN STM32
board (third transceiver added, pins reassigned) laid out by the electronics
side. You lead the firmware; the board is not yours. This does not appear in the
Aug 12 meeting deck, so the deck is not evidence for it — note somewhere what is.

**Repo / artifacts:** _fill in_

---

## Custom BMS Firmware (SR-18)

**Where:** Spartan Racing, Formula SAE — Software Lead (firmware side)
**Timeline:** 2026 – present
**Stack:** BMS controller firmware, ADBMS2950 HV and current sense, SoC estimation

**What it is:** Firmware for an in-house battery management system. The ADBMS2950
front end is a significant change for state-of-charge measurement over the
previous architecture, along with a new LDO architecture for LV power and an
on-board shunt.

**Scope boundary — important.** The BMS controller and follower *boards* are
owned by electronics designers (Hendson, Alex). Say "BMS firmware" or "software
for the BMS", never "designed the BMS". The distinction costs you nothing and
protects the rest of the story.

**What it proves:** safety-critical embedded firmware, cell monitoring, analog
front-end integration, estimation on a high-voltage system.

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
