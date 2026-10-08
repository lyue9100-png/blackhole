@echo off
chcp 65001 >nul
title 还原浏览器 GPU 偏好（让 Windows 决定）
set "K=HKCU\Software\Microsoft\DirectX\UserGpuPreferences"
for %%P in ("C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" "C:\Program Files\Microsoft\Edge\Application\msedge.exe" "C:\Program Files\Google\Chrome\Application\chrome.exe" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe") do (
  reg delete "%K%" /v "%%~P" /f >nul 2>nul && echo 已移除: %%~P
)
echo.
echo 完成。请完全退出浏览器后再打开。
pause