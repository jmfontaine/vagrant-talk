class apache {
    package { "apache" :
        ensure => "present",
        name   => "apache2",
    }

    file { "apache.vhost" :
        path    => "/etc/apache2/sites-available/default",
        ensure  => present,
        content => template("apache/vhost.erb"),
        owner   => "root",
        group   => "root",
        notify  => Exec["apache.reload"],
        require => Package["apache"]
    }

    service { "apache" :
        ensure  => "running",
        name    => "apache2",
        enable  => true,
        require => Package["apache"],
    }

    exec { "apache.reload" :
        command     => "service apache2 reload",
        refreshonly => true,
    }
}
