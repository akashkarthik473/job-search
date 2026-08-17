# Tesla — Internship, Firmware Engineer, New Programs Engineering (Winter/Spring 2027)

- **Job URL:** https://www.tesla.com/careers
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** embedded_controls
- **Referral / contact:**

**Logistics — decide before applying.** The term is **Winter/Spring 2027**, which
overlaps your **final semester** (graduating May 2027). Tesla internships are
full-time, on-site, ~40 hrs/week for the duration of the term. That means either
a reduced course load or a delayed graduation, and Tesla asks about availability
in the application itself. You are also currently holding Argus Defense
(Feb 2026–present) **and** Spartan Racing Software Lead (Jun 2026–present) — a
Winter/Spring internship would end both. Have your answer ready; it will be the
first recruiter-screen question.

## Step 1 — Actual job family

Embedded firmware, automotive, at the **vehicle integration** level. Note what
this is *not*: no control-theory language anywhere in the posting, no algorithm
design, no ML. What they describe is **defining hardware/software interfaces,
writing C for a real-time target, and debugging how subsystems interact on a
vehicle** — prototype-phase firmware for new vehicle programs.

The "outside of the box" and "prototype" framing means bring-up work: parts that
do not have documentation yet, buses that do not behave as specified, and
subsystems whose behavior you have to define rather than inherit.

→ Base: **embedded_controls**, retilted from *controls* toward *firmware, buses,
and integration debug*.

## Step 2 — Top 5 technical requirements

1. **High-quality C in a real-time embedded environment**
2. **Embedded communication protocols** — CAN, LIN, I2C, SPI (called "a big plus")
3. **Defining HW/SW interfaces and specifying subsystem behavior** on prototype hardware
4. **Debugging interactions between subsystems at the vehicle level**
5. **FSAE / Solar Racing / Hyperloop** — named explicitly as a plus

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id |
| --- | --- | --- |
| High-quality C, real-time embedded | Power-limiting firmware on the TTC 60 VCU; fixed-point PI with saturation, anti-windup, slew limits for deterministic execution; flight-control firmware in C on PX4; STM32H7 dashboard | `fsae-power-limit-firmware-emb`, `fsae-fixed-point-pi-sim`, `argus-firmware-c-emb`, `dash-can-display-emb` |
| CAN / SPI | CAN diagnostics firmware (frames, status bits, error counters); DBC-driven decoding and bus capture; STM32H7 dashboard over SPI | `fsae-can-diagnostics-emb`, `srcan-can-tooling-emb`, `dash-can-display-emb` |
| Define HW/SW interfaces, specify subsystem behavior | Deterministic entry/exit state logic defined from measured power, requested torque, threshold flags; CAN frame/DBC definitions are literally an interface spec | `fsae-state-logic-emb`, `fsae-can-diagnostics-emb` |
| Debug vehicle-level interactions | **Decoded an undocumented VCU flashing sequence off CAN trace captures and reimplemented it** — the single best proof you can debug a bus interaction nobody documented; plus on-vehicle test campaigns and log review | `srcan-flash-protocol-emb`, `fsae-onvehicle-test-sim` |
| FSAE | Three years on Spartan Racing, now Software Lead. 1st in endurance at MIS EV 2025 | `lead-custom-vcu-program-emb`, `fsae-endurance-result` |
| **Prototype bring-up on undocumented hardware** | **Custom in-house VCU on STM32H755** — CAN driver on both buses, 10 ms control task, watchdog, and the analog front-end spec for putting the board on the car | `lead-custom-vcu-program-emb`, `lead-vcu-can-driver-emb` |

**Requirements I have no evidence for** (interview prep, not resume lines):

- **LIN and I2C.** You have CAN and SPI, not these. Do **not** add them to the
  skills line. If asked: LIN is a single-wire, master/slave, low-speed body-network
  bus — say you have not used it and that the CAN work transfers. Same for I2C.
- **RTOS.** *Partially closed 2026-08-16 — see below. Still do not put "RTOS" on
  the skills line.* Listed as a plus. Your embedded work is superloop/scheduled-task
  firmware on the VCU and PX4 (PX4 uses NuttX, but you were writing control modules,
  not RTOS-level code — do not claim NuttX experience you do not have). Know the
  concepts: preemption, priority inversion, task scheduling, ISR-to-task handoff.
- ~~**Device drivers written from scratch / datasheet-to-register bring-up.**~~
  **Closed 2026-08-16.** You built the CAN driver for the custom VCU from scratch,
  on both controller buses, and GPIO and ADC/PWM drivers are next. You also caught
  from the datasheet that the STM32H755 analog pins are **not 5 V tolerant** and
  specified voltage dividers before the board went near the car. That is
  datasheet-to-register bring-up, and it was the single largest gap against this
  posting. It is now the second bullet under Software Lead.
- **Cross-functional with electrical/mechanical/manufacturing.** *Still unclaimed,
  and still your largest unclaimed strength.* Confirmed 2026-08-16 that it is true
  — software and electronics run a **joint** weekly meeting, and your projects
  depend on boards owned by electronics designers (BMS, dash, PDU, harness). But
  there is still **no bullet in the bank that says so**, so nothing on the resume
  claims it. Write one into `master/bullet_bank.md` and it becomes usable
  everywhere. Until then, it is an interview answer — and you now have concrete
  examples to give.

## Step 4 — Changes made to the base

Starting from `bases/embedded_controls.tex`:

- **Skills** — split into `Languages / Embedded / Protocols & Buses / Firmware &
  Controls / Tools`. C leads (was "C/C++" — now C and C++ separately, since the
  posting says C first and twice). **A dedicated Protocols & Buses line was added**
  because the posting calls buses "a big plus"; it names CAN, SPI, DBC signal
  definitions, diagnostics, trace analysis, and flashing over CAN. Controls was
  demoted to fourth and renamed "Firmware & Controls" — this is not a controls
  role. **No LIN, no I2C, no RTOS.**
- **Argus Defense** — reordered to lead with the C firmware bullet
  (`argus-firmware-c-emb`). PID and VIO follow. The base led with PID tuning,
  which reads as controls; this posting wants C firmware first.
- **Software Controls Engineer** — swapped `fsae-energy-mgmt-emb` (the
  lap-adaptive energy algorithm, `0.01%`) **out** and `fsae-fixed-point-pi-sim`
  (borrowed from the simulation base) **in**. The energy-management bullet is your
  best *controls* bullet, but "fixed-point PI with saturation, anti-windup, and
  slew limits for **deterministic** execution" is your best *real-time firmware*
  bullet, and that is what was asked for. Power-limiting firmware leads, CAN
  diagnostics closes.
- **Projects reordered — SR-Wireless-CAN first, Dashboard second.** The flashing
  bullet (`srcan-flash-protocol-emb`) is the strongest thing on the page for this
  posting: reverse-engineering an undocumented VCU flashing sequence off bus
  captures *is* "understand and debug interfaces/interactions required for
  vehicle-level firmware", and it is the "outside of the box" evidence they ask
  for. Second SR-Wireless-CAN bullet swapped from `srcan-backend-lead-swe`
  (FastAPI/React — irrelevant here) to `srcan-can-tooling-emb` (CAN capture and
  diagnostics tooling with DBC decoding).
- Dashboard kept, unchanged, for the STM32H7 / CAN / SPI hardware evidence.

No new claims were introduced. Every bullet is verbatim from
`master/bullet_bank.md`; only ordering, selection, and the skills lines changed.

### Revision 2026-08-16 — custom VCU material added

The Aug 12 2026 Electronics & Software meeting deck surfaced work that was not in
the bullet bank when this resume was tailored. **Software Lead's two generic
bullets** ("lead software planning", "coordinate priorities") were replaced with:

1. `lead-custom-vcu-program-emb` — the in-house STM32H755 VCU program, 10 ms
   deterministic control task, watchdog
2. `lead-vcu-can-driver-emb` — the CAN driver on both buses plus the analog
   front-end spec for bring-up

Both are **condensed** from the bank wording to hold one page; the claims are
unchanged. This is the biggest single improvement to this application: the old
bullets said nothing a reader could evaluate, and these hit requirements 1, 3, and
4 directly while closing the driver-bring-up gap in Step 3.

**Held back for space** — `lead-vcu-seam-port-emb` (the 5,400-line seam port).
It is the best evidence for requirement 3, *defining HW/SW interfaces*, and it is
the first thing to swap in if you cut a line elsewhere. Consider trading the
Dashboard project bullet for it — the STM32H7/CAN/SPI evidence it provides is
now partly duplicated by the custom VCU bullets.

**Tense check.** Both new bullets are present-tense ("Leading", "Built its CAN
driver"). The VCU is not on the car yet — GPIO/ADC/PWM drivers, canManager, the
soldered IO ports, and the voltage dividers are all outstanding. If asked "is it
running?", the honest answer is that the control task, watchdog, and CAN driver
are up on the dev board and vehicle integration is in progress. Do not let this
drift into "built and deployed a custom VCU."

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched
- [x] Every metric is one I can defend — only `2%` (torque-controller error,
      defined 2026-08-03) and `1st in endurance` appear. **`1st in endurance` is
      still flagged VERIFY in the bank** — confirm it was endurance specifically,
      not overall, before submitting. `0.01%` and `32%` do not appear on this
      version.
- [x] Titles and dates are consistent with every other version
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Tesla Resume.pdf`
- [x] Company name appears in the filename only, never inside the document
- [x] Tracker row added in `tracker/applications.csv`

## Interview prep — likely questions

- **"Walk me through the flashing protocol work."** This is what gets you the
  interview, so have it tight: what the captures looked like, how you identified
  the sequence and the addressing, how you handled acknowledgements and errors,
  and what you would do differently with a spec in hand. Expect "what if you had
  bricked the VCU?" — have a recovery answer.
- **"Why fixed-point instead of floating-point?"** Determinism, cycle cost, no
  FPU. Know your Q-format and how you chose it.
- **"How do you debug something on the bus that does not match the spec?"** Their
  bullet 5, almost verbatim. Answer with the diagnostics firmware: status bits,
  error counters, live BusMaster monitoring, and reproducing off-vehicle from
  recorded traces.
- **"How would you define an interface between your subsystem and another team's?"**
  Answer in CAN terms — DBC, signal ownership, units and scaling, update rate,
  timeout/staleness behavior, and what happens on a missing frame. You have done
  this; make sure you say the failure-mode half, not just the signal-list half.
- **"Have you used an RTOS?"** *Answer upgraded 2026-08-16.* Still say you have
  not shipped on a commercial RTOS. Then go straight to the custom VCU: a 10 ms
  deterministic control task with a watchdog that reboots the controller if the
  task hangs. That is task scheduling and fault recovery, which is what they are
  actually probing for. **Know what the OS on that board is before you say this** —
  the console banner reads "Roku LT OS, Copyright 2026, Roku, Inc.", and if you
  cannot say where it came from, describe only the control task and watchdog.
- **"Tell me about the driver you wrote."** New and likely, since the CAN driver
  is now on the page. Be ready on: dual-bus configuration, filtering, the
  transmit/receive path, and why testing needs two live buses simultaneously
  (still outstanding). Also have the 5 V-tolerance catch ready — reading a
  datasheet closely enough to stop a board from being damaged is exactly the
  instinct this posting is hiring for.
- **Availability.** See the logistics note at the top. Do not improvise this one.

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-12 | Tailored resume prepared |
| 2026-08-16 | Software Lead bullets replaced with custom VCU program + CAN driver; driver-bring-up gap closed. Still not submitted — availability decision outstanding. |
