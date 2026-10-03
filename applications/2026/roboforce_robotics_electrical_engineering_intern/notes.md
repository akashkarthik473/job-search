# RoboForce — Robotics Electrical Engineering Intern

- **Job URL:**
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** embedded_controls, rewritten around 2026 board bring-up and firmware
- **Referral / contact:**

## Step 1 — Actual job family

Ignore the branding language. What is this work really?
embedded firmware / controls / simulation-test / backend / full-stack / data-vision

> Robotics electronics bring-up and embedded firmware: STM32 C/C++, CAN/SPI,
> Linux protocol validation, safety state machines, and engineering documentation.

## Step 2 — Top ~5 technical requirements

Five, not twenty. Do not chase every keyword in the posting.

1. Validate circuits and debug board-level hardware
2. Develop robust Arduino C++ and STM32 C firmware
3. Implement and debug CAN, I2C, SPI, and UART
4. Validate protocols under Linux and real-world operating conditions
5. Produce clear debugging, firmware, and bring-up documentation

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id from bullet_bank.md |
| --- | --- | --- |
| Circuit validation / bring-up | STM32H755 VCU bring-up; caught non-5 V-tolerant analog inputs and specified dividers | `lead-vcu-can-driver-emb` |
| STM32 firmware | Custom VCU, STM32 driver display, real-time control task and watchdog | `lead-custom-vcu-program-emb`, `dash-can-display-emb` |
| Communication protocols | Dual-bus CAN driver, SPI display, CAN diagnostics and flashing | `lead-vcu-can-driver-emb`, `dash-can-display-emb`, `srcan-flash-protocol-emb` |
| Linux validation / robustness | SocketCAN live mode, recorded replay, ACK/CRC checks, BMS timeout and fail-safe arming | `srcan-replay-sim`, `lead-custom-inverter-vcu-emb`, `lead-custom-bms-integration-emb` |
| Documentation | Code-validated flashing protocol notes, configuration/recovery steps, weekly written technical reviews | `lead-weekly-review-cadence-swe`, `srcan-docker-swe` |

**Requirements I have no evidence for** (be honest — these are interview prep, not resume lines):

- Arduino-specific firmware
- I2C and UART implementation evidence
- Named use of oscilloscopes, multimeters, or logic analyzers
- Direct continuity and signal-integrity test results

## Step 4 — Changes made to the base

- Skills reordered: embedded platforms, protocols/Linux, then test and debug
- Bullets swapped in/out: added custom VCU bring-up, analog protection,
  custom-inverter safety, 46-message BMS integration, and Linux SocketCAN;
  removed older 2025 project material
- Project order changed: STM32 display first, Linux CAN deployment tool second
- Summary added: no

## Step 5 — Truth check

Tick every box before exporting the PDF.

- [x] Nothing claimed that was only planned or researched
- [x] Every metric is one I can defend with evidence
- [x] Titles and dates are consistent with every other version
- [x] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik RoboForce Resume.pdf`
- [x] Company name appears in the filename only, never inside the document
- [x] Tracker row added in `tracker/applications.csv`

## Outcome log

| Date | Event |
| --- | --- |
|  | Applied |

