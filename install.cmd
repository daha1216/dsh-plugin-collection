@echo off
setlocal enableextensions
rem Double-clickable Windows entry point for the DSH plugin catalog.
rem Usage: double-click this file, or run from cmd:
rem   install.cmd -List
rem   install.cmd -Plugin dsh-pet
rem   install.cmd -All

set "PSEXE=powershell"
where pwsh >nul 2>&1 && set "PSEXE=pwsh"

set "BASE=%~dp0"
if not exist "%BASE%install.ps1" set "BASE=%TEMP%\dsh-plugin-collection\"

if exist "%BASE%install.ps1" goto run

where git >nul 2>&1
if errorlevel 1 goto nogit
echo [INFO] install.ps1 not found next to this file - cloning the catalog to:
echo        %BASE%
if not exist "%BASE%" mkdir "%BASE%"
set "DST=%BASE%"
if not "%DST:~-1%"=="\" goto nodot
set "DST=%DST:~0,-1%"
:nodot
git clone --depth 1 https://github.com/daha1216/dsh-plugin-collection.git "%DST%"
if errorlevel 1 goto clonefail

:run
"%PSEXE%" -NoProfile -ExecutionPolicy Bypass -File "%BASE%install.ps1" %*
goto finish

:nogit
echo [ERROR] git was not found and install.ps1 is not next to this file.
echo [ERROR] Install git, or run this file from inside a clone of the repository.
goto finish

:clonefail
echo [ERROR] git clone failed - check your network connection and retry.

:finish
echo.
echo Done. Press any key to close this window...
pause >nul
endlocal