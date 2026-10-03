# Neuralink — Firmware Engineer Intern (Surgery Robotics)

- **Job URL:** https://neuralink.com/careers/
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** embedded_controls
- **Referral / contact:**

## Step 1 — Actual job family

**Embedded firmware for a robot**, on the surgical-robotics team. Two things to
notice about the posting.

First, the responsibilities are ordinary firmware-team responsibilities —
write embedded software, write drivers, retire legacy code, test it, review each
other's code, pick the hardware for the next platform. There is no control theory
in the responsibilities section at all. The controls background is supporting
evidence here, not the headline.

Second, the preferred-qualifications block is written for a **Linux-class**
embedded engineer as much as an MCU one: embedded Linux, kernel configuration,
device tree, kernel drivers, ARM bootloaders, PCIe/MIPI/USB/802.3. That half of
the list is a genuine gap (Step 3). The other half — MCU bring-up, ARM cores,
drivers for sensors and actuators, SPI, C/C++, toolchains, MCU architecture and
peripheral integration, datasheets — is where the whole application lives.

→ Base: **embedded_controls**, retilted from *controls* toward *driver
development, MCU bring-up, legacy-code migration, and validation*.

## Step 2 — Top ~5 technical requirements

1. **Embedded C/C++ for robotics, developed and optimized on real hardware**
2. **MCU bring-up on ARM, drivers for sensors and actuators, peripheral
   integration** — the "create new embedded systems from scratch" half
3. **Refining and, when necessary, retiring legacy embedded software** — called
   out as its own responsibility, which is unusual and worth aiming at
4. **Rigorous testing and validation to the highest safety and reliability
   standards** — surgical robot; this is the differentiator, not a checkbox
5. **Interpreting schematics and datasheets, specifying hardware/software choices
   for future platforms**, in a cross-functional team with code review

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id from bullet_bank.md |
| --- | --- | --- |
| Embedded C/C++ on real hardware, optimized | Power-limiting firmware on the TTC 60 VCU; fixed-point PI with saturation, anti-windup, slew limits for deterministic execution; flight-control firmware in C on PX4 iterated against logged telemetry | `fsae-power-limit-firmware-emb`, `fsae-fixed-point-pi-sim`, `argus-firmware-c-emb` |
| MCU bring-up on ARM, drivers, peripheral integration | **Custom STM32H755 (dual-core Cortex-M7/M4) controller** — 10 ms deterministic control task, watchdog, CAN driver written from scratch on both buses; LCD driven over SPI on an STM32H7 dash | `lead-custom-vcu-program-emb`, `lead-vcu-can-driver-emb`, `dash-can-display-emb` |
| Refining / retiring legacy embedded software | **The seam port.** 5,400-line production codebase, sensor and bus layer fixed as the interface, everything below it rewritten for new silicon, control logic above carried over. This is the closest thing in the bank to a direct quote of their bullet | `lead-vcu-seam-port-emb` |
| Testing and validation to a safety standard | MIL/SIL/HIL plant models so control code is exercised against a simulated system before touching hardware; SIL replay harness and regression suite against recorded logs; on-vehicle test campaigns with response/latency measurement; enforcing a hard 80 kW limit in firmware | `lead-plant-models-sim`, `lead-model-integration-standards-sim`, `fsae-sil-replay-sim`, `fsae-onvehicle-test-sim` |
| Datasheets, schematics, HW/SW specification, code review | Caught from the STM32H755 datasheet that the analog pins are **not 5 V tolerant** and specified the front-end dividers before the board went near hardware; set code standards for a modeling team of 7 senior engineers; run a weekly written technical review | `lead-vcu-can-driver-emb`, `lead-model-integration-standards-sim`, `lead-weekly-review-cadence-swe` |
| Working without documentation (their "from first principles" framing) | Decoded an undocumented VCU flashing sequence off CAN trace captures and reimplemented it in Python over the bus | `srcan-flash-protocol-emb` |

**Requirements I have no evidence for** (interview prep, not resume lines):

- **Embedded Linux, kernel configuration, device tree, kernel driver
  development, ARM bootloaders.** Nothing. This is the largest gap against the
  posting and there is no way to paper over it — every one of those is a
  preferred qual, not a required one, and the required quals ask only for
  "software development, preferably with exposure to embedded systems." Do not
  put Linux, Yocto, buildroot, or device tree on the skills line. If asked, say
  your embedded work has been bare-metal and scheduled-task firmware on MCUs, and
  that the driver-level instinct transfers — you have written a peripheral driver
  against a reference manual, which is the actual skill under kernel-driver work.
- **UART and I2C.** You have CAN and SPI on real hardware. The custom VCU has a
  serial console (the deck shows console commands), so you have almost certainly
  touched UART — **but there is no bullet for it in the bank, so nothing on the
  resume claims it.** Worth 10 minutes to confirm what that console runs on; if
  it is UART and it is yours, write a bullet and it becomes a real answer to a
  named preferred qual. Do not add it to the skills line before then.
- **PCIe, MIPI CSI/DSI, USB, 802.3.** None. Do not bluff these; they are asked as
  "comfortable/working knowledge" for a reason.
- **FPGAs.** None.
- **High-speed data acquisition.** Vehicle telemetry at CAN rates is not what
  they mean. Adjacent, not equivalent — say so plainly.
- **DSP.** Filtering and sensor fusion in a control context, not DSP as a
  discipline. Know sampling, aliasing, and basic filter behavior; do not claim
  more.
- **Rust.** None. They ask for "at least one" of C/C++/Rust and you have C.
- **Lab equipment.** You use BusMaster, i2 Pro, and a bench setup; scope and
  logic-analyzer proficiency is not evidenced in the bank. If it is true, it
  belongs in the bank — see the gap note below.
- **Medical / surgical domain.** Zero, and that is fine for an intern. What
  transfers is working under a hard limit you are not allowed to violate: the
  80 kW rule, HV battery safety, a watchdog that reboots a hung control task.
  Frame it that way rather than pretending at domain knowledge.

## Step 4 — Changes made to the base

Starting from `bases/embedded_controls.tex`:

- **Skills** — restructured to `Languages / Embedded / Hardware / Test &
  Validation / Tools`. C and C++ listed separately and first (the posting names
  C, C++, Rust). The Embedded line now leads with driver development and
  deterministic scheduling instead of controls vocabulary. The Hardware line
  spells out **STM32H755 (dual-core ARM Cortex-M7/M4)** rather than just
  "STM32H7" — "embedded stacks for ARM cores" and "building and bringing-up
  MCUs" are preferred quals, and the part number alone does not say ARM to a
  keyword filter. A dedicated **Test & Validation** line was added because
  requirement 4 is the differentiator for a surgical robot. **No Linux, no device
  tree, no I2C, no UART, no Rust, no RTOS.**
- **Software Lead expanded to four bullets** (the base has three). Added
  `lead-plant-models-sim` merged with the code-standards half of
  `lead-model-integration-standards-sim`, because MIL/SIL/HIL validation is
  requirement 4 and nothing else on the page covered it. The seam port
  (`lead-vcu-seam-port-emb`) was already in the base and stays — it is the single
  best-matched bullet in the whole bank for this posting.
- **Argus Defense** — reordered to lead with the C firmware bullet, then VIO,
  then PID. Firmware first because the posting's first responsibility is
  developing embedded software; VIO ahead of PID because state estimation for
  precise positioning reads closer to robotics than gain tuning does.
- **Software Controls Engineer** — `fsae-energy-mgmt-emb` (the `0.01%`
  lap-adaptive energy algorithm) stays **out**, as on the Tesla version; this is
  not a controls role and that bullet spends a VERIFY number for little return.
  Kept fixed-point PI (deterministic execution), power limiting, CAN diagnostics.
- **Software Intern cut to two bullets** — dropped `fsae-pi-torque-tune-emb`
  (the `2%` PI tuning bullet) for space. PI tuning is already represented twice
  above it; the endurance result is not represented anywhere else.
- **Projects: SR-Wireless-CAN first, driver display second.** Flashing-protocol
  reverse engineering is the strongest single item for a team that describes
  building "from first principles" and retiring undocumented legacy systems.
- **Project titles genericized.** "Formula SAE EV Dashboard" became "Embedded
  Driver Display — Real-Time Instrument Cluster" and the bullets now say
  "operator" rather than "driver", so the firmware content reads to a robotics
  reader instead of an automotive one. The org line still says Spartan Racing,
  Formula SAE — nothing is hidden, it is just described by what it is.
- **Wording generalized in three places** — "vendor unit" instead of "vendor
  VCU", "actuator output" instead of "motor output", "hardware" instead of
  "vehicle" where the sentence did not need the vehicle. Same claims, it now
  читается
  reads as embedded systems work rather than car work.

Several bullets were **condensed** from bank wording to hold one page. Claims are
unchanged. No new claims were introduced; every bullet traces to an id in
`master/bullet_bank.md`.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched — the custom VCU, seam
      port, and HIL bullets are all present tense ("Leading", "Directing"). The
      VCU is **not on the car**: GPIO/ADC/PWM drivers, canManager, soldered IO
      ports, and the analog dividers are outstanding. Do not let it drift into
      "built and deployed a custom controller."
- [ ] Every metric is one I can defend — only `5,400-line`, `7 senior engineers`,
      `80 kW`, and `1st in endurance` appear. **`5,400` and the team count are
      flagged VERIFY in the bank** (straight off the Aug 12 deck). *Corrected
      2026-08-21: the 7 counts senior modeling engineers only; new members and
      interns are additional, so the line understates the team.* And
      **`1st in endurance` is flagged VERIFY** — confirm endurance specifically,
      not overall. `0.01%`, `2%`, and `32%` do not appear on this version.
- [x] Titles and dates are consistent with every other version
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Neuralink Resume.pdf`
- [x] Company name appears in the filename only, never inside the document
- [x] Tracker row added in `tracker/applications.csv`
- [x] One page

## Interview prep — likely questions

- **"Tell me about retiring legacy embedded software."** This is their bullet and
  your seam port is the answer. Lead with the *decision*, not the line count: the
  sensor and bus layer is the seam, below it is rewritten for new silicon, above
  it the team keeps a codebase it already knows. State the tradeoff you accepted
  — you inherit the old code's structure above the seam, and the seam itself has
  to be right the first time or the port stalls.
- **"Walk me through a driver you wrote."** The CAN driver: dual-bus
  configuration, filtering, the transmit/receive path, and why testing needs two
  live buses at once (still outstanding). Then the 5 V-tolerance catch — reading
  the datasheet closely enough to stop a board from being damaged is exactly the
  instinct a surgical-robotics team is hiring for.
- **"How do you validate firmware you cannot afford to have fail?"** Their
  requirement 4, and you have a three-layer answer: plant models so control code
  runs against a simulated system first, a SIL replay harness that reruns the
  real controller against recorded logs, then instrumented on-hardware testing
  with response and latency measured. Add the watchdog: the control task is
  assumed to be able to hang, and the system is designed for that case.
- **"Have you worked on embedded Linux / written a kernel driver?"** No. Say it
  in one sentence, then say what you have done at the equivalent level — a
  peripheral driver from the reference manual on an ARM MCU — and stop. Do not
  narrate around the gap; it is a preferred qual and they know interns will miss
  several.
- **"How do you handle code you did not write and that is not documented?"**
  The flashing protocol. Captures, isolating the flashing frames from ordinary
  traffic, sequencing and acknowledgements, and what you did when a write failed
  partway. Expect "what if you had bricked it?" — have the recovery answer ready.
- **"What would you specify for the next hardware platform?"** Their sixth
  responsibility, and you have actually done this once: silicon selection for the
  in-house controller, the dual-core split, and the analog front-end constraint
  that came out of the datasheet. Have an opinion on what you would do
  differently.
- **Safety framing.** Rehearse one sentence connecting the 80 kW rule, HV
  battery work, and the watchdog to "a limit the software is not permitted to
  violate." That sentence is the bridge from a racecar to a surgical robot, and
  they will not draw it for you.

## Gaps worth closing in the bank (cheap, high return for this posting)

1. **UART / serial console** on the custom VCU — if it is yours, one bullet turns
   an unclaimed preferred qual into a claimed one.
2. **Lab equipment** — scope, logic analyzer, bench bring-up. The posting asks
   for it explicitly and the bank is silent. If you use them, write it down.
3. **Cross-functional work with electronics** — still unclaimed, still true (the
   joint weekly meeting, boards owned by electronics designers). This posting
   opens by calling the team "a cross-functional mix of roboticists, engineers
   from various disciplines, and medical professionals." Same gap flagged on the
   Tesla application on 2026-08-16 and still open.

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-16 | Tailored from `embedded_controls`; one page; not yet submitted |
|  | Applied |
