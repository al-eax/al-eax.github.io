@echo off

REM --- Datum extrahieren ---
for /f "tokens=2 delims==" %%I in ('"wmic os get localdatetime /value"') do set datetime=%%I
set year=%datetime:~0,4%
set month=%datetime:~4,2%
set day=%datetime:~6,2%

if "%~1"=="" (
    echo Usage: %~nx0 postname
    exit /b 1
)

set postname=%~1
set foldername=%year%-%month%-%day%

REM --- Absoluter Pfad zum Script ---
set scriptPath=%~dp0

REM --- Hugo-Projekt-Root (ein Verzeichnis über dem Scripts-Ordner) ---
set projectRoot=%scriptPath%..

REM --- In Projekt-Root wechseln ---
cd /d "%projectRoot%"

REM --- Ordner im content/posts erstellen ---
mkdir "content/posts/%foldername%" >nul 2>&1

REM --- Hugo Posts erstellen (relativ zum Projekt-Root) ---
hugo new "posts/%foldername%_%postname%/%postname%.en.md"
hugo new "posts/%foldername%_%postname%/%postname%.de.md"