class system {
    # Create "puppet" group
    group { "puppet":
        ensure => "present",
    }

    # Define default files permissions
    File {
        owner => 0,
        group => 0,
        mode  => 0644
    }

    # Update packages list before doing anything
    exec { "apt.update" :
        command => "apt-get update",
    }
    Exec["apt.update"]->Package <| |>

    # Define message of the day
    file { "motd" :
        path    => "/etc/motd.tail",
        ensure  => present,
        content => $motd
    }

    # Install some useful packages
    package { [ "htop" ] :
        ensure => present,
    }
}
