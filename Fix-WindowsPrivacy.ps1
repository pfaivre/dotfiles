<#
.SYNOPSIS
    Fix some privacy and configuration issues in Windows 11.
.DESCRIPTION
    This script disables telemetry services, AI packages, and other privacy-related settings in Windows 11.
    It targets various privacy-invasive features including telemetry, AI-related components, and unnecessary services.
.PARAMETER Apply
    When specified, the script will actually apply the changes to the system.
    Without this parameter, the script will only report the current status of each setting.
.PARAMETER AiSettings
    When specified, the script will also disable AI-related components such as:
    - The Recall optional feature
    - The Microsoft Copilot in-box app
    - AI-related Component Based Servicing packages (AIX, Recall, Copilot, CoreAI)
    - AI-related Shell Update registry entries
.PARAMETER QualityOfLife
    When specified, the script will also apply quality-of-life improvements such as:
    - Disabling hibernation
    - Reducing menu show delay for faster navigation
    - Disabling Windows interface animations
    - Showing window contents while moving windows
    - Enabling font smoothing (ClearType)
.NOTES
    Last Update: 2026-10-10
    For more settings to disable, see https://github.com/zoicware/RemoveWindowsAI/blob/main/RemoveWindowsAi.ps1
    Windows appears reluctant to let us set these AI policy values; uncomment to try:
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "TurnOffWindowsCopilot" -Value 1 -Type DWord
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableAIDataAnalysis" -Value 1 -Type DWord
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "AllowRecallEnablement" -Value 0 -Type DWord
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableClickToDo" -Value 1 -Type DWord
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "TurnOffSavingSnapshots" -Value 1 -Type DWord
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableSettingsAgent" -Value 1 -Type DWord
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableAgentConnectors" -Value 1 -Type DWord
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableAgentWorkspaces" -Value 1 -Type DWord
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableRemoteAgentConnectors" -Value 1 -Type DWord
    # Set-RegistrySetting -Path "HKCU:\SOFTWARE\Policies\WindowsNotepad" -Name "DisableAIFeatures" -Value 1 -Type DWord

    REQUIREMENTS:
    - Run as Administrator
    - PowerShell 5.1 or later

    EXAMPLES:

    Check current settings without making changes:
    PS> .\Fix-WindowsPrivacy.ps1

    Apply privacy fixes:
    PS> .\Fix-WindowsPrivacy.ps1 -Apply

    Apply all optional changes:
    PS> .\Fix-WindowsPrivacy.ps1 -Apply -AiSettings -QualityOfLife
#>

param (
    [switch]$Apply,

    [switch]$AiSettings,

    [switch]$QualityOfLife
)

# Prints the SET/UNSET status line for a setting
function Write-SettingStatus {
    param (
        [Parameter(Mandatory)]
        [bool]$IsSet,
        [Parameter(Mandatory)]
        [string]$SetMessage,
        [Parameter(Mandatory)]
        [string]$UnsetMessage
    )

    if ($IsSet) {
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] $SetMessage"
    } else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] $UnsetMessage"
    }
}

# Function to disable and remove a service and check afterwards
function Disable-Service {
    param (
        [Parameter(Mandatory)]
        [string]$Name
    )

    $deleteExit = $null
    if ($Apply) {
        Stop-Service -Name "$Name" -Force -ErrorAction SilentlyContinue
        # Remove-Service -Name $Name -ErrorAction SilentlyContinue  # Remove-Service is not available in PowerShell 5
        sc.exe delete "$Name" *>$null
        $deleteExit = $LASTEXITCODE
    }

    $serviceStatus = Get-Service -Name "$Name" -ErrorAction SilentlyContinue
    if ($serviceStatus -eq $null) {
        Write-SettingStatus -IsSet $true -SetMessage "$Name service is removed." -UnsetMessage "$Name service is not removed."
        Write-Verbose "$Name is not found in services list.`n"
    } elseif ($deleteExit -eq 0) {
        Write-SettingStatus -IsSet $true -SetMessage "$Name service is marked for deletion (removed after reboot)." -UnsetMessage "$Name service is not removed."
        Write-Verbose "Service found: $($serviceStatus.Name) - $($serviceStatus.Status) ($($serviceStatus.StartupType)) - delete pending`n"
    } else {
        Write-SettingStatus -IsSet $false -SetMessage "$Name service is removed." -UnsetMessage "$Name service is not removed."
        Write-Verbose "Service found: $($serviceStatus.Name) - $($serviceStatus.Status) ($($serviceStatus.StartupType)) - $($serviceStatus.DisplayName) - $($serviceStatus.Description)`n"
    }
}

# Function to disable a scheduled task and validate afterwards
function Disable-Task {
    param (
        [Parameter(Mandatory)]
        [string]$TaskPath,
        [Parameter(Mandatory)]
        [string]$TaskName
    )

    # Get-ScheduledTask reports TaskPath with a trailing backslash; normalize so the cmdlet call and the comparison below use the canonical form
    $TaskPath = $TaskPath.TrimEnd('\') + '\'

    if ($Apply) {
        Disable-ScheduledTask -TaskPath $TaskPath -TaskName $TaskName -ErrorAction SilentlyContinue | Out-Null
    }

    $t = Get-ScheduledTask -TaskName $TaskName -ErrorAction SilentlyContinue | Where-Object { $_.TaskPath -eq $TaskPath }

    if ($t -eq $null) {
        Write-SettingStatus -IsSet $true -SetMessage "$TaskName is not present." -UnsetMessage "$TaskName is present."
        Write-Verbose "Task `"$TaskName`" not found in `"$TaskPath`" `n"
    }
    else {
        if ($t.State -eq "Disabled") {
            Write-SettingStatus -IsSet $true -SetMessage "$TaskName task is disabled." -UnsetMessage "$TaskName task is not disabled."
        } else {
            Write-SettingStatus -IsSet $false -SetMessage "$TaskName task is disabled." -UnsetMessage "$TaskName task is not disabled."
        }
        Write-Verbose "Task found: `"$($t.TaskPath)$($t.TaskName)`" - $($t.State)`n"
    }
}

# Function to set a registry value and check afterwards
function Set-RegistrySetting {
    param (
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$Name,
        [Parameter(Mandatory)]
        $Value,
        [Parameter(Mandatory)]
        [ValidateSet('DWord', 'String')]
        [string]$Type
    )

    if ($Apply) {
        if (-not (Test-Path -Path "$Path")) {
            New-Item -Path "$Path" -Force | Out-Null
        }
        Set-ItemProperty -Path "$Path" -Name "$Name" -Value $Value -Type $Type -Force
    }

    $value = (Get-ItemProperty -Path "$Path" -Name "$Name" -ErrorAction SilentlyContinue)."$Name"
    Write-SettingStatus -IsSet ($value -eq $Value) -SetMessage "$Name registry setting is set to `"$Value`"." -UnsetMessage "$Name registry setting is not set to `"$Value`"."
    Write-Verbose "$Path$Name = $value`n"
}

# Function to remove a registry key and check afterwards
function Remove-RegistrySetting {
    param (
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$Name
    )

    if ($Apply) {
        Remove-ItemProperty -Path "$Path" -Name "$Name" -Force -ErrorAction SilentlyContinue
    }

    $value = (Get-ItemProperty -Path "$Path" -Name "$Name" -ErrorAction SilentlyContinue)."$Name"
    Write-SettingStatus -IsSet ($value -eq $null) -SetMessage "$Name registry setting is removed." -UnsetMessage "$Name registry setting is not removed."
    Write-Verbose "$Path$Name = $value`n"
}

# Function to disable and remove a Windows feature and check afterwards
function Disable-Feature {
    param (
        [Parameter(Mandatory)]
        [string]$FeatureName
    )

    if ($Apply) {
        dism.exe /Online /Disable-Feature /FeatureName:$FeatureName /Remove /NoRestart /Quiet | Out-Null
    }

    $info = dism.exe /Online /Get-FeatureInfo /FeatureName:$FeatureName 2>&1
    if ($LASTEXITCODE -ne 0) {
        if ($LASTEXITCODE -eq 50 -or $info -match 'feature name is unknown') {
            Write-SettingStatus -IsSet $true -SetMessage "$FeatureName feature is not present." -UnsetMessage "$FeatureName feature is present."
            Write-Verbose "No feature named `"$FeatureName`" has been found on the system.`n"
        } else {
            Write-SettingStatus -IsSet $false -SetMessage "$FeatureName feature is not present." -UnsetMessage "$FeatureName feature status could not be checked (dism exit code $LASTEXITCODE)."
            Write-Verbose "dism /Get-FeatureInfo failed with exit code $LASTEXITCODE.`n"
        }
    } else {
        $state = (($info | Select-String -Pattern '^\s*State\s*:' | Select-Object -First 1).Line -replace '^\s*State\s*:\s*', '').Trim()
        Write-SettingStatus -IsSet ($state -eq 'Disabled' -or $state -eq 'DisablePending') -SetMessage "$FeatureName feature is disabled (state: $state)." -UnsetMessage "$FeatureName feature is not disabled (state: $state)."
        Write-Verbose "Feature `"$FeatureName`" state: $state`n"
    }
}

# Function to remove a Windows "in-box" app
function Remove-InboxApp {
    param (
        [Parameter(Mandatory)]
        [string]$Name
    )

    $inboxapps = "$env:windir\InboxApps"

    if ($Apply) {
        $installers = Get-ChildItem -Path $inboxapps -Filter "$Name*"
        foreach ($installer in $installers) {
            takeown /f $installer.FullName *>$null
            icacls $installer.FullName /grant *S-1-5-32-544:F /t *>$null
            Remove-Item -Path $installer.FullName -Force -ErrorAction SilentlyContinue
        }
    }

    $installers = Get-ChildItem -Path $inboxapps -Filter "$Name*"
    if ($installers -eq $null) {
        Write-SettingStatus -IsSet $true -SetMessage "$Name in-box app is removed." -UnsetMessage "$Name in-box app is not removed."
        Write-Verbose "Nothing found in `"$inboxapps\$Name*"".`n"
    } else {
        Write-SettingStatus -IsSet $false -SetMessage "$Name in-box app is removed." -UnsetMessage "$Name in-box app is not removed."
        Write-Verbose "Found $installers`n"
    }
}

# Function to disable telemetry logger (AutoLogger-Diagtrack-Listener.etl)
function Disable-TelemetryLogger {
    $etlPath = "$env:ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl"
    if (Test-Path $etlPath) {
        if ($Apply) {
            Clear-Content $etlPath
        }

        $size = (Get-Item -Path $etlPath -ErrorAction SilentlyContinue).Length
        Write-SettingStatus -IsSet ($size -eq 0) -SetMessage "Telemetry logger file is cleared." -UnsetMessage "Telemetry logger file is not cleared."
        Write-Verbose "File size $size : `"$etlPath`".`n"
    } else {
        Write-SettingStatus -IsSet $true -SetMessage "Telemetry logger file not found." -UnsetMessage "Telemetry logger file found."
        Write-Verbose "File not found: `"$etlPath`".`n"
    }
}

# Returns the Component Based Servicing packages that are installed (Visibility 2) and AI-related
function Get-AIRelatedCbsPackages {
    $regPath = 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Component Based Servicing\\Packages'
    $aiPatterns = '*AIX*', '*Recall*', '*Copilot*', '*CoreAI*'
    foreach ($package in (Get-ChildItem $regPath)) {
        $visibility = try { Get-ItemPropertyValue "registry::$($package.Name)" -Name Visibility -ErrorAction Stop } catch { $null }
        if ($visibility -ne 2) { continue }
        foreach ($pattern in $aiPatterns) {
            if ($package.PSChildName -like $pattern) {
                $package
                break
            }
        }
    }
}

# Removes the files of a CBS package from the servicing\Packages folder
function Remove-ServicingPackageFiles {
    param (
        [Parameter(Mandatory)]
        [string]$PackageName
    )
    $paths = Get-ChildItem "$env:windir\servicing\Packages" -Filter "*$PackageName*" -ErrorAction SilentlyContinue
    foreach ($path in $paths) {
        if ($path) {
            Remove-Item $path.FullName -Force -ErrorAction SilentlyContinue
        }
    }
}

# Function to remove various AI related packages
function Remove-AICBSPackages {
    $regPath = 'HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Component Based Servicing\\Packages'

    if ($Apply) {
        foreach ($package in (Get-AIRelatedCbsPackages)) {
            Write-Output "Removing $($package.PSChildName)..."
            Set-ItemProperty "registry::$($package.Name)" -Name Visibility -Value 1 -Force
            New-ItemProperty "registry::$($package.Name)" -Name DefVis -PropertyType DWord -Value 2 -Force | Out-Null
            Remove-Item "registry::$($package.Name)\Owners" -Force -ErrorAction SilentlyContinue
            Remove-Item "registry::$($package.Name)\Updates" -Force -ErrorAction SilentlyContinue
            try {
                Remove-WindowsPackage -Online -PackageName $package.PSChildName -NoRestart -ErrorAction Stop *>$null
            }
            catch {
                #fallback to dism when user is using powershell 7
                dism.exe /Online /Remove-Package /PackageName:$($package.PSChildName) /NoRestart /Quiet
            }
            Remove-ServicingPackageFiles -PackageName $package.PSChildName
        }
    }

    $packages = @(Get-AIRelatedCbsPackages)
    if ($packages.Count -eq 0) {
        Write-SettingStatus -IsSet $true -SetMessage "No AI related packages installed in 'Component Based Servicing'." -UnsetMessage "AI related packages are installed in 'Component Based Servicing'."
        Write-Verbose "No corresponding packages found in `"$regPath`".`n"
    }
    else {
        Write-SettingStatus -IsSet $false -SetMessage "No AI related packages installed in 'Component Based Servicing'." -UnsetMessage "Found $($packages.Count) AI related packages in 'Component Based Servicing'."
        $verboseOutput = ($packages | ForEach-Object { " - $($_.PSChildName)" }) -join "`n"
        Write-Verbose "$regPath`:`n$verboseOutput`n"
    }
}

# Function to disable hibernation
function Disable-Hibernation {
    if ($Apply) {
        powercfg /h off
    }

    $Path = "HKLM:\SYSTEM\CurrentControlSet\Control\Power"
    $Name = "HibernateEnabled"

    $status = Get-ItemProperty -Path "$Path" -Name "$Name" -ErrorAction SilentlyContinue
    Write-SettingStatus -IsSet (-not $status.HibernateEnabled) -SetMessage "Hibernation is disabled." -UnsetMessage "Hibernation is not disabled"
    Write-Verbose "$Path\$Name = $($status.HibernateEnabled)`n"
}

# Function to enable font smoothing (ClearType)
function Enable-FontSmoothing {
    Set-RegistrySetting -Path "HKCU:\Control Panel\Desktop" -Name "FontSmoothing" -Value "1" -Type String
    Set-RegistrySetting -Path "HKCU:\Control Panel\Desktop" -Name "FontSmoothingType" -Value 2 -Type DWord

    if ($Apply) {
        # The registry change alone is only loaded at the next sign-in.
        # SystemParametersInfo applies it to the running session immediately.
        if (-not ('Native.WinAPI' -as [type])) {
            Add-Type -MemberDefinition '[DllImport("user32.dll", SetLastError = true)] public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, IntPtr pvParam, uint fWinIni);' -Name 'WinAPI' -Namespace 'Native'
        }
        $SPI_SETFONTSMOOTHING = 0x004B
        $SPI_SETFONTSMOOTHINGTYPE = 0x200B
        $SPIF_UPDATEINIFILE = 0x01
        $SPIF_SENDCHANGE = 0x02
        [Native.WinAPI]::SystemParametersInfo($SPI_SETFONTSMOOTHING, 1, [IntPtr]::Zero, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE) | Out-Null
        [Native.WinAPI]::SystemParametersInfo($SPI_SETFONTSMOOTHINGTYPE, 2, [IntPtr]::Zero, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE) | Out-Null
    }

    $desktop = Get-ItemProperty -Path "HKCU:\Control Panel\Desktop" -ErrorAction SilentlyContinue
    Write-SettingStatus -IsSet ($desktop.FontSmoothing -eq "1" -and $desktop.FontSmoothingType -eq 2) -SetMessage "Font smoothing (ClearType) is enabled." -UnsetMessage "Font smoothing (ClearType) is not enabled."
    Write-Verbose "HKCU:\Control Panel\Desktop FontSmoothing=$($desktop.FontSmoothing) FontSmoothingType=$($desktop.FontSmoothingType)`n"
}

# Main execution
Write-Output ""
Write-Output "Base Privacy and Configuration settings..."
Write-Output ""

Disable-Service -Name DiagTrack
Disable-Service -Name Dmwappushservice
Disable-Task -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program" -TaskName "Consolidator"
Disable-Task -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program" -TaskName "UsbCeip"
Disable-Task -TaskPath "\Microsoft\Windows\Application Experience" -TaskName "Microsoft Compatibility Appraiser"
Disable-Task -TaskPath "\Microsoft\Windows\Application Experience" -TaskName "PcaPatchDbTask"
Disable-Task -TaskPath "\Microsoft\Windows\Application Experience" -TaskName "StartupAppTask"
Set-RegistrySetting -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWord
Set-RegistrySetting -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0 -Type DWord
Set-RegistrySetting -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Value 0 -Type DWord
Remove-InboxApp -Name "Microsoft.BingSearch"
Disable-TelemetryLogger

if ($AiSettings) {
    Write-Output ""
    Write-Output "AI settings..."
    Write-Output ""
    Disable-Feature -FeatureName "Recall"
    Remove-InboxApp -Name "Microsoft.Copilot"
    Remove-AICBSPackages
    Remove-RegistrySetting -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages\Components" -Name "CopilotNudges"
    Remove-RegistrySetting -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages\Components" -Name "AIContext"
    Remove-RegistrySetting -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages\Components" -Name "AIX"
}
else {
    Write-Output ""
    Write-Output "$($PSStyle.Background.Black)$($PSStyle.Foreground.BrightBlack)Skipping AI settings. use -AiSettings to set them.$($PSStyle.Reset)"
}

if ($QualityOfLife) {
    Write-Output ""
    Write-Output "Quality of life settings..."
    Write-Output ""
    Disable-Hibernation
    Set-RegistrySetting -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Value "0" -Type String
    Set-RegistrySetting -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0" -Type String
    Set-RegistrySetting -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Value 0 -Type DWord
    Set-RegistrySetting -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Value "1" -Type String
    Enable-FontSmoothing
}
else {
    Write-Output ""
    Write-Output "$($PSStyle.Background.Black)$($PSStyle.Foreground.BrightBlack)Skipping quality of life settings. use -QualityOfLife to set them.$($PSStyle.Reset)"
}

Write-Output ""
if ($Apply) {
    Write-Output "Done."
}
else {
    Write-Output "No changes have been made, re-run this script with -Apply to change the settings."
}

if (-not $PSBoundParameters.ContainsKey('Verbose')) {
    Write-Output "Use -Verbose for more details."
}