class nagios {
	include nagios_lib
	include nagios_resources
        include nagios_server
        include nagios_plugins
        include mk_livestatus
	Class['nagios_lib'] -> Class['nagios_server']
	Class['nagios_resources'] -> Class['nagios_server']
	Class['mk_livestatus'] -> Class['nagios_server']
	Class['nagios_server'] -> Class['nagios_plugins']
}
