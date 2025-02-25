@echo off
setlocal enabledelayedexpansion

set OUTPUT=output.mp4
set FILELIST=temp.txt
if exist %OUTPUT% del %OUTPUT%
if exist %FILELIST% del %FILELIST%
if exist temp rd /s /q temp
mkdir temp

set COUNT=0
for %%F in (*.webm) do (
    set /a COUNT+=1
    ffmpeg -i "%%F" -strict experimental -fps_mode cfr "temp\video!COUNT!.mp4"
    echo file 'temp\video!COUNT!.mp4' >> %FILELIST%
)

if not exist %FILELIST% (
    echo No valid video files found in the directory.
    pause
    exit /b
)

ffmpeg -f concat -safe 0 -i %FILELIST% -c copy %OUTPUT%

if exist %FILELIST% del %FILELIST%
if exist temp rd /s /q temp

echo Merge complete! Output saved as %OUTPUT%
pause
