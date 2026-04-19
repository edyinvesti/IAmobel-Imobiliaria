@echo off
title iAmobil - Iniciando Sistema...
echo.
echo  ============================================
echo   iAmobil - Iniciando todos os servidores...
echo  ============================================
echo.

echo  [*] Liberando portas anteriores...
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":3000 " ^| findstr "LISTENING" 2^>nul') do taskkill /F /PID %%a >nul 2>&1
for /f "tokens=5" %%a in ('netstat -ano ^| findstr ":18789 " ^| findstr "LISTENING" 2^>nul') do taskkill /F /PID %%a >nul 2>&1
timeout /t 1 /nobreak >nul
echo  [OK] Portas liberadas.
echo.

start "iAmobil - Sistema Completo" cmd /k "cd /d %~dp0 && npm run dev"

echo.
echo  [OK] Servidor iAmobil iniciado (App + Telegram + Hermes) em uma unica janela!
echo.
pause
