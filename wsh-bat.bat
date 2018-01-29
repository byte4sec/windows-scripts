echo @echo off > wsh.bat
echo reg query "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Script Host\Settings" /v Enabled ^| Find "0" ^> nul >> wsh.bat
echo|set /p="IF %ERRO" >> wsh.bat
echo RLEVEL% == 0 goto enable >> wsh.bat
echo|set /p="IF %ERRO" >> wsh.bat
echo RLEVEL% == 1 goto disable >> wsh.bat
echo goto end >> wsh.bat
echo :enable >> wsh.bat
echo reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Script Host\Settings" /v Enabled /t REG_SZ /d 1 /f >> wsh.bat
echo echo Windows Script Host is now enabled >> wsh.bat
echo goto end >> wsh.bat
echo :disable >> wsh.bat
echo reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows Script Host\Settings" /v Enabled /t REG_SZ /d 0 /f >> wsh.bat
echo echo Windows Script Host is now disabled >> wsh.bat
echo goto end >> wsh.bat
echo :end >> wsh.bat
