class nagios_server{
	$version="nagios-4.0.6"
	$url="http://downloads.sourceforge.net/project/nagios/nagios-4.x/nagios-4.0.6/nagios-4.0.6.tar.gz?r=http%3A%2F%2Fwww.nagios.org%2Fdownload%2Fcore%2Fthanks%2F%3Ft%3D1397640610&ts=1397640618&use_mirror=autoselect"

	puppi::netinstall { 'nagios-server':
		owner => "nagios",
		group => "nagios",
		retrieve_args => "-O ${version}.tar.gz",
  		url => "${url}",
  		extracted_dir => "${version}",
  		destination_dir => '/usr/local/nagios/sources',
  		postextract_command => "/usr/local/nagios/sources/${version}/configure --with-gd-lib=/usr/include/ --with-gd-inc=/usr/include/ --with-nagios-user=nagios --with-nagios-group=nagios --with-cgiurl=/cgi-bin && make all && make install && service nagios restart"
	}
}
