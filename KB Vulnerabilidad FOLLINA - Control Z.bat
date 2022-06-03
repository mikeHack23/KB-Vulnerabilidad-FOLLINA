@echo off
Color 9F
@echo    *************************************
@echo    **        	@mmonestel1		  **
@echo    *************************************


mkdir "%~d0%~p0Logs_Programas"

SET rutalogs="%~d0%~p0Logs_Programas\%~n0.txt"
SET regsave="%~d0%~p0Logs_Programas\%COMPUTERNAME%_Respaldo.reg"

echo "Restaurando Regedit %date% %time%" >>%rutalogs% 

regedit.exe /s %regsave%

REM ****** Guardar Registro ***
@echo off
@for /F "tokens=* delims= " %%i in ('ipconfig^|FINDSTR "Dirección IPv4" ') do set mip=%%i 
@set mip=%mip:~44,-1%
@echo %mip%
REM ****** Datos Logs
echo "%computername%";"%mip%";"%username%";"%date% %time%" >>%rutalogs% 
@echo off
