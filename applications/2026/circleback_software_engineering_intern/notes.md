# Circleback — Software Engineering Intern

- **Job URL:**
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** software_backend
- **Referral / contact:**
- **Location:** San Francisco, CA
- **Term:** **Summer 2027**

## ⚠ The timing question — this is the one to resolve first

They state **summer 2027** explicitly. You graduate **May 2027**. So this
internship would begin roughly a month *after* you finish your degree.

Unlike Samsara, this is **not** a stated blocker — the posting as captured has
no degree requirement and no "currently pursuing" language at all. That absence
could mean they don't care, or it could mean it's assumed. Don't guess.

**This is also the exact case you asked about when you said you're flexible on
graduation.** If you genuinely extended to December 2027, you would be an
enrolled student through summer 2027 and unambiguously eligible here — and the
same would apply to Haast. That's a real decision with real consequences
(another semester of tuition, a later full-time start), not a resume edit. If
you decide to do it, tell me and I'll change the date once in
`style/resume.sty`; it propagates to every resume in the repo on the next build.

Three ways this can go, in order of preference:

1. **Ask them directly.** "I graduate May 2027 — are you open to interns who've
   just finished their degree, or would you rather talk about a new-grad role?"
   At a company this size that's a two-line email and it may convert into a
   better conversation than the internship one.
2. **Extend to December 2027** if you want the internship badly enough and the
   cost is acceptable.
3. **Apply as-is** and let them raise it. Lowest effort, but you may get filtered
   without knowing why.

## Step 1 — Actual job family

Full-stack product engineering at a small AI product company. Genuinely
full-stack: they say "database models to API endpoints to UI components" in one
breath, across three clients (React web, Electron desktop, React Native mobile).

→ Base: **software_backend**. This is close to what that base is for, tilted
further toward frontend and real-time media than the Jobright version.

## Step 2 — What they actually want

1. **End-to-end features**: DB models → API endpoints → UI components
2. **React** (and Electron / React Native, which you don't have)
3. **AI-powered product surfaces** — Assistant, AI outcomes, search
4. **Real-time media**: transcription, on-device recording/streaming
5. **App and API performance**

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id |
| --- | --- | --- |
| DB models → API → UI, end to end | Scent Showdown (SQLite schema + Flask routes + templates + JSON endpoints); SR-Wireless-CAN (SQLite + FastAPI + React dashboard) | `scent-flask-app-swe`, `srcan-backend-lead-swe` |
| React | Tickr — auth, game, and history flows with client-side state management | `tickr-flows-swe`, `tickr-quest-logic-swe` |
| AI product surfaces | Tickr's LLM-backed coach, including prompt logic | `tickr-flows-swe` |
| **On-device recording / streaming** | **Posture Detection** — a real-time on-device media pipeline: capture, per-frame processing, temporal smoothing, session recording, frame export | `posture-pipeline-sim` |
| **Performance instrumentation** | FPS and latency tracked on that pipeline; bounded search window keeping large catalogs responsive under load | `posture-metrics-sim`, `srcan-dbc-merge-swe` |
| Real-time streaming (API perf) | FastAPI + WebSocket service streaming live data to a browser | `srcan-backend-lead-swe` |
| Production ownership | Zip Intelligence — ticket to verified release via PRs | `zip-feature-ownership-swe` |

**The non-obvious win: Posture Detection.** On most of your applications it's a
throwaway CV project. Here it is the closest thing you own to *"on-device
recording/streaming"* and *"app performance"* — you built a real-time media
pipeline and then instrumented its frame rate and latency. Very few interns have
measured the latency of anything. It earns its place on this resume specifically.

**No evidence for:**

- **Electron** and **React Native.** You have React, which is the transferable
  core, but don't imply desktop or mobile shipping experience. If asked, say you
  haven't shipped either and that React is where you're strong.
- **Transcription / speech.** No ASR work. Adjacent real-time media experience is
  honest; speech expertise is not.
- **Search.** No search or ranking work beyond a bounded catalog lookup.

## Step 4 — Changes made to the base

Starting from `bases/software_backend.tex`:

- **Posture Detection swapped in** — see above. This is the one application where
  it's a first-class asset rather than filler.
- **Tickr promoted to first project.** React plus an LLM-backed feature is
  simultaneously their stack and their product direction.
- **SR-Wireless-CAN kept** for real-time streaming and the DB-to-API-to-UI story,
  with the CAN jargon generalized — this reader cares about the streaming
  architecture, not the vehicle bus.
- **A `Performance` skills grouping added** so real-time media and latency
  instrumentation are visible, since two of their five focus areas are about
  exactly that.
- **FSAE Software Controls Engineer dropped.** This is a pure product company;
  embedded controls earns less here than a third project does. It's the first
  application where cutting it is clearly right.
- **Sailfish dropped** — weakest metric, no relevance.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched
- [x] No unverifiable metric on this version (Sailfish 32% dropped)
- [x] Titles and dates consistent with every other version
- [x] SR-Wireless-CAN scope confirmed (backend lead)
- [x] No Electron, React Native, transcription, or search claimed
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Circleback Resume.pdf`
- [x] Company name appears in the filename only
- [x] Tracker row added

## Interview prep

- **Use the product before you talk to them.** Circleback is meeting notes and
  an assistant. It's free to try, they explicitly value applying "learnings from
  customer conversations," and showing up with one specific, well-observed piece
  of feedback will put you ahead of most candidates. This is the highest-value
  hour of prep on this entire list.
- "Tell me about something you built end to end" — Scent Showdown is the cleanest
  DB-to-UI story; SR-Wireless-CAN is the more impressive one.
- Expect a question about performance. You have a genuine answer: you
  instrumented FPS and latency on a real-time pipeline and used it to tune
  thresholds.
- They say "takes pride in their craft." Have an opinion about code quality you
  can defend — testing, naming, how you decide something is done.

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-04 | Tailored resume prepared |
