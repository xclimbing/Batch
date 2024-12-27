@echo on
set curdir=%~dp0% 
set servicename=frpc
set servicedes=Frp Client Service
set srvanypath=%curdir%srvany.exe
set apppath=%curdir%frpc.exe -c frpc.ini
set appdir=%curdir%

sc stop %servicename%
sc delete %servicename%
sc create %servicename% binPath= "%srvanypath%"  start= auto 
sc description %servicename% "%servicedes%" 
reg add HKLM\SYSTEM\CurrentControlSet\Services\frpc\Parameters /f /v Application /d "%apppath%" 
reg add HKLM\SYSTEM\CurrentControlSet\Services\frpc\Parameters /f /v AppDirectory /d "%appdir%" 
sc start %servicename%
