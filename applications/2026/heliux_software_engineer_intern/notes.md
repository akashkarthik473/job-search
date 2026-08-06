# Heliux — Software Engineer Intern

- **Job URL:**
- **Job ID:**
- **Date posted:**
- **Date applied:**
- **Priority:** A
- **Base used:** software_backend
- **Referral / contact:**

**Eligibility: no stated bar at all** — no degree requirement, no graduation
window, no year. They ask for evidence, not credentials.

**Missing from the posting: location, term, and pay.** All three. Ask.

## Your unfair advantage here

Heliux sells software **to manufacturers** — defense systems, nuclear reactors,
robotics. Their first role bullet is *"acquire expertise in hardware engineering
and manufacturing through immersive, hands-on problem-solving with our
customers."*

Most software interns applying here have never set foot in a shop. You have
spent three years on a Formula SAE team building an actual car, and you
currently work at a **defense company**. You will walk into a customer
conversation already speaking the language — CAN buses, test campaigns,
validation, hardware that has to work.

That combination — real software systems *plus* genuine hardware/manufacturing
context — is rare and is the entire reason to pick you over a stronger pure-web
candidate. The resume is built to make both visible at once.

## Step 1 — Actual job family

Full-stack / platform engineering at an early-stage startup, with heavy customer
exposure in industrial settings. "Operate at the same capacity as a full-time
engineer" means they want someone who ships unsupervised.

→ Base: **software_backend**, with the hardware context deliberately surfaced
rather than buried.

## Step 2 — What they actually ask for

They list exactly three things under "About You." Take them literally.

1. **Zero-to-one: problem identification → production-grade solution.** This is
   the headline requirement and the one they will probe.
2. **Rust, Python, Java, TypeScript, or similar.**
3. **Extreme urgency.**

Plus, from the role section: scalable systems, and hardware/manufacturing
customer work.

## Step 3 — Evidence map

| Requirement | My evidence | Bullet id |
| --- | --- | --- |
| **Zero-to-one** | **SR-Wireless-CAN flashing.** Nobody asked. You identified that firmware updates needed a tethered vendor tool, decoded the undocumented protocol off bus captures, and shipped a working Python implementation your team uses. Problem identification → production-grade solution, verbatim | `srcan-flash-protocol-emb` |
| Complex systems, end to end | Led backend for the telemetry platform: real-time streaming, persistence, containerized deployment | `srcan-backend-lead-swe`, `srcan-docker-swe` |
| Production delivery | Zip Intelligence: ticket → verified production release via PRs with documentation | `zip-feature-ownership-swe` |
| Reliability / debugging | Structured logs for reproduction and triage; SIL replay harness catching regressions before hardware | `zip-sqlserver-logging-swe`, `fsae-sil-replay-sim` |
| Languages | Python, Java, TypeScript — three of their four named | — |
| **Hardware & manufacturing fluency** | Three years Formula SAE (now Software Lead); embedded firmware on VCU, STM32, PX4; defense-industry internship | `lead-software-planning-emb`, `argus-firmware-c-emb` |
| Urgency / ownership | Software Lead coordinating five project teams while interning | `lead-standardize-evidence-swe` |

**No evidence for:**

- **Rust.** Listed first, but the bar is "or similar" and you have three of the
  other four. Don't fake it. If asked, say you haven't written Rust and would
  pick it up — they'll respect that more than hedging.
- **Scale** in the sense of large distributed systems. Your systems are real but
  small. Say "zero-to-one" and "end to end," not "at scale."

## Step 4 — Changes made to the base

Starting from `bases/software_backend.tex`:

- **SR-Wireless-CAN leads the projects section, rewritten as a zero-to-one
  narrative.** The flashing bullet now opens with the *problem* ("firmware
  updates required a tethered vendor tool") before the solution, because
  "problem identification to production-grade solution" is their literal
  phrasing and this is the strongest match on the page.
- **A `Hardware & Manufacturing` skills line added** — CAN/DBC, embedded
  firmware, VCU/STM32, PX4, hardware test and validation. This line exists
  purely to make the domain fluency scannable in five seconds.
- **FSAE Software Controls Engineer added back** to Experience for the hardware
  credibility the backend base drops.
- **Sailfish dropped** — weakest metric, earns nothing here.
- **Tickr kept** as the second project; "AI-native" is their positioning and
  Tickr is your LLM evidence.

## Step 5 — Truth check

- [x] Nothing claimed that was only planned or researched
- [x] No unverifiable metric on this version (Sailfish 32% dropped)
- [x] Titles and dates consistent with every other version
- [x] SR-Wireless-CAN scope confirmed (backend lead)
- [x] No Rust claimed; no "at scale" claimed
- [ ] I could explain every bullet technically in an interview
- [x] Filename is `Akash Karthik Heliux Resume.pdf`
- [x] Company name appears in the filename only
- [x] Tracker row added

## Read the posting honestly before you apply

Two lines are worth taking at face value:

- *"As an intern, the expectation is that you will operate at the same capacity
  as a full-time engineer."*
- *"Inherent desire to operate with extreme levels of urgency across all aspects
  of **life** and work."*

That is a company telling you plainly that it expects to occupy your life, not
just your working hours. That may be exactly what you want at this stage — a lot
of people get more out of one intense startup summer than three comfortable
ones. But you are currently holding an Argus internship *and* a Spartan Racing
lead role, and this is not a place that will flex around either.

Decide before the interview, not after an offer. And ask what a normal week
actually looks like — a company that says this out loud will usually answer
honestly.

## Interview prep

- **Open with the flashing story and frame it as zero-to-one.** Problem nobody
  had assigned you, undocumented protocol, decoded from captures, shipped as a
  tool the team uses. That is their headline requirement answered with one
  concrete story.
- Expect "tell me about the hardest technical problem you've solved." Same story,
  told with more depth: how you isolated the flashing frames, sequencing and
  acknowledgements, what happened on a partial write.
- They'll want evidence you can talk to hardware engineers. Use Formula SAE —
  you write software for people who build the physical thing, and you have run
  test campaigns with them.
- Ask what their customers' actual workflow pain is. They sell "eliminating
  cross-functional fragmentation"; ask for a concrete example. It'll tell you
  whether the product is real.

## Outcome log

| Date | Event |
| --- | --- |
| 2026-08-04 | Tailored resume prepared |
