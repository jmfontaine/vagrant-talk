class system {
    # Update packages list before doing anything
    exec { 'apt.update' :
        command => 'apt-get update',
    }
    Exec['apt.update']->Package <| |>

    # Define message of the day
    file { 'motd' :
        path    => '/etc/motd.tail',
        ensure  => present,
        content => $motd
    }

    # Install some useful packages
    package { [ 'htop' ] :
        ensure => present,
    }
}
