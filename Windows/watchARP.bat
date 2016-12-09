@echo off

for /f "tokens=2 delims=:" %%g in ('netsh interface ip show address "Ethernet" ^| findstr "PadrÆo"') do (set DefaultGateway=%%g)
echo %DefaultGateway%
for /f "tokens=2" %%g in ('arp -a ^| findstr %DefaultGateway%') do (set macGateway=%%g)
echo %macGateway%

:loop
for /f "tokens=2 delims=:" %%g in ('netsh interface ip show address "Ethernet" ^| findstr "PadrÆo"') do (set DefaultGateway2=%%g)
echo %DefaultGateway2%
for /f "tokens=2" %%g in ('arp -a ^| findstr %DefaultGateway2%') do (set macGateway2=%%g)
echo %macGateway2%

if %macGateway% equ %macGateway2% goto ex1
if %macGateway% neq macGateway2 goto ex2


:ex1
TIMEOUT 10
goto loop

:ex2
msg * "MITM"
echo %time%
pause
