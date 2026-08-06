# Western Digital — Firmware Engineering Intern

- **Job URL:**
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** B
- **Base used:** embedded_controls
- **Referral / contact:**

**Eligibility: clear.** "Currently pursuing a Bachelor's or Master's degree in
Computer Science" — yes, through May 2027. **San Jose is one of the six
locations**, so no relocation.

**Priority B, not A — and that's about the posting, not the fit.** This is an
umbrella pipeline req covering five different tracks, and WD says outright:
*"An immediate opening or interview is not guaranteed."* The fit is genuinely
good, but resumes going into a general early-career pool convert at a lower rate
than ones going to a named team. Spend 10 minutes here, not 25, and treat any
response as upside.

## Step 1 — Actual job family

One posting, five tracks. Pick the one the resume targets:

| Track | Fit |
| --- | --- |
| **Firmware Engineering** | **Best.** C, C++, assembly, embedded firmware, hardware collaboration, debugging HW/SW interactions — this is your embedded base almost verbatim, down to Assembly being on your languages line |
| Systems Design & Integration | Strong second. System requirements, HW/SW compatibility, subsystem integration, system-level troubleshooting — your FSAE integration and on-vehicle debug work |
| System Tools Software | Plausible. Engineering tools, debugging, optimization — your SIL harness and telemetry tooling |
| Applications Software | Weak use of your profile; the backend base would serve better |
| Data Analytics | Weakest. Don't. |

→ Target **Firmware Engineering**, base **embedded_controls**. If the
application asks you to rank tracks: Firmware → Systems Design & Integration →
System Tools.

## Step 2 — Top 5 technical requirements

The bar here is broad and low — this is a fundamentals screen, not a specialist
posting.

1. C / C++ / assembly on embedded systems
2. Debugging firmware–hardware interactions
3. Collaboration with hardware engineers
4. Software fundamentals: data structures, algorithms, operating systems
5. Interest in storage / semiconductors / embedded systems

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id |
| --- | --- | --- |
| Embedded firmware in C | VCU power-limiting firmware; STM32H7 dashboard; PX4 flight-control firmware | `fsae-power-limit-firmware-emb`, `dash-can-display-emb`, `argus-firmware-c-emb` |
| C, C++, **assembly** | Already on your languages line — they name assembly explicitly and few interns have it | — |
| Debugging HW/SW interactions | CAN diagnostics with status bits and error counters; BusMaster monitoring; GDB; on-vehicle debug | `fsae-can-diagnostics-emb` |
| Hardware collaboration | Formula SAE is by definition a hardware team — you shipped software onto a car other people built | `lead-software-planning-emb` |
| Low-level / real-time constraints | Fixed-point PI, deterministic execution, no-FPU arithmetic, slew limiting | `fsae-fixed-point-pi-sim` |
| Testing and verification | SIL replay harness, regression suite, on-vehicle test campaigns | `fsae-sil-replay-sim`, `fsae-onvehicle-test-sim` |
| Git / Linux / IDEs | Git throughout; TASKING and TTC Downloader as embedded toolchains | — |

**Requirements I have no evidence for:**

- **Storage technologies** specifically — no SSD/NAND/filesystem/controller work.
  They ask for *interest*, not experience, so this is fine. If you interview,
  have a real answer for why storage firmware appeals to you; "it's a job" will
  not land against candidates who've read about flash translation layers.
- **Operating systems** coursework is not on your resume. You have "Computer
  Systems" listed, which is adjacent. If you've taken an OS course since, add it.

## Step 4 — Changes made to the base

Starting from `bases/embedded_controls.tex` — light touch, this base already
fits.

- **Fixed-point PI bullet promoted** to lead the Software Controls Engineer
  entry. Deterministic, resource-constrained arithmetic is the closest thing you
  have to storage-controller firmware work.
- **Assembly kept prominent** on the languages line. They name it explicitly.
- **Dashboard project kept** — STM32H7 over SPI is the clearest "firmware
  talking to hardware peripherals" evidence you own.
- **SR-Wireless-CAN swapped in for Vehicle Simulation**, led by the wireless
  flashing bullet. For a firmware team this is the strongest thing on the page:
  you took an undocumented flashing protocol, decoded it off bus captures, and
  reimplemented it. Storage firmware people spend their lives on exactly that
  kind of problem — undocumented device behaviour, protocol sequencing, failed
  writes. Expect this to be the bullet they ask about.
- Otherwise unchanged. Do not over-tailor a pipeline req.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched
- [x] **Metrics defined** — resolved 2026-08-03. `0.01%` is power-setpoint
      tracking error; the torque figure is now stated as `2%` error rather than
      "98% accuracy".
- [x] Titles and dates consistent with every other version
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Western Digital Resume.pdf`
- [x] Company name appears in the filename only
- [x] Tracker row added

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-03 | Tailored resume prepared |
