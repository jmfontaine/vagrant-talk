class params {
    # Apache server name
    # Make sure this server name points to the IP defined in the Vagranfile
    $servername = "www.application.local"

    # Apache port
    $port = "80"

    # Message of the day to be displayed at login
    $motd = "Welcome to your application development virtual machine!"
}
