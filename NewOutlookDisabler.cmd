@echo off
title Prevent New Outlook from installing or force opening.
echo New Outlook Mirgation Disabler
rem Make sure you run as Administator or some of features will not work
echo.
echo ====== Applying... =======
echo Applying "NewOutlookMigrationUserSetting" to disabled.
reg.exe ADD "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\Outlook\Preferences" /v NewOutlookMigrationUserSetting /t REG_DWORD /d 0 /f
echo Applying "UseNewOutlook" to disabled.
reg.exe ADD "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Preferences" /v UseNewOutlook /t REG_DWORD /d 0 /f
echo Stopping auto install of New Outlook from Windows Update
reg.exe ADD "HKLM\SOFTWARE\Microsoft\WindowsUpdate\Orchestrator\UScheduler_Oobe\OutlookUpdate" /v "BlockedOobeUpdaters" /t REG_SZ /d "["MS_Outlook"]" /f
echo Script finished, thank you for using this.

rem (uncomment if need to check internet connectivity) ping officecdn.microsoft.com
pause
