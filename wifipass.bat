@echo off
title Wi-Fi Password Viewer
rem Define color codes
set "ESC="
set "BLUE=[38;2;62;163;255m"
set "GREEN=[38;2;24;231;11m"
echo %ESC%%BLUE%
echo =======================================
echo   Wi-Fi Password Viewer by amryar10
echo =======================================
echo %ESC%%GREEN%

for /f "tokens=*" %%i in ('netsh wlan show profiles') do (
    set "ssid=%%i"
    setlocal enabledelayedexpansion
    for /f "tokens=2 delims=:" %%j in ("!ssid!") do (
        set "ssid=%%j"
        set "ssid=!ssid:~1!"
        echo [SSID: !ssid!]
        netsh wlan show profile name="!ssid!" key=clear | findstr /c:"Key Content"
    )
    endlocal
)
pause

rem Reset color
echo %ESC%