# STMicroelectronics — Software Algorithm/Embedded Intern

- **Job URL:** https://st.com/careers
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** embedded_controls
- **Referral / contact:**

**Logistics:** Santa Clara, in-person, starts ~September 2026, $32–43/hr.
You are currently holding both the Argus Defense internship (Feb 2026–present)
and Spartan Racing Software Lead (Jun 2026–present). Decide what you'd drop
before an interview asks — it will come up.

## Step 1 — Actual job family

Embedded firmware **plus** sensor algorithms. Not a controls role, not a
straight firmware role: they want someone who can design an algorithm on paper,
implement it in C/C++ on a microcontroller, run data-collection experiments, and
verify it. "Motion tracking optical systems" and "recognize the pattern of
activities based on sensor data" put a perception/estimation flavor on top.

→ Base: **embedded_controls**, with the sensor-fusion and perception material
pulled forward from `simulation_robotics`.

## Step 2 — Top 5 technical requirements

1. Implementing algorithms on embedded platforms in **C/C++**
2. **Sensor data algorithms** — motion tracking, optical systems
3. **Pattern/activity recognition** from sensor data
4. **Data collection experiments, integration, verification**
5. **Python + ML tooling**

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id |
| --- | --- | --- |
| Algorithms on embedded in C/C++ | Fixed-point PI on the TTC 60 VCU; flight-control firmware in C on PX4; STM32H7 dashboard | `fsae-fixed-point-pi-sim`, `argus-firmware-c-emb`, `dash-can-display-emb` |
| Sensor data / motion tracking optical | **Visual-inertial odometry** — literally optical + inertial motion tracking for state estimation | `argus-vio-emb` |
| Activity/pattern recognition from sensors | Posture Detection — optical activity recognition with smoothing, debounce, configurable thresholds | `posture-pipeline-sim`, `posture-metrics-sim` |
| Data collection experiments + verification | SIL replay harness, on-vehicle test campaigns, flight-log-driven gain iteration, FPS/latency instrumentation | `fsae-sil-replay-sim`, `fsae-onvehicle-test-sim`, `argus-repeatable-flight-tests-sim` |
| Sensor drivers / peripheral I/O | CAN diagnostics firmware, STM32H7 over SPI, microcontroller I/O | `fsae-can-diagnostics-emb`, `dash-can-display-emb` |
| Python + ML tools | Python, NumPy, pandas, Matplotlib, OpenCV — **see gap below** | `fsae-telemetry-pipeline-swe` |

**Requirements I have no evidence for:**

- **Machine learning.** This is the one real gap. You have Python data analysis
  and OpenCV, but nothing in the bullet bank shows training a model, feature
  engineering, scikit-learn/PyTorch/TensorFlow, or evaluating a classifier.
  Posture Detection is a *rules-based* pipeline (smoothing, debounce,
  thresholds), not a learned one.

  Do **not** put "machine learning" on this resume. Two honest options:
  1. Apply as-is. They explicitly say candidates "who may not meet every single
     requirement" should apply, and you clear requirements 1–4 well.
  2. Spend a weekend adding a learned classifier to Posture Detection — train a
     small activity classifier on IMU or pose-keypoint data, evaluate it, log
     the metrics. That converts the single biggest gap into your single most
     on-point project, because activity recognition from sensor data *is the
     job*. Add it to the bank as `confidence: completed` only once it runs.

- Wearable/mobile/industrial platform experience — automotive is the one
  platform on their list you've actually shipped on. Lead with that.

## Step 4 — Changes made to the base

Starting from `bases/embedded_controls.tex`:

- **Skills** — restructured into `Languages / Algorithms & Sensors / Embedded /
  Python & Verification / Tools`. C and C++ lead. "Controls" renamed to
  "Algorithms & Sensors" so it reads as algorithm work, not just PID. Added
  OpenCV, NumPy, pandas, pytest, SIL from the simulation base. **No ML terms.**
- **Argus Defense** — reordered to lead with visual-inertial odometry. It's the
  closest thing you have to "motion tracking optical systems" and it was buried
  second.
- **FSAE Software Controls Engineer** — led with the fixed-point PI bullet
  (`fsae-fixed-point-pi-sim`, borrowed from the simulation base) because it is
  the clearest "algorithm implemented on an embedded platform" evidence you own.
  Energy-management algorithm second, CAN diagnostics third.
- **Projects** — swapped FSAE Vehicle Simulation **out**, Posture Detection
  System **in**. Posture Detection is the only activity-recognition evidence you
  have and this posting is an activity-recognition posting. Dashboard stays for
  the STM32H7/SPI/sensor-peripheral evidence.

No new claims were introduced. Every bullet is a reordering or verbatim reuse of
something already in `master/bullet_bank.md`.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched
- [x] **Every metric is one I can defend** — resolved 2026-08-03. `0.01%` is the
      error between the commanded power setpoint and the power actually reached
      (power-loop tracking accuracy). The torque-controller figure is now stated
      as `2%` error rather than "98% accuracy" — the same number, phrased the
      way an engineer would. Both bullets rewritten to say exactly that.
- [x] Titles and dates are consistent with every other version
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik STMicro Resume.pdf`
- [x] Company name appears in the filename only, never inside the document
- [x] Tracker row added in `tracker/applications.csv`

## Interview prep — likely questions

- "Walk me through the VIO integration." Know the sensors, the failure modes
  (low texture, fast motion, lighting), and how you measured the improvement.
- "Why fixed-point instead of floating-point?" Determinism, cycle cost, no FPU.
  Know your Q-format and how you picked it.
- "How would you recognize an activity from accelerometer data?" You will get
  asked something like this. Have an answer even though you have not built it —
  windowing, feature extraction, a simple classifier, and how you would validate it.
- "What's your ML experience?" Answer honestly and pivot to the data-collection
  and verification work, which is most of what an algorithms intern actually does.

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-03 | Tailored resume prepared |
