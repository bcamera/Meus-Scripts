@echo off
REM source of admin privilegies code > https://sites.google.com/site/eneerge/scripts/batchgotadmin
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
        goto UACPrompt
	) else ( goto gotAdmin )

	:UACPrompt
	    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	        set params = %*:"=""
		    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
		        "%temp%\getadmin.vbs"
			    del "%temp%\getadmin.vbs"
			        exit /B
				:gotAdmin
				    pushd "%CD%"
				        CD /D "%~dp0"
					:--------------------------------------
					REM Code By bcamera
					REM @echo off
					:start
					cls
					@echo.
					@echo Defina o modo usb: 
					@echo 1 = Leitura   
					@echo 2 = Leitura/Escrita    
					@echo 3 = Desabilitar Autorun USB 
					@echo 4 = Habilitar Autorun     
					@echo 5 = Desabilitar Autorun de Todas as Midias
					@echo 6 = Realizar Backup do Registro a Ser Alterado
					@echo 0 = Sair do Programa
					@echo.
					:aff
					set /p opcao=Digite a opcao: 
					if %opcao% equ 1 goto ex1
					if %opcao% equ 2 goto ex2
					if %opcao% equ 3 goto ex3
					if %opcao% equ 4 goto ex4
					if %opcao% equ 5 goto ex5
					if %opcao% equ 6 goto ex6
					if %opcao% equ 0 goto ex0
					:ex1
					@echo.
					reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v WriteProtect /t REG_DWORD /d 1 /f
					if %errorlevel% equ 0 @echo Modo usb somente leitura ativado.
					pause
					goto start
					exit
					:ex2
					@echo.
					reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorageDevicePolicies" /v WriteProtect /t REG_DWORD /d 0 /f
					if %errorlevel% equ 0 @echo Modo usb somente leitura desativado.
					pause
					goto start
					exit 
					:ex3
					@echo.
					reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 4 /f  
					if %errorlevel% equ 0 @echo Autorun para usb desabilitado. 
					pause
					goto start
					exit
					:ex4 
					@echo.
					reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 0 /f  
					if %errorlevel% equ 0 @echo Autorun para usb Habilitado. 
					pause
					goto start
					exit 
					:ex5 
					@echo.
					reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f  
					if %errorlevel% equ 0 @echo Autorun Desabilitado para Todas as Midias. 
					pause
					goto start
					exit 
					:ex6 
					@echo.
					reg export "HKEY_LOCAL_MACHINE" "C:\Users\%username%\Desktop\backup.reg
					if %errorlevel% equ 0 @echo Backup Efetuado. 
					pause
					goto start
					exit 
