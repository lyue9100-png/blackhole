@echo off
chcp 65001 >nul
title 将浏览器设为"高性能 GPU"（走独显）
echo 将为 Chrome / Edge 写入 Windows 图形首选项：高性能（独显）。
echo 说明：等价于「设置 -^> 系统 -^> 屏幕 -^> 显示卡」里把浏览器改成"高性能"。
echo 提醒：会增加耗电；随时可用 windows-restore-gpu-preference.bat 还原。
echo.
choice /c YN /m "继续"
if errorlevel 2 exit /b 0
set "K=HKCU\Software\Microsoft\DirectX\UserGpuPreferences"
for %%P in ("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" "C:\Program Files\Microsoft\Edge\Application\msedge.exe" "C:\Program Files\Google\Chrome\Application\chrome.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe") do (
  if exist %%P reg add "%K%" /v "%%~P" /t REG_SZ /d "GpuPreference=2;" /f >nul && echo 已设置: %%~P
)
echo.
echo 完成。请完全退出浏览器（含后台进程/托盘）再重新打开。
pause