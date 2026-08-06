@echo off
REM Double-click this to open the application tracker in your browser.
cd /d "%~dp0"
node "scripts\tracker-server.mjs"
if errorlevel 1 (
  echo.
  echo Could not start. Is Node installed?  https://nodejs.org
  pause
)
