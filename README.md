# PDFGuru AI Music Generator — redesign prototype

A clickable design prototype of the redesigned AI Music Generator flow. It is a concept for a design test task, not a working service.

**Flow:** Create (one screen, quick prompt + More options) → Generating → Result (two versions, 5-second previews) → Account gate → Choose a plan → Checkout → Download complete with a commercial license and a PDF certificate.

## What is simulated

- Every track plays the same placeholder audio file (`placeholder-track.wav`) until a real model is connected.
- Generation, downloads and payments are simulated. No data is sent anywhere and no money is taken.
- The **Prototype** button (bottom left) jumps to any screen, fails the next generation, or signs in with a plan.

## Run locally

Open `index.html` through any static server, for example:

```bash
python -m http.server 8000
```

Then open http://localhost:8000.
