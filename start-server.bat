@echo off
rem Starts a local server for the prototype and opens it in the browser.
rem Usage: double-click, or run "start-server.bat 8080" to use another port.
rem Set NO_BROWSER=1 to skip opening the browser.
setlocal
cd /d "%~dp0"
set "PORT=8000"
if not "%~1"=="" set "PORT=%~1"
set "URL=http://localhost:%PORT%/"

rem Use the first Python that actually runs (skips the Windows Store "python" stub).
set "PY="
python -c "import http.server" >nul 2>nul && set "PY=python"
if not defined PY py -3 -c "import http.server" >nul 2>nul && set "PY=py -3"
if defined PY goto python
where npx >nul 2>nul
if %errorlevel%==0 goto node

echo Python or Node.js is needed to run the server.
echo Install Python from https://www.python.org/downloads/ and run this file again.
pause
exit /b 1

:python
echo Prototype running at %URL%
echo Press Ctrl+C to stop the server.
if not defined NO_BROWSER start "" "%URL%"
%PY% -m http.server %PORT%
exit /b %errorlevel%

:node
echo Prototype running at %URL%
echo Press Ctrl+C to stop the server.
if not defined NO_BROWSER start "" "%URL%"
npx --yes http-server . -p %PORT% -c-1 --silent
exit /b %errorlevel%
