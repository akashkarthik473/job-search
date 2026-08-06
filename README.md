# Job Search

A resume system, not a pile of resumes. The point is that a new application
costs **5–15 minutes**, not 45.

## Layout

```
job-search/
├── style/resume.sty              Shared layout + contact + education. Edit ONCE.
├── master/
│   ├── master_resume.tex         Every role, every bullet variant. Never submitted.
│   ├── bullet_bank.md            Source of truth for wording + confidence.
│   └── project_inventory.md      What each project proves, and where the code is.
├── bases/
│   ├── embedded_controls.tex     Firmware, controls, automotive, real-time
│   ├── simulation_robotics.tex   Robotics, simulation, test, CV, autonomy
│   └── software_backend.tex      SWE internships, backend, full-stack, data
├── applications/<year>/<slug>/   One folder per application. Versioned forever.
├── templates/application/        Scaffold copied into each new application
├── tracker/applications.csv      The tracker
├── scripts/                      build-resume.ps1, new-application.ps1
└── archive/                      Superseded files kept for history
```

The three bases and the master all `\usepackage{resume}` from `style/`. Change
your phone number, a section heading, or the coursework line in **one** place
and every resume in the repo picks it up on next build.

## Applying to something

```powershell
.\scripts\new-application.ps1 -Company Astranis -Role "Embedded Software" -Base embedded_controls -Priority A
```

That creates `applications/2026/astranis_embedded_software/` with the resume
(already named `Akash Karthik Astranis Resume.tex`), a filled-in `notes.md`
worksheet, and a `job_description.txt` to paste the posting into. It also
appends a tracker row.

Then:

```powershell
.\scripts\build-resume.ps1 "applications\2026\astranis_embedded_software\Akash Karthik Astranis Resume.tex"
```

The `.tex` is named exactly what the PDF should be called, so there is no
rename-before-upload step and no `resume_final_FINAL_v7.pdf` ever. Quote the
path — the filenames contain spaces.

**Naming:** submitted files are `Akash Karthik <Company> Resume.pdf`. Spaces, no
role, no underscores. The *folder* keeps `company_role` so two roles at the same
company stay separate; only the file drops the role.

Or just open the `.tex` in VSCode and hit `Ctrl+Alt+B` / `Ctrl+Alt+V`.

## The tracker app

Double-click **`Open Tracker.cmd`** in the repo root. It starts a tiny local
server (`scripts/tracker-server.mjs`, Node, no dependencies) and opens the app in
your browser. Your data loads automatically and saves straight back to
`tracker/applications.csv`, so git still sees every change and the CSV stays the
source of truth — the app is just a nicer way to type into it. `Ctrl+C` in the
console window stops it.

Don't open `tracker.html` directly off disk, and especially not in VS Code's
built-in browser — writing files from a `file://` page is blocked there. The app
will tell you so if you try.

- **Applied** button stamps today's date, sets status to `applied`, and schedules
  a follow-up a week out
- Status and priority are dropdowns
- `▸` expands a row for job URL, job ID, resume used, referral, and notes
- Overdue follow-ups are highlighted, and counted in the chips up top
- Autosaves ~1s after you stop typing; `Ctrl+S` forces it
- **Reload from disk** re-reads the CSV if you edited it by hand or via a script

The server refuses to write an empty or header-less file, and keeps a one-deep
undo copy at `tracker/.applications.csv.bak` (gitignored) before each save.

## Picking a base

Ignore how the company describes itself. Ask what the work actually is.

| The work is really… | Base |
| --- | --- |
| Firmware, vehicle controls, motor control, real-time, automotive | `embedded_controls` |
| Robotics, simulation, controls validation, systems test, HW/SW integration, CV, autonomy tooling | `simulation_robotics` |
| SWE internship, backend, full-stack, dev tooling, data/API | `software_backend` |

`simulation_robotics` is the strongest overall story — it says *"I can build a
controller, simulate it, instrument it, validate it, and debug it on real
hardware."* It also covers most data/CV postings, so don't spin up a fourth base
until you've found enough CV-specific roles to justify one.

## Three tiers

Not every posting deserves the same time.

**Tier A — excellent match** (~15–25 min). Embedded automotive, controls,
robotics test, or a company you actually care about. Pick the base, reorder
projects, rewrite 2–4 bullets, adjust skills order, add a targeted summary if it
helps, chase a referral, write a cover letter only if it adds something.

**Tier B — good match** (~5–10 min). Right base, reorder projects, swap one or
two bullets, reorder skills, submit.

**Tier C — plausible** (~0–2 min). Nearest base, minimal or no change.

A reasonable day: 2 Tier A, 3–6 Tier B, plus Tier C when genuinely plausible.
Consistency beats volume.

## The tailoring process

Each application's `notes.md` walks these five steps. Do them in order.

1. **Identify the actual job family** → picks the base.
2. **Extract the top ~5 technical requirements.** Five, not twenty. Do not try
   to include every keyword in the posting.
3. **Map evidence to each requirement** using bullet ids from
   `master/bullet_bank.md`. Requirements with no evidence get listed honestly —
   they're interview prep, not resume lines.
4. **Change only high-impact sections:** skills order, bullet order, project
   selection, 2–4 bullets. Do not redesign the document.
5. **Truth check** before exporting. The checklist is in `notes.md`.

## Skills sections get reordered, not reinvented

Same background, ordered for the reader. Embedded roles lead with
`Languages → Embedded & Controls → Testing → Tools`. Backend roles lead with
`Languages → Backend → Data → Quality & DevOps`. The three bases already encode
this; usually you only reorder within a line.

## Company name goes in the filename, never in the document

`Akash Karthik Lumafield Resume.pdf` — good. A line inside the resume reading
"Resume for Lumafield" — bad. It looks unnecessary and makes the document
non-reusable. The header stays name and contact info only.

Convention: `Akash Karthik <Company> Resume.pdf`, or
`Akash Karthik <Category> Resume.pdf` for untailored sends.

## Confidence discipline

`master/bullet_bank.md` tags every bullet `completed` / `in-progress` /
`proposed`. This exists specifically so FSAE research work — traction control,
regen — never drifts into past tense on a submitted resume.

Four numbers are flagged **VERIFY** in the bank: `0.01%`, `98%`, `1st in
endurance`, `32%`. Define precisely what each measures before it goes out again.
The 32% at Sailfish is the weakest-defended and the most likely to be probed.

## Using AI on this repo

Good for: extracting requirements from a posting, matching a posting against the
bullet bank, suggesting truthful rewrites, checking for missing keywords,
diffing a tailored resume against its base.

A prompt that works:

```
Here is a job description and my verified bullet bank.

Select the most relevant base resume.
Identify the six most important technical requirements.
Recommend which bullets to keep, remove, reorder, or rewrite.
Do not invent experience, technologies, ownership, or metrics.
Clearly label any requirement for which I lack evidence.
Return only proposed changes, not an entirely new resume.
```

Never submit an AI-edited resume you haven't read line by line. A small wording
change can create a claim you can't defend in an interview.

## Build requirements

MiKTeX with XeLaTeX (`fontspec` needs it — pdflatex will not work). `latexmk` is
deliberately not used: on MiKTeX it's a Perl script and Windows has no Perl.
VSCode is configured in `.vscode/settings.json` to run xelatex twice directly.

## What gets committed

Build artifacts and regenerable base/master PDFs are gitignored. **Submitted
application PDFs are committed on purpose** — they're the exact artifact a
company received, and you'll want it when they call.
