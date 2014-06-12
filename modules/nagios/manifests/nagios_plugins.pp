class nagios_plugins{
	$version="nagios-plugins-2.0.1"
	$url="http://www.nagios-plugins.org/download/nagios-plugins-2.0.1.tar.gz"

	puppi::netinstall { 'nagios-plugins':
		owner => nagios,
		group => nagios,
		retrieve_args => "-O ${version}.tar.gz",
  		url => "${url}",
  		extracted_dir => "${version}",
  		destination_dir => '/usr/local/nagios/sources',
  		postextract_command => "/usr/local/nagios/sources/${version}/configure --with-nagios-user=nagios --with-nagios-group=nagios && make ;  make install && chown root /usr/local/nagios/libexec/check_icmp /usr/local/nagios/libexec/check_dhcp && chmod +s /usr/local/nagios/libexec/check_icmp /usr/local/nagios/libexec/check_dhcp"
	}
}
