@echo off
setlocal enabledelayedexpansion

set FILELIST=output.txt
if exist %FILELIST% del %FILELIST%
del /q output\*.mp4

set COUNT=0
for %%F in (*.webm) do (
    set /a COUNT+=1
    ffmpeg -i "%%F" -strict experimental -vsync 1 "output\video!COUNT!.mp4"
    echo file 'output\video!COUNT!.mp4' >> %FILELIST%
)

echo Converted!
pause
