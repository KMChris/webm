@echo off
setlocal enabledelayedexpansion
if "%~1"=="" (
    echo Please drag and drop a video file onto this script.
    pause
    exit /b
)
set input="%~1"
for %%A in ("%~n1") do set output="%%~A_trim%~x1"
set /p start_time="Enter start time (HH:MM:SS or seconds): "
set /p end_time="Enter end time (HH:MM:SS or seconds): "
ffmpeg -i %input% -ss %start_time% -to %end_time% %output%
echo Trim complete! Output file: %output%
pause
