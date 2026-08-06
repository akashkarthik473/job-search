# Archive

Superseded files, kept so nothing is lost. Nothing here is built or submitted.

| File | Superseded by | Note |
| --- | --- | --- |
| `main.tex` | `bases/embedded_controls.tex` | Near-duplicate of the embedded resume, slightly older wording (see below). |
| `main.pdf` | — | Build output of `main.tex`. |
| `Akash_Karthik_Embedded_Controls_Resume.tex` | `bases/embedded_controls.tex` | Content moved verbatim; the 72-line preamble now lives in `style/resume.sty`. |
| `Akash_Karthik_Simulation_Robotics_Test_Resume.tex` | `bases/simulation_robotics.tex` | Same. |
| `Akash_Karthik_Software_Backend_Resume.tex` | `bases/software_backend.tex` | Same. |

The three `Akash_Karthik_*_Resume.tex` files are byte-equivalent in output to
their `bases/` replacements — verified by compiling both and comparing page
count and rendered content. Only the preamble was factored out.

## What `main.tex` had that the embedded base does not

`main.tex` was an earlier pass at the same document. The differences, all of
which the newer `bases/embedded_controls.tex` improves on:

- Languages line said `C, Python, Assembly, Java`; the base says `C/C++, ...`
- Controls line said `PID/PI control, state estimation & sensor fusion (VIO/IMU),
  control-loop tuning, Bode/Nyquist, anti-windup`; the base leads with
  `Fixed-point PI/PID, anti-windup, slew-rate limiting` — stronger for embedded roles
- Embedded line said `STM32, PX4 flight stack, ...`; the base adds `TTC 60 VCU, STM32H7`
- Tools line omitted `TASKING`, `TTC Downloader`, and `GDB`

`Bode/Nyquist` is the one term that exists **only** in `main.tex`. It is now
carried in `master/master_resume.tex` under the controls skills line so it isn't
lost — pull it into a tailored resume if a posting asks for frequency-domain
analysis.

Delete this folder whenever you're confident you don't need the history.
