class nagios_lib {
	include cpan
	
	package{
		'libgd2-noxpm-dev':
			ensure => installed;
		'build-essential':
               		ensure => installed;
		'wget':
               		ensure => installed;
		'libgd2-xpm':
               		ensure => installed;
		'libgd2-xpm-dev':
               		ensure => installed;
		'php5-gd':
               		ensure => installed;
		'libradiusclient-ng2':
               		ensure => installed;
		'libradius1':
			ensure => installed; 
		'libsensors4':
			ensure => installed; 
		'libsnmp-base':
			ensure => installed; 
		'libsnmp-dev':
			ensure => installed; 
		'libmysqlclient-dev':
			ensure => installed; 
		'libssl-dev':
			ensure => installed;
		'libshibsp5':
			ensure => installed;
		'libnet-snmp-perl':
                        ensure => installed;
		'libsnmp-session-perl':
                        ensure => installed;
		'libsnmp-perl':
			ensure => installed;
		'snmp':
                        ensure => installed;
	}	
	cpan {
		"Nagios::Plugin" :
			ensure => present,
                        require => Class['::cpan'];
        }
}
