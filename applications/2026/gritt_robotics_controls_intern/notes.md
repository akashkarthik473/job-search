# Gritt — Robotics Controls Intern

- **Job URL:**
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** simulation_robotics, rewritten around control-to-hardware evidence
- **Referral / contact:**

## Step 1 — Actual job family

Ignore the branding language. What is this work really?
embedded firmware / controls / simulation-test / backend / full-stack / data-vision

> Robotics controls and system validation: implement controllers, connect
> perception/state estimation, benchmark against logged baselines, tune on
> hardware, and own the supporting test tools.

## Step 2 — Top ~5 technical requirements

Five, not twenty. Do not chase every keyword in the posting.

1. Develop motion-planning or control algorithms and deploy them to hardware
2. Benchmark baselines and tune for real-world robustness
3. Integrate control with perception and learning components
4. Apply dynamics, optimization, and control theory in C++ or Python
5. Own a defined technical deliverable with light supervision

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id from bullet_bank.md |
| --- | --- | --- |
| Controls to hardware | PX4 PID tuning and embedded C flight-control changes; Formula SAE VCU firmware | `argus-pid-emb`, `argus-firmware-emb`, `fsae-power-limit-firmware-emb` |
| Baselines / robustness | Logged flight telemetry, on-vehicle response and latency measurements, SIL replay and parameter sweeps | `argus-log-iteration-sim`, `fsae-onvehicle-test-sim`, `fsae-sil-replay-sim` |
| Perception integration | Integrated visual-inertial odometry into the PX4 state-estimation and control stack | `argus-vio-sim` |
| Dynamics / controls / C++ or Python | Fixed-point PI/PID, anti-windup, saturation, sensor fusion, Python telemetry tooling | `fsae-power-loop-sim`, `fsae-sil-replay-sim` |
| End-to-end ownership | Leads 12 engineers/10+ projects; personally built CAN deployment and test tooling | `lead-org-scale`, `srcan-flash-protocol-emb`, `srcan-backend-swe` |

**Requirements I have no evidence for** (be honest — these are interview prep, not resume lines):

- No implemented motion planner, MPC, whole-body controller, or sampling-based planner
- No direct foundation-model or learned-policy integration
- Optimization coursework/project evidence is weaker than the controls evidence
- Confirm availability and work authorization for a 3- or 6-month internship

## Step 4 — Changes made to the base

- Skills reordered: controls/dynamics, robotics/embedded, then simulation/validation
- Bullets swapped in/out: emphasized four-motor firmware, PX4/VIO integration,
  0.01% and 2% controller results, hardware tests, and trace replay
- Project order changed: removed the old vehicle simulation and posture project;
  retained only the 2026 control-system test platform
- Summary added: no

## Step 5 — Truth check

Tick every box before exporting the PDF.

- [x] Nothing claimed that was only planned or researched
- [x] Every metric is one I can defend with evidence
- [x] Titles and dates are consistent with every other version
- [x] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Gritt Resume.pdf`
- [x] Company name appears in the filename only, never inside the document
- [x] Tracker row added in `tracker/applications.csv`

## Outcome log

| Date | Event |
| --- | --- |
|  | Applied |

