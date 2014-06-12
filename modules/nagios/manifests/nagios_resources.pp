class nagios_resources {
	group { "nagios":
    		ensure => "present",
	}	
	user { 'nagios':               
    		home => '/usr/local/nagios',           
    		ensure => 'present',       
    		shell => '/bin/bash',  
    		password => '!',           
    		gid => 'nagios',                
    		comment => 'nagios user',
		require => Group['nagios']    
	}
	
	file { "/var/log/nagios":
    		ensure => "directory",
    		owner  => "nagios",
    		group  => "nagios",
    		mode   => 755,
		require => User['nagios']
	}

	file { "/usr/local/nagios/var/rw/":
                ensure => "directory",
                owner  => "nagios",
                group  => "nagios",
                mode   => 2775,
                require => User['nagios']
        }

	file { '/etc/init.d/nagios':
		ensure  => present,
                path    => '/etc/init.d/nagios',
                owner   => root,
                group   => root,
                mode    => '755',
                links   => follow,
                source => [ "puppet://$servername/modules/nagios/nagios-init"],
	}
	file { '/etc/nagios':
   		ensure => 'link',
   		target => '/usr/local/nagios/etc',
	}

	file { "/usr/local/nagios/var/cache":
                ensure => "directory",
                owner  => "nagios",
                group  => "nagios",
                mode   => 775,
                require => User['nagios']
        }

	file { "/usr/lib/nagios":
                ensure => "directory",
                owner  => "nagios",
                group  => "nagios",
                mode   => 775,
                require => User['nagios']
        }

	file { "/usr/local/nagios/var":
                ensure => "directory",
                owner  => "nagios",
                group  => "nagios",
                mode   => 775,
                require => User['nagios']
        }
	
	file { '/usr/lib/nagios/plugins':
                ensure  => link,
		target => '/usr/local/nagios/libexec',
		require => File['/usr/lib/nagios']
        }

	service { 'nagios':
        	ensure     => running,
                enable     => true,
                hasstatus  => true,
                hasrestart => true
       }
}
