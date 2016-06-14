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

@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

echo "Navegadores"
choco install tor-browser -y
choco install googlechrome -y 
choco install firefox -packageParameters "l=pt-BR" -y 
choco install adblockplus-firefox  -y

echo "Essenciais"
choco install dotnet4.0  -y
choco install dotnet4.5.2  -y
choco install silverlight  -y
REM choco install adobeshockwaveplayer  -y
choco install flashplayerplugin  -y
choco install winrar  -y
choco install 7zip.install  -y
choco install adobereader  -y
choco install unitywebplayer  -y
choco install dogtail.dotnet3.5sp1 -y
choco install vcredist2013  -y
choco install vcredist2008  -y
choco install vcredist2005  -y

echo "Escritorio" 
choco install libreoffice  -y
choco install thunderbird  -y
choco install nano  -y
choco install vim -y
choco install sublimetext3 -y

echo "Desenvolvimento"
choco install winmerge  -y
choco install jdk8  -y
REM choco install android-sdk  -y
choco install git.install -params "/GitAndUnixToolsOnPath /NoAutoCrlf" -y
choco install eclipse -y

echo "Conexão Remota"
choco install teamviewer  -y

echo "Limpeza"
choco install ccleaner -y
REM choco install eraser -y

echo "Multimidia"
choco install k-litecodecpackfull -y

echo "InfoSistema"
choco install cpu-z -y

echo "UsbBoot"
choco install yumi -y
choco install rufus.install -y

echo "Edicao de Video"
choco install handbrake.install -y

echo "Utilidade publica"
choco install sudo -y
choco install Everything -y

echo "Vpn"
choco install openvpn -y

echo "Criptografia"
choco install gpg4win  -y
choco install veracrypt  -y

echo "Virtualizacao"
choco install vmwareplayer  -y
choco install virtualbox  -y

echo "Gaming"
choco install teamspeak -y
choco install steam -y
REM choco install origin -y (still waiting for approval)
choco install battle.net -y
