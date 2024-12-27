@echo off 
set svcname=frps
set svcdesc="frp Server"
set svcbin=frps.exe -c frps.ini

@echo sc stop %svcname% > !register_as_server.bat
@echo sc delete %svcname% >> !register_as_server.bat
@echo sc create %svcname% binPath= "%cd%\srvany.exe" start= auto >> !register_as_server.bat
@echo sc description %svcname% %svcdesc% >> !register_as_server.bat
@echo reg add HKLM\SYSTEM\CurrentControlSet\Services\%svcname%\Parameters /v Application /d "%cd%\%svcbin%" >> !register_as_server.bat /f
@echo reg add HKLM\SYSTEM\CurrentControlSet\Services\%svcname%\Parameters /v AppDirectory /d "%cd%" >> !register_as_server.bat /f
@echo sc start %svcname% >> !register_as_server.bat

@echo sc stop %svcname% > !delete_server.bat
@echo sc delete %svcname% >> !delete_server.bat

@echo �ɹ��ˡ���
@echo.
@echo ������� *����Ա���* ��������ļ���!register_as_server.bat
@echo.
@pause