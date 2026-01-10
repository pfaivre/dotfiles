<#
.SYNOPSIS
    Fix some privacy and configuration issues in Windows 11.
.DESCRIPTION
    This script disables telemetry services, AI packages, and other privacy-related settings in Windows 11.
    It targets various privacy-invasive features including telemetry, AI-related components, and unnecessary services.
.PARAMETER Apply
    When specified, the script will actually apply the changes to the system.
    Without this parameter, the script will only report the current status of each setting.
.PARAMETER QualityOfLife
    When specified, the script will also apply quality-of-life improvements such as:
    - Disabling hibernation
    - Reducing menu show delay for faster navigation
.NOTES
    Last Update: 2026-01-10
    For more settings to disable, see https://github.com/zoicware/RemoveWindowsAI/blob/main/RemoveWindowsAi.ps1
    
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
    [Parameter(Mandatory=$false)]
    [switch]$Apply,

    [Parameter(Mandatory=$false)]
    [switch]$AiSettings,
    
    [Parameter(Mandatory=$false)]
    [switch]$QualityOfLife
)

# Function to disable and remove a service and check afterwards
function Disable-Service {
    param (
        [Parameter(Mandatory)]
        [string]$Name
    )

    if ($Apply) {
        Stop-Service -Name $Name -Force -ErrorAction SilentlyContinue
        Remove-Service -Name $Name -ErrorAction SilentlyContinue
    }

    $serviceStatus = Get-Service -Name $Name -ErrorAction SilentlyContinue
    if ($serviceStatus -eq $null) {
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] $Name service is removed."
    } else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] $Name service is not removed."
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

    if ($Apply) {
        Disable-ScheduledTask -TaskPath "$TaskPath" -TaskName "$TaskName" | Out-Null
    }

    # TODO: handle edge cases 1. not tasks found, 2. multiple tasks found
    $t = Get-ScheduledTask -TaskName "$TaskName"
    if ($t.State -eq "Disabled") {
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] $TaskName task is disabled."
    } else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] $TaskName task is not disabled."
    }
}

# Function to set a registry key and check afterwards
function Set-RegistrySettingDword {
    param (
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$Name,
        [Parameter(Mandatory)]
        [int]$NewValue
    )

    if ($Apply) {
        New-Item -Path "$Path" -Force | Out-Null
        Set-ItemProperty -Path "$Path" -Name "$Name" -Value $NewValue -Type DWord -Force
    }

    $value = (Get-ItemProperty -Path "$Path" -Name "$Name" -ErrorAction SilentlyContinue)."$Name"
    if ($value -eq $NewValue) {
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] $Name registry setting is set to $NewValue."
    } else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] $Name registry setting is not set to $NewValue."
    }
}

# Function to set a registry key and check afterwards
function Set-RegistrySettingString {
    param (
        [Parameter(Mandatory)]
        [string]$Path,
        [Parameter(Mandatory)]
        [string]$Name,
        [Parameter(Mandatory)]
        [string]$NewValue
    )

    if ($Apply) {
        New-Item -Path "$Path" -Force | Out-Null
        Set-ItemProperty -Path "$Path" -Name "$Name" -Value "$NewValue" -Type String -Force
    }

    $value = (Get-ItemProperty -Path "$Path" -Name "$Name" -ErrorAction SilentlyContinue)."$Name"
    if ($value -eq "$NewValue") {
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] $Name registry setting is set to `"$NewValue`"."
    } else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] $Name registry setting is not set to `"$NewValue`"."
    }
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
    if ($value -eq $null) {
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] $Name registry setting is removed."
    } else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] $Name registry setting is not removed."
    }
}

# Function to disable Recall feature
function Disable-Feature {
    param (
        [Parameter(Mandatory)]
        [string]$FeatureName
    )

    if ($Apply) {
        dism.exe /Online /Disable-Feature /FeatureName:$FeatureName /Remove /NoRestart /Quiet | Out-Null
    }

    $feature = dism.exe /Online /Get-Features | Select-String "$FeatureName"
    if ($feature -eq $null) {
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] $FeatureName feature is removed."
    } else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] $FeatureName feature is not removed."
    }
}

# Function to remove a Windows "in-box" app
function Remove-InboxApp {
    param (
        [Parameter(Mandatory)]
        [string]$Name
    )

    $inboxapps = 'C:\Windows\InboxApps'

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
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] $Name in-box app is removed."
    } else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] $Name in-box app is not removed."
    }
}


# Function to disable telemetry logger (AutoLogger-Diagtrack-Listener.etl)
function Disable-TelemetryLogger {
    $etlPath = "C:\ProgramData\Microsoft\Diagnosis\ETLLogs\AutoLogger\AutoLogger-Diagtrack-Listener.etl"
    if (Test-Path $etlPath) {
        if ($Apply) {
            Clear-Content $etlPath
        }

        if ([String]::IsNullOrWhiteSpace((Get-content $etlPath))) {
            Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] Telemetry logger file is cleared."
        }
        else {
            Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] Telemetry logger file is cleared."
        }
    } else {
        Write-Output -ForegroundColor DarkGray "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] Telemetry logger file not found."
    }
}

# Function to remove various AI related packages
function Remove-AICBSPackages {
    $regPath = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\Packages'

    if ($Apply) {
        Get-ChildItem $regPath | ForEach-Object {
            $value = try { Get-ItemPropertyValue "registry::$($_.Name)" -Name Visibility -ErrorAction Stop } catch { $null }
            if ($value -ne $null) {
                if ($value -eq 2 -and $_.PSChildName -like '*AIX*' -or $_.PSChildName -like '*Recall*' -or $_.PSChildName -like '*Copilot*' -or $_.PSChildName -like '*CoreAI*') {
                    Write-Output "Removing $($_.PSChildName)..."
                    Set-ItemProperty "registry::$($_.Name)" -Name Visibility -Value 1 -Force
                    New-ItemProperty "registry::$($_.Name)" -Name DefVis -PropertyType DWord -Value 2 -Force | Out-Null
                    Remove-Item "registry::$($_.Name)\Owners" -Force -ErrorAction SilentlyContinue
                    Remove-Item "registry::$($_.Name)\Updates" -Force -ErrorAction SilentlyContinue
                    try {
                        Remove-WindowsPackage -Online -PackageName $_.PSChildName -NoRestart -ErrorAction Stop *>$null
                        $paths = Get-ChildItem "$env:windir\servicing\Packages" -Filter "*$($_.PSChildName)*" -ErrorAction SilentlyContinue 
                        foreach ($path in $paths) {
                            if ($path) {
                                Remove-Item $path.FullName -Force -ErrorAction SilentlyContinue
                            }
                        }
                    }
                    catch {
                        #fallback to dism when user is using powershell 7
                        dism.exe /Online /Remove-Package /PackageName:$($_.PSChildName) /NoRestart /Quiet
                        $paths = Get-ChildItem "$env:windir\servicing\Packages" -Filter "*$($_.PSChildName)*" -ErrorAction SilentlyContinue 
                        foreach ($path in $paths) {
                            if ($path) {
                                Remove-Item $path.FullName -Force -ErrorAction SilentlyContinue
                            }
                        }                    
                    }
                }
            }
        }
    }

    $packagesCount = 0
    Get-ChildItem $regPath | ForEach-Object {
        $value = try { Get-ItemPropertyValue "registry::$($_.Name)" -Name Visibility -ErrorAction Stop } catch { $null }
        if ($value -ne $null) {
            if ($value -eq 2 -and $_.PSChildName -like '*AIX*' -or $_.PSChildName -like '*Recall*' -or $_.PSChildName -like '*Copilot*' -or $_.PSChildName -like '*CoreAI*') {
                $packagesCount += 1
            }
        }
    }
    if ($packagesCount -eq 0) {
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] No AI related packages installed in 'Component Based Servicing'."
    }
    else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] Found $packagesCount AI related packages in 'Component Based Servicing'."
    }
}

# Function to disable hibernation
function Disable-Hibernation {
    if ($Apply) {
        powercfg /h off
    }

    $status = Get-ItemProperty HKLM:\SYSTEM\CurrentControlSet\Control\Power -name HibernateEnabled
    if (-not $status.HibernateEnabled) {
        Write-Output "[ $($PSStyle.Foreground.Green)SET$($PSStyle.Reset) ] Hibernation is disabled."
    }
    else {
        Write-Output "[$($PSStyle.Foreground.Red)UNSET$($PSStyle.Reset)] Hibernation is not disabled"
    }
}

# Main execution
Write-Output "Base Privacy and Configuration settings..."
Write-Output ""

Disable-Service -Name DiagTrack
Disable-Service -Name Dmwappushservice
Disable-Task -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program" -TaskName "Consolidator"
Disable-Task -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program" -TaskName "UsbCeip"
Disable-Task -TaskPath "\Microsoft\Windows\Application Experience" -TaskName "Microsoft Compatibility Appraiser"
Disable-Task -TaskPath "\Microsoft\Windows\Application Experience" -TaskName "PcaPatchDbTask"
Disable-Task -TaskPath "\Microsoft\Windows\Application Experience" -TaskName "StartupAppTask"
Set-RegistrySettingDword -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -NewValue 0
Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -NewValue 0
Set-RegistrySettingDword -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -NewValue 0
Remove-InboxApp -Name "Microsoft.BingSearch"
Disable-TelemetryLogger

if ($AiSettings) {
    Write-Output ""
    Write-Output "AI settings..."
    Write-Output ""
    Disable-Feature -FeatureName "Recall"
    Remove-InboxApp -Name "Microsoft.Copilot"
    Remove-AICBSPackages
    # Windows appear reluctant to let us set these values:
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "TurnOffWindowsCopilot" -NewValue 1
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableAIDataAnalysis" -NewValue 1
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "AllowRecallEnablement" -NewValue 0
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableClickToDo" -NewValue 1
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "TurnOffSavingSnapshots" -NewValue 1
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableSettingsAgent" -NewValue 1
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableAgentConnectors" -NewValue 1
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableAgentWorkspaces" -NewValue 1
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" -Name "DisableRemoteAgentConnectors" -NewValue 1
    # Set-RegistrySettingDword -Path "HKCU:\SOFTWARE\Policies\WindowsNotepad" -Name "DisableAIFeatures" -NewValue 1
    Remove-RegistrySetting -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages\Components" -Name "CopilotNudges"
    Remove-RegistrySetting -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages\Components" -Name "AIContext"
    Remove-RegistrySetting -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages\Components" -Name "AIX"
}
else {
    Write-Output ""
    Write-Output "$($PSStyle.Foreground.BrightBlack)Skipping AI settings. use -AiSettings to set them.$($PSStyle.Reset)"
}

if ($QualityOfLife) {
    Write-Output ""
    Write-Output "Quality of life settings..."
    Write-Output ""
    Disable-Hibernation
    Set-RegistrySettingString -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -NewValue "0"
}
else {
    Write-Output ""
    Write-Output "$($PSStyle.Foreground.BrightBlack)Skipping quality of life settings. use -QualityOfLife to set them.$($PSStyle.Reset)"
}

Write-Output ""
if ($Apply) {
    Write-Output "Done."
}
else {
    Write-Output "No changes have been made, re-run this script with -Apply to change the settings."
}
