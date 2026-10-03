# Zipline — System Validation Intern

- **Job URL:** https://www.flyzipline.com/careers
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** simulation_robotics
- **Referral / contact:**

**Not stated in the posting excerpt — ask or look up before submitting:** term
(summer 2027 vs. a school-year term), location (South San Francisco HQ vs. one of
the operational sites), and whether it requires enrollment through the internship.
Summer 2027 occurs before a December 2027 graduation, so the timing itself is
compatible; confirm the exact term and enrollment requirement before submitting.

## Step 1 — Actual job family

**System-level validation and test engineering.** Read the seven bullets: execute
HIL and flight tests, build automated pipelines that gate software before flight,
build tools that stress the system off-nominal, troubleshoot what the tests find,
write and run validation plans, script the workflows. Not one of them asks you to
design a controller or write flight software.

The distinguishing word is **"system of systems"** — Zip (the aircraft), Droid
(the delivery droid), Dock. The interesting failures are in the *interactions*
between them, which is why the posting leads with HIL: you cannot fly three
systems together often enough to find integration bugs that way.

→ Base: **simulation_robotics**, retilted hard from *controls and perception*
toward *test infrastructure, HIL/SIL, and integration debug*. This is the base's
home territory — the README calls it "build a controller, simulate it, instrument
it, validate it, and debug it on real hardware," and this posting wants the last
three verbs.

**This is the best-matched posting in the repo so far.** Tesla and Haast were
close on domain; this one is close on *the actual job*. Nearly every line of the
posting has a bullet already in the bank, which almost never happens.

## Step 2 — Top ~5 technical requirements

1. **Executing HIL tests, and flight tests, to validate interaction between
   separately owned subsystems**
2. **Automated pipelines that test software before it is deployed** — CI as a
   gate, built with engineers from other teams
3. **Tools that stress-test the system in off-nominal cases**
4. **Analyzing and troubleshooting hardware *and* software issues found during
   testing** — note "hardware and"; they want someone who does not stop at the
   software boundary
5. **System-level validation plans, executed with a multidisciplinary team**, and
   the Python scripting/tooling underneath all of it

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id from bullet_bank.md |
| --- | --- | --- |
| HIL / SIL to validate subsystem interaction | Leading the MIL/SIL/HIL effort — battery, BMS, motor, and inverter plant models so control code runs against a simulated vehicle before hardware; derating code validated through SIL and HIL | `lead-plant-models-sim`, `lead-derating-oversight-emb` |
| Flight test | **Actual flight testing on a real aircraft** — embedded flight-control changes in C, gains iterated through repeatable flight tests and log review, VIO evaluated against logged telemetry. Very few interns applying to this req have flown anything | `argus-repeatable-flight-tests-sim`, `argus-vio-eval-sim`, `argus-pid-drift-sim` |
| Automated pipelines gating software | Standing up a build and release pipeline for control-unit firmware and specifying the CI, compute, and storage it needs; SIL replay harness that reruns the real controller against recorded logs; regression suite in pytest/GitHub Actions | `lead-release-pipeline-swe`, `fsae-sil-replay-sim`, `fsae-desktop-sim-regression-sim` |
| Tools that stress off-nominal cases | Desktop simulator plus regression suite that reproduces **field scenarios** and runs controller parameter sweeps; headless batch runs with seeded scenarios; GPU-accelerated derating sweeps | `fsae-desktop-sim-regression-sim`, `vsim-headless-batch-sim`, `lead-derating-oversight-emb` |
| Troubleshooting hardware and software found in test | Diagnostics firmware with status bits and error counters for live monitoring; on-vehicle tests with response and latency measured; **decoded an undocumented flashing sequence off bus captures** — the strongest available proof of debugging at the hardware boundary | `fsae-can-diagnostics-emb`, `fsae-onvehicle-test-sim`, `srcan-flash-protocol-emb` |
| System-level validation plans, multidisciplinary team | Code standards and an integration plan for a modeling team of 7 senior engineers so independently built subsystem models compose into one testbench — that is a system-of-systems integration problem in miniature; weekly written technical review across 10+ projects | `lead-model-integration-standards-sim`, `lead-weekly-review-cadence-swe`, `lead-org-scale` |
| Reproducing test runs off the vehicle | Replay of recorded bus traces plus simulated and hardware capture modes, so a run can be re-examined without the vehicle | `srcan-replay-sim`, `srcan-monitoring-modes-sim` |

**Requirements I have no evidence for** (interview prep, not resume lines):

- **A real HIL rig — hardware, wiring, and I/O simulation.** Be precise about
  this one. What you are leading is plant *modeling* with control code under
  test; the models are substantially complete and the integration is in progress.
  You have not built a bench with a physical controller wired to simulated
  sensors and actuators in a loop. Say "MIL and SIL are running, HIL is the
  direction we are building toward" and do not let the resume word "hardware-in-
  the-loop" get read as a rig you built. This is the single most likely place to
  be caught overclaiming on this application.
- **Aviation domain — airworthiness, UAS regulation, Part 107/135, DO-178C.**
  None. Safety-critical *practice* you have (a hard 80 kW limit, HV battery work,
  a watchdog that reboots a hung control task); safety-critical *process* you do
  not. Do not imply otherwise; it is an intern req and they are not expecting it.
- **Fault injection as a discipline.** You have seeded scenarios, parameter
  sweeps, and field-scenario replay — that is off-nominal coverage by
  *reproduction*, not by *injection*. You have never deliberately corrupted a
  message, dropped a frame, browned out a rail, or delayed a sensor to see what
  breaks. Requirement 3 is asking for exactly that, so have an answer for how you
  *would* build it: start from the interface list, enumerate the failure modes
  per signal (missing, stale, out-of-range, wrong units), and drive each one from
  the test harness. You have the right raw material — the DBC/CAN interface work
  is precisely where those failure modes live.
- **ROS / ROS 2.** None. Not named in the posting, but likely in the stack.
- **Test infrastructure at fleet scale** — labs, device farms, distributed
  runners. Your CI experience is a pipeline you are standing up now, plus
  GitHub Actions and Docker Compose. Real, but small. Say the scale honestly.
- **Three-system integration.** You integrate subsystems within one vehicle, not
  three separately owned products that meet in the field. Closest honest analog:
  models from seven engineers that have to compose into one testbench, and the
  interface standards you wrote to make that possible.

## Step 4 — Changes made to the base

Starting from `bases/simulation_robotics.tex`:

- **Skills restructured into five lines**, ordered by the posting:
  `Validation & Test / Test Automation / Flight & Robotics / Debug / Languages`.
  Validation leads because that is the job title. A **Test Automation** line was
  added outright — the base had no line for pipelines, CI, or batch execution,
  and requirement 2 is entirely about that. **Debug** was split out from the old
  "Data & Tools" line, because requirement 4 asks for troubleshooting explicitly.
  Languages moved last, as on the Haast version: for this reader, *what you
  validate with* matters more than *what you type in*.
- **Software Lead rewritten from the current bank.** The Haast version of this
  base still carries the old generic Lead bullets ("lead validation strategy",
  "define testable software requirements"); those were replaced repo-wide on
  2026-08-16 and are not used here. This version uses `lead-plant-models-sim`
  (HIL), `lead-model-integration-standards-sim` (system-level integration), and
  the pipeline half of `lead-release-pipeline-swe`. The org-scale bullet
  (12 engineers / 10+ projects) was **dropped** — it is a leadership credential
  and the three slots are worth more spent on validation content.
- **`lead-release-pipeline-swe` condensed.** The bank bullet ends with
  "...and driving sponsorship outreach to 120+ hardware, cloud, and
  developer-infrastructure companies to fund it." That half was cut: it is a real
  accomplishment but it reads as fundraising, and the pipeline half is what
  answers requirement 2. Claim unchanged.
- **Argus reordered** to lead with `argus-repeatable-flight-tests-sim` —
  "iterated gains through repeatable flight tests and log review" is the closest
  sentence in the whole bank to "assist in executing flight tests." VIO and PID
  follow as what was being tested.
- **Software Controls Engineer retilted from controls to test.** Dropped
  `fsae-fixed-point-pi-sim` (fixed-point PI, anti-windup, slew limits) — the best
  controls bullet in the bank, and the wrong one here. Kept the SIL replay
  harness and the on-vehicle test campaign, and swapped in `fsae-can-diagnostics-emb`
  for troubleshooting evidence, reworded from "for real-time BusMaster
  monitoring" to "during test" so it reads as instrumentation rather than
  automotive tooling.
- **Software Intern cut to two bullets** — the desktop simulator and regression
  suite (requirement 3: reproduces field scenarios, runs sweeps) plus the
  endurance result. Dropped `fsae-pi-state-logged-sim`, which is controls again.
- **Projects: SR-Wireless-CAN first, retitled "Telemetry Capture, Replay &
  Flashing Platform", with `srcan-replay-sim` promoted above the flashing
  bullet.** This is deliberate and worth remembering: the flashing bullet is the
  best single item in the bank, but "replay of recorded traces plus simulated and
  hardware capture modes, so test runs could be reproduced off the vehicle" is
  what a validation engineer is actually shopping for. Flashing still appears,
  one line down, and will still get asked about.
- **Posture Detection dropped**, Vehicle Dynamics Simulation kept — no CV content
  in this posting, and the simulator's headless batch runs and seeded scenarios
  are direct requirement-3 evidence.
- **Vehicle vocabulary left in place.** Unlike the Neuralink version, nothing was
  genericized away from cars here. Zipline's own postings are full of vehicles,
  fleets, and flight tests; a reader in this role has no trouble mapping a
  racecar testbench onto an aircraft testbench, and hiding the domain would cost
  more than it gains.

Several bullets were condensed for one page. No new claims; every bullet traces
to an id in `master/bullet_bank.md`.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched — the HIL, integration-
      standards, and pipeline bullets are present tense ("Leading", "Standing
      up"). See the HIL caveat in Step 3: **models and SIL are real, a physical
      HIL rig is not.**
- [ ] Every metric is one I can defend — only `7 senior engineers` and
      `1st in endurance` appear, and **both are flagged VERIFY in the bank.**
      *Corrected 2026-08-21: the 7 counts senior modeling engineers only; new
      members and interns are additional, so this understates the team rather
      than overstating it — the safe direction to be wrong in. If asked "how
      big is the team?", give the full number and say the 7 are the ones who
      own models.* Also confirm the MIS EV 2025 result was endurance
      specifically, not overall. `0.01%`, `2%`, `5,400`, and `32%` do not appear on this version.
- [x] Titles and dates are consistent with every other version
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Zipline Resume.pdf`
- [x] Company name appears in the filename only, never inside the document
- [x] Tracker row added in `tracker/applications.csv`
- [x] One page

## Interview prep — likely questions

- **"Walk me through your HIL setup."** The highest-risk question on this
  application. Answer in layers and be exact about which layer is running: plant
  models of battery, motor, and inverter; control code under test against them;
  SIL replay of recorded logs through the real controller; on-vehicle testing
  with response and latency measured. Then say plainly what is not built yet.
  Volunteering the boundary is what makes the rest credible.
- **"How would you test a system you can only fly a few times a week?"** Their
  whole reason for having this role. Push everything you can below flight —
  models, replay, sweeps, regression — and spend flight time only on what
  genuinely cannot be simulated. You have made this exact tradeoff: the desktop
  simulator exists because track time was scarce.
- **"How do you test off-nominal cases?"** Weakest of the five. Give the honest
  version — today you reproduce recorded field scenarios and sweep parameters —
  then give the design: enumerate failure modes per interface signal (missing,
  stale, out-of-range, wrong scaling, duplicated) and drive them from the
  harness. Reference the DBC/interface work as where you would get the list.
- **"A test fails. Walk me through what you do."** Requirement 4. Use a real one:
  reproduce it off the vehicle from the recorded trace, isolate whether it is the
  controller or the bus using status bits and error counters, then bisect against
  the replay harness. The point to land is that you built the tooling that makes
  reproduction possible, rather than debugging live on the hardware.
- **"Tell me about integrating work from people who do not report to you."**
  The seven-engineer modeling team, code standards, and one composed testbench.
  Say what went wrong before the standards existed — that is the interesting half.
- **"What is the difference between validating a racecar and a delivery drone?"**
  Have an answer. Consequence and reversibility: a bad build on the car costs a
  session, a bad build in flight costs an aircraft and possibly a delivery someone
  is waiting on. That pushes the gate earlier — more simulated coverage, stricter
  release criteria, and no "we'll catch it at the track."
- **Why Zipline.** Mission-driven posting, and "life-saving goods" is not
  marketing here. Have one honest sentence; do not oversell it.

## Gaps worth closing in the bank

1. **A fault-injection or off-nominal bullet.** If anything in the SIL harness or
   the simulator injects a failure — a dropped frame, a stale signal, a sensor
   out of range — write it up. Requirement 3 is the weakest row in the evidence
   map and the cheapest to fix if the work already exists.
2. **Cross-functional work with electronics.** Third application in a row where
   this is true, unclaimed, and directly asked for ("multidisciplinary team",
   "hardware and software issues"). Flagged on Tesla 2026-08-16 and Neuralink
   2026-08-16 and still open. Write the bullet.
3. **The HIL milestone.** When control code first runs against the plant models
   on real hardware in a loop, that converts the single most valuable claim on
   this resume from in-progress to completed. Note the date when it happens.

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-21 | Tailored from `simulation_robotics`; one page; term and location still unconfirmed |
|  | Applied |
