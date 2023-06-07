@echo off
setlocal enabledelayedexpansion

REM Define variables
set "audioFile=output.wav"
set "pitchValue=1"
set "effectValue=none"
set "delayTime=0.3"

REM Start recording
echo Starting recording...
ffmpeg -y -f dshow -i audio="virtual-audio-capturer" -t 10 "%audioFile%"

REM Apply pitch and effects
echo Applying pitch and effects...
ffmpeg -y -i "%audioFile%" -af "asetrate=44100*%pitchValue%,aecho=0.8:0.9:1000:0.3" "modified_%audioFile%"

REM Play modified audio
echo Playing modified audio...
start "modified_%audioFile%"

REM Clean up
echo Cleaning up...
del "%audioFile%"

echo Done.
pause
