@echo off
Color 9F
@echo    *************************************
@echo    **        	@mmonestel1		  **
@echo    *************************************


mkdir "%~d0%~p0Logs_Programas"

SET rutalogs="%~d0%~p0Logs_Programas\%~n0.txt"
SET regsaver="%~d0%~p0Logs_Programas\%COMPUTERNAME%__%date:~-4,4%%date:~-10,2%%date:~-7,2%_%time:~0,2%%time:~3,2%%time:~6,2%.reg"
SET regsave="%~d0%~p0Logs_Programas\%COMPUTERNAME%_Respaldo.reg"

echo "Respaldando Regedit %date% %time%" >>%rutalogs% 


start regedit.exe /e %regsave% HKEY_CLASSES_ROOT\ms-msdt
start regedit.exe /e %regsaver% HKEY_CLASSES_ROOT\ms-msdt


echo "Eliminando Regedit %date% %time%" >>%rutalogs% 
reg delete HKEY_CLASSES_ROOT\ms-msdt /f



REM ****** Guardar Registro ***
@echo off
@for /F "tokens=* delims= " %%i in ('ipconfig^|FINDSTR "Dirección IPv4" ') do set mip=%%i 
@set mip=%mip:~44,-1%
@echo %mip%
REM ****** Datos Logs
echo "%computername%";"%mip%";"%username%";"%date% %time%" >>%rutalogs% 
@echo off
