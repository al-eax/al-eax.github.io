@echo off

set scriptPath=%~dp0

set projectRoot=%scriptPath%..

cd /d "%projectRoot%"

hugo server -D