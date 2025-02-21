@echo off
setlocal enabledelayedexpansion

set OUTPUT=output.webm
set FILELIST=temp.txt
if exist %OUTPUT% del %OUTPUT%
if exist %FILELIST% del %FILELIST%

set COUNT=0
for %%F in (*.webm) do (
    set /a COUNT+=1
    echo file %%F >> %FILELIST%
)

if not exist %FILELIST% (
    echo No valid video files found in the directory.
    pause
    exit /b
)

ffmpeg -f concat -safe 0 -i %FILELIST% -c copy %OUTPUT%

if exist %FILELIST% del %FILELIST%

echo Merge complete! Output saved as %OUTPUT%
pause
