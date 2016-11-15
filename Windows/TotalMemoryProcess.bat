@echo off
	:start
	cls
	@echo.
	@echo 
	@echo 1 = Filtrar por nome do processo.
	@echo 0 = Sair do Programa
	@echo.
	:aff
	set /p opcao=Digite a opcao: 
	if %opcao% equ 1 goto ex1
	if %opcao% equ 0 goto ex0
	:ex1
	@echo.
	set /p processo=Digite o processo:
	:task1
	cls
	set total=NULL
	echo. 2>tmp.txt
	echo. 2>tmp2.txt
	for /f delims^=^"^ tokens^=9 %%i in ('"tasklist /nh /fo CSV /fi "imagename eq %processo%""') do echo %%i >> tmp.txt
	for /f "tokens=1" %%i in (tmp.txt) do echo %%i >> tmp2.txt
	for /f %%a in (tmp2.txt) do (set /a total+=%%a)
	@echo %total%
	DEL tmp.txt
	DEL tmp2.txt
	TIMEOUT 3
	GOTO task1
	:ex2
	
	:ex0
	pause
	exit
