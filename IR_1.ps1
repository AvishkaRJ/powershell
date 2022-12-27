# Get a list of all users who have logged in to the machine
$loginHistory = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624}

# Filter the list of login events to exclude user "system" and logon type 5
$filteredLoginHistory = $loginHistory | Where-Object { $_.Properties[5].Value -ne "system" -and $_.Properties[8].Value -ne "5" }

# Iterate through the list of login events and display the user, logon type, and logon process
foreach ($event in $filteredLoginHistory)
{
    $user = $event.Properties[5].Value
    $logonType = $event.Properties[8].Value
    $logonProcess = $event.Properties[12].Value
    Write-Output "User: $user"
    Write-Output "Logon Type: $logonType"
    Write-Output "Logon Process: $logonProcess"
    Write-Output ""
}

# Get a list of all processes currently running on the machine
$processes = Get-Process

# Filter the list of processes to exclude process name "svchost"
$filteredProcesses = $processes | Where-Object { $_.Name -ne "svchost" }

# Iterate through the list of processes and display the process name and command line
foreach ($process in $filteredProcesses)
{
    $name = $process.Name
    $commandLine = $process.CommandLine
    Write-Output "Process Name: $name"
    Write-Output "Command Line: $commandLine"
    Write-Output ""
}
