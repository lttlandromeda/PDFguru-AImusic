# PDFGuru AI Music Generator — redesign prototype

A clickable design prototype of the redesigned AI Music Generator flow. It is a concept for a design test task, not a working service.

**Flow:** Create (one screen, quick prompt + More options) → Generating → Result (two versions, 5-second previews) → Account gate → Choose a plan → Checkout → Download complete with a commercial license and a PDF certificate.

## What is simulated

- Every track plays the same placeholder audio file (`placeholder-track.wav`) until a real model is connected.
- Generation, downloads and payments are simulated. No data is sent anywhere and no money is taken.
- The **Prototype** button (bottom left) jumps to any screen, fails the next generation, or signs in with a plan.

## Run locally

The audio file loads only through a server, so start one from this folder. You need Python 3 or Node.js.

- **Windows:** double-click `start-server.bat`
- **macOS / Linux / Git Bash:** `./start-server.sh`

The script opens http://localhost:8000 in the browser. Press Ctrl+C in its window to stop the server.

Use another port by passing it as an argument, for example `start-server.bat 8080` or `./start-server.sh 8080`. Set `NO_BROWSER=1` to start without opening the browser.

In the Claude desktop app, the `prototype` configuration in `.claude/launch.json` opens it in the built-in browser pane.
