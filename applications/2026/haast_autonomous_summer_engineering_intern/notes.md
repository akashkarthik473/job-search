# Haast Autonomous — Summer Engineering Intern

- **Job URL:**
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A — **highest-fit posting so far**
- **Base used:** simulation_robotics
- **Referral / contact:**

## Why this is the best match you've had

They name **PX4** and **Formula SAE** in their own nice-to-haves. You do PX4
autonomous flight work *professionally* and have three years of Formula SAE.
Their "nice to have" list reads like a description of your resume:

| Their nice-to-have | You |
| --- | --- |
| Drones, aircraft, autonomy | Argus Defense — PX4 autonomous flight, right now |
| PX4 / ArduPilot | PX4 flight-control firmware in C, PID tuning, VIO |
| Formula SAE (named explicitly) | Aug 2024 – present, now Software Lead |
| Controls | Fixed-point PI, PID, anti-windup, slew limiting |
| Simulation | Vehicle simulator + SIL replay harness |
| Flight testing | Repeatable flight tests, gain iteration from logs |
| Python, electronics | Throughout |
| "Something that had to actually work in the real world" | A car that won endurance at MIS EV 2025 |

They also say they care about "agency, ownership, taste, and evidence that you
can build" over bullet-point matching. The wireless-flashing story is exactly
that evidence: nobody asked you to, the protocol was undocumented, you decoded
it off bus captures and built the tool. **Lead with that in any cover letter or
interview.**

## ⚠ Two things to resolve before applying

1. **No location is stated in the posting.** VTOL aircraft with a hangar and
   flight testing means this is emphatically not remote. Find out where before
   you spend time on it.
2. **"Summer" with no year.** Captured Aug 2026, so this is almost certainly
   Summer 2027 — by which point you'll have graduated (May 2027). They say
   "pursuing a degree," which you are *now* but won't be *then*. Ask. At a
   company this early the honest move is to say you graduate in May 2027 and ask
   whether they'd consider you for a full-time or new-grad role instead. That
   conversation may well go better than the internship one.

Neither is a reason not to apply. Both are reasons to ask in your first message.

## Step 1 — Actual job family

Aircraft development at a seed-stage startup, spanning airframe → avionics →
controls → simulation → flight test. You are a software person, so your lane is
**avionics, controls, simulation, and flight-test support**. Do not pretend to be
a mechanical engineer; they explicitly say "according to your background."

→ Base: **simulation_robotics** — the controller/simulate/instrument/validate/
debug-on-hardware story is exactly what a small flight-test team needs.

## Step 2 — Top 5 things they actually want

1. Hands-on work with real autonomous aircraft hardware
2. Avionics / controls / flight-control software
3. Simulation and analysis tooling
4. Flight-test support: preparation, data review, design iteration
5. Agency — self-directed ownership in an ambiguous, fast-moving environment

## Step 3 — Evidence map

| What they want | My evidence | Bullet id |
| --- | --- | --- |
| Autonomous aircraft, avionics | PX4 flight-control firmware in C; PID loop tuning to cut position drift | `argus-firmware-c-emb`, `argus-pid-drift-sim` |
| Autonomy / state estimation | Visual-inertial odometry integration and tuning for onboard state estimation | `argus-vio-eval-sim` |
| Flight-test support + data review | Repeatable flight tests, gain iteration from log review | `argus-repeatable-flight-tests-sim` |
| Simulation tooling | Physics-based vehicle simulator; headless batch runs, seeded scenarios, CSV/plots | `vsim-preflight-eval-sim`, `vsim-headless-batch-sim` |
| Turning test results into improvements | SIL replay harness validating changes against recorded logs; on-vehicle test campaigns with response/latency plots | `fsae-sil-replay-sim`, `fsae-onvehicle-test-sim` |
| Controls | Fixed-point PI with saturation, anti-windup, slew limits | `fsae-fixed-point-pi-sim` |
| Hardware bring-up / ambiguity | **Wireless flashing** — decoded an undocumented protocol off CAN traces and reimplemented it | `srcan-flash-protocol-emb` |
| "Worked on vehicles / hard systems" | Formula SAE, three years, now Software Lead | `lead-validation-strategy-sim` |

**Things I don't have — be upfront about these:**

- **CAD / SolidWorks, 3D printing, composites, manufacturing.** Nothing. They're
  nice-to-haves and they explicitly don't require every bullet, but do not imply
  otherwise. If asked: you're a software/controls person who is willing to be in
  the hangar.
- **MATLAB.** Python covers the same ground for them.
- **Fixed-wing / VTOL aerodynamics.** Your PX4 work is multirotor-flavoured.
  Don't overclaim aircraft-design knowledge.

## Step 4 — Changes made to the base

Starting from `bases/simulation_robotics.tex`:

- **Argus Defense moved to the top of Experience.** Autonomous flight is the
  whole company; it should be the first thing they read, not the second.
- **Skills regrouped** into `Flight & Autonomy / Controls / Simulation & Test /
  Languages & Tools`, so PX4, VIO, and flight testing are visible in the first
  two lines instead of buried in a "Robotics & Perception" line.
- **SR-Wireless-CAN swapped in for Posture Detection.** Posture detection is
  webcam CV and earns nothing here; the flashing and telemetry work is hardware
  bring-up under ambiguity, which is the trait they say they hire for.
- **Vehicle Simulation kept** — a simulator you built to evaluate control changes
  before touching hardware is directly what a flight-test team wants.
- **Endurance win kept.** "Something that had to actually work in the real world"
  is one of their bullets; a car that won is the proof.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched
- [x] No unverifiable metric on this version — the `0.01%` / `2%` figures are
      defined, and the Sailfish 32% isn't on this resume
- [ ] **"1st in endurance at MIS EV 2025"** — still unconfirmed in the bank.
      Verify it was 1st in endurance specifically, not overall.
- [x] Titles and dates consistent with every other version
- [x] SR-Wireless-CAN scope confirmed (backend lead)
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Haast Autonomous Resume.pdf`
- [x] Company name appears in the filename only
- [x] Tracker row added

## Interview prep

- **Lead with the flashing story.** It is the single best demonstration of the
  agency they say they're hiring for. Undocumented protocol, your own
  initiative, decoded from captures, shipped as a tool.
- "What would you own here?" — have an answer. Flight-log analysis tooling, a
  SIL harness for their autonomy stack, or automated flight-test regression are
  all things you've built analogues of and a seed-stage team almost certainly
  lacks.
- Expect questions on VIO failure modes (low texture, fast motion, lighting) and
  on why position drift happens.
- They're early — ask what their flight-test cadence looks like and where the
  process is thinnest. That question alone will separate you.
- **Medical logistics is the mission.** Say something true about why moving
  blood and organs on demand matters to you, or don't raise it at all.

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-03 | Tailored resume prepared |
