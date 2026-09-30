#!/usr/bin/env sh
# Starts a local server for the prototype and opens it in the browser.
# Usage: ./start-server.sh [port]   (default 8000). Set NO_BROWSER=1 to skip opening the browser.
cd "$(dirname "$0")" || exit 1
PORT="${1:-8000}"
URL="http://localhost:$PORT/"

open_browser() {
  [ -n "$NO_BROWSER" ] && return
  ( sleep 1
    if command -v open >/dev/null 2>&1; then open "$URL"
    elif command -v xdg-open >/dev/null 2>&1; then xdg-open "$URL"
    elif command -v cmd.exe >/dev/null 2>&1; then cmd.exe /c start "" "$URL"
    fi ) >/dev/null 2>&1 &
}

# Use the first Python that actually runs (skips the Windows Store "python3" stub).
PY=""
for c in python3 python py; do
  if "$c" -c "import http.server" >/dev/null 2>&1; then PY="$c"; break; fi
done

echo "Prototype running at $URL"
echo "Press Ctrl+C to stop the server."
if [ -n "$PY" ]; then
  open_browser
  exec "$PY" -m http.server "$PORT"
elif command -v npx >/dev/null 2>&1; then
  open_browser
  exec npx --yes http-server . -p "$PORT" -c-1 --silent
else
  echo "Python or Node.js is needed to run the server." >&2
  exit 1
fi
