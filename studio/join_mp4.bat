@echo off
setlocal enabledelayedexpansion

set OUTPUT=output.mp4
set FILELIST=output.txt
if exist %OUTPUT% del %OUTPUT%

if not exist %FILELIST% (
    echo No valid video files found in the directory.
    pause
    exit /b
)

ffmpeg -f concat -safe 0 -i %FILELIST% -c copy %OUTPUT%

echo Merge complete! Output saved as %OUTPUT%
pause
