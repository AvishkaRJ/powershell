# powershell
powershell scripts

## IR1 : ```.\IR_1.ps1 ```
Get a list of all users who have logged in to the machine and all processes currently running on the machine.(Except SYSTEM & svchost)

## IR2 : ```.\IR_2.ps1 ```
Monitor the "Security" event log for events with an ID of 4624, which corresponds to login events. Whenever a login event is detected, the script will print a message indicating that login activity has been detected.
