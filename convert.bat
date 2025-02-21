@echo off
setlocal enabledelayedexpansion
powershell -Command "$lastHour = (Get-Date).AddHours(-1); Get-ChildItem -Filter *.webm | Where-Object { $_.LastWriteTime -gt $lastHour } | ForEach-Object { $outputFile = $_.BaseName + '.mp4'; Write-Host ('Converting ' + $_.BaseName); & 'ffmpeg' -loglevel warning -stats -i $_.FullName -strict experimental -vsync 1 $outputFile }"
pause
