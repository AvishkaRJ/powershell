# Import the necessary modules
Import-Module -Name Security
Import-Module -Name EventLog

# Set the event log to monitor
$Log = "Security"

# Set the event ID for login events
$EventID = 4624

# Create a filter for the event log
$Filter = New-Object System.Diagnostics.Eventing.Reader.EventLogFilter

# Set the event ID for the filter
$Filter.EventId = $EventID

# Create a event log reader and apply the filter
$Reader = New-Object System.Diagnostics.Eventing.Reader.EventLogReader -ArgumentList $Log, $Filter

# Loop indefinitely
while ($True) {
    # Use a Try-Catch block to handle any errors
    Try {
        # Read the next event in the log
        $Event = $Reader.ReadEvent()

        # Check if an event was returned
        if ($Event) {
            # Print a message for the login event
            "Login activity detected at $(Get-Date)"
        }
    }
    Catch {
        # Print an error message if an error occurred
        "An error occurred: Null Value"
    }

    # Sleep for 10 minutes before checking for the next event
    Start-Sleep -Seconds 600
}