class mk_livestatus{
	$version="mk-livestatus-1.2.4p3"
	$url="http://mathias-kettner.de/download/mk-livestatus-1.2.4p3.tar.gz"

	puppi::netinstall { 'mk-livestatus':
		owner => "nagios",
		group => "nagios",
		retrieve_args => "-O ${version}.tar.gz",
  		url => "${url}",
  		extracted_dir => "${version}",
  		destination_dir => '/usr/local/nagios/sources',
  		postextract_command => "/usr/local/nagios/sources/${version}/configure --with-nagios4 && make all && make install && service nagios restart"
	}
}
