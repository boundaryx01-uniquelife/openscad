@echo off
tasklist /NH /FI "IMAGENAME eq openscad.exe" 2>nul | find /I "openscad.exe" >nul
if not errorlevel 1 (
  echo.
  echo OpenSCAD is already running.
  echo Close every OpenSCAD window, then run this file again.
  echo The bundled Korean fonts cannot be added to an already-running process.
  echo.
  pause
  exit /b 1
)
set "OPENSCAD_FONT_PATH=%~dp0fonts-custom"
start "" "C:\Program Files\OpenSCAD\openscad.exe" "%~dp0keycap-legend.scad"
