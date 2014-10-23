@ECHO OFF
TASKKILL /F /IM EXPLORER.EXE
::SLEEP 1
start explorer.exe
sleep -m 100
start explorer.exe /e,"%cd%"
