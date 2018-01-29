@echo off
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections | Find "0x0" > nul
IF %ERRORLEVEL% == 0 goto disable
IF %ERRORLEVEL% == 1 goto enable
goto end

:enable
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall add rule name="Remote Desktop" dir=in action=allow protocol=TCP localport=3389
echo rdp is now enabled
goto end

:disable
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
netsh advfirewall delete rule name="Remote Desktop
echo rdp is now disabled
goto end"

:end
