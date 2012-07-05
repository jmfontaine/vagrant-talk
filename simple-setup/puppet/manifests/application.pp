# Set default path for Exec calls
Exec {
    path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ]
}

stage {
    'init': before => Stage['main']
}

node default {
    include params
    include system
    include apache
}
