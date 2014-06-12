class sudoers{
        include sudo
        sudo::conf { 'ivan':
                priority => 10,
                content  => "ivan  ALL= (root) NOPASSWD: /usr/bin/dpkg -l, /usr/bin/apt-get update, /usr/bin/apt-get upgrade, /usr/bin/apt-get -s dist-upgrade, /usr/bin/apt-get -y upgrade, /usr/bin/apt-get autoremove, /usr/bin/service, /usr/sbin/service",
        }
        sudo::conf { 'backup':
                priority => 20,
                content  => "backup  ALL= (root) NOPASSWD: /usr/bin/rsync, /usr/sbin/slapcat, /usr/bin/svnadmin\nbackup  ALL= (postgres) NOPASSWD: /usr/bin/pg_dumpall",
        }

}
