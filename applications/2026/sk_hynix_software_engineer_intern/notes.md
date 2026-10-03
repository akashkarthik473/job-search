# SK Hynix — Software Engineer Intern

- **Job URL:**
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** simulation_robotics, rewritten around 2026 test/tooling work
- **Referral / contact:**

## Step 1 — Actual job family

Ignore the branding language. What is this work really?
embedded firmware / controls / simulation-test / backend / full-stack / data-vision

> Storage-test software and developer tooling: C++/Python development, automated
> validation, performance instrumentation, user-facing APIs, and documentation.

## Step 2 — Top ~5 technical requirements

Five, not twenty. Do not chase every keyword in the posting.

1. Develop and debug test tools in C++, Python, and JavaScript
2. Design reusable libraries and user-facing APIs
3. Automate builds, deployment, test integration, and metric generation
4. Validate functionality, performance, and scalability
5. Write design, setup, release, and user documentation

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id from bullet_bank.md |
| --- | --- | --- |
| C++ / Python / JavaScript | Embedded C/C++, Python validation and CAN tooling, React/TypeScript UI | `fsae-sil-replay-sim`, `srcan-backend-swe` |
| Test tools and APIs | SR-Wireless-CAN backend with live, simulated, and recorded-trace modes | `srcan-backend-swe`, `srcan-replay-sim` |
| Build/deployment automation | VCU build/release pipeline; reverse-engineered wireless firmware deployment | `lead-release-pipeline-swe`, `srcan-flash-protocol-emb` |
| Validation and metrics | SIL replay, regression sweeps, 0.01% setpoint tracking, 2% torque error | `fsae-sil-replay-sim`, `fsae-energy-mgmt-emb`, `fsae-pi-torque-tune-emb` |
| Documentation | Protocol documentation, setup/recovery guidance, weekly written technical reviews | `lead-weekly-review-cadence-swe`, `srcan-docker-swe` |

**Requirements I have no evidence for** (be honest — these are interview prep, not resume lines):

- Direct storage-device, NAND, DRAM, or NVMe experience
- Measured scalability/load-test results for a storage test library
- JavaScript test-framework evidence beyond application development

## Step 4 — Changes made to the base

- Skills reordered: languages, test/automation, APIs, then embedded/data
- Bullets swapped in/out: added 2026 VCU/BMS scale, percentage-based controller
  results, SIL replay, and SR-Wireless-CAN; removed vehicle simulation and
  posture detection
- Project order changed: retained only the 2026 firmware deployment/test platform
- Summary added: no; the evidence is stronger than a generic objective statement

## Step 5 — Truth check

Tick every box before exporting the PDF.

- [x] Nothing claimed that was only planned or researched
- [x] Every metric is one I can defend with evidence
- [x] Titles and dates are consistent with every other version
- [x] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik SK Hynix Resume.pdf`
- [x] Company name appears in the filename only, never inside the document
- [x] Tracker row added in `tracker/applications.csv`

## Outcome log

| Date | Event |
| --- | --- |
|  | Applied |

