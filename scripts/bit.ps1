if (!([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Por favor, ejecuta este script como administrador." -ForegroundColor Red
    Exit
}

try {
    Write-Host "Deshabilitando IPv6..."
    Set-NetAdapterBinding -Name "Ethernet" -ComponentID ms_tcpip6 -Enabled $false
    Write-Host "IPv6 deshabilitado."
} catch {
    Write-Host "Error al deshabilitar IPv6: $_" -ForegroundColor Red
}

$vsCodeInstallerUrl = "https://aka.ms/win32-x64-user-stable"
$vsCodeInstallerPath = "$env:TEMP\VSCodeSetup.exe"

try {
    Write-Host "Descargando Visual Studio Code Installer..."
    Invoke-WebRequest -Uri $vsCodeInstallerUrl -OutFile $vsCodeInstallerPath -UseBasicPipelines -ErrorAction Stop
} catch {
    Write-Host "Error al descargar el instalador de Visual Studio Code: $_" -ForegroundColor Red
}

Write-Host "Instalando Visual Studio Code..."
Start-Process -FilePath $vsCodeInstallerPath -ArgumentList "/VERYSILENT /NORESTART" -Wait

$shortcutPath = "$env:USERPROFILE\Desktop\Visual Studio Code.lnk"
$vsCodePath = "$env:ProgramFiles\Microsoft VS Code\Code.exe"

if (Test-Path $vsCodePath) {
    $WshShell = New-Object -ComObject WScript.Shell
    $shortcut = $WshShell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath = $vsCodePath
    $shortcut.IconLocation = $vsCodePath
    $shortcut.Save()
    Write-Host "Acceso directo creado en el escritorio."
} else {
    Write-Host "No se encontró el ejecutable de Visual Studio Code." -ForegroundColor Yellow
}

$githubUrl = "https://raw.githubusercontent.com/Rendorrr/SkyHosting/Rendorrr/SkyHosting.txt"
$downloadPath = "$env:USERPROFILE\Desktop\SkyHosting.txt"

try {
    Write-Host "Descargando archivo de GitHub..."
    Invoke-WebRequest -Uri $githubUrl -OutFile $downloadPath -ErrorAction Stop
} catch {
    Write-Host "Error al descargar el archivo de GitHub: $_" -ForegroundColor Red
    Exit
}

Write-Host "Instalación completada y archivo descargado en el escritorio."
exit