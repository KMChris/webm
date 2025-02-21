@echo off
setlocal enabledelayedexpansion
set output=output.mp4
set listfile=temp.txt
if exist %output% del %output%
if exist %listfile% del %listfile%
for %%f in (*.webm *.mp4) do (
    echo file '%%f' >> %listfile%
)
ffmpeg -f concat -safe 0 -i %listfile% -c copy %output%
del %listfile%
echo Merge complete! Output file: %output%
pause
