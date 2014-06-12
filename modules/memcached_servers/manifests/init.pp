class memcached_servers {
	class { 'memcached':
      		max_memory => 128,
		tcp_port => 11211,
		udp_port => 11211,
		max_connections => 8192,
		listen_ip => '0.0.0.0',
		logfile => '/var/log/memcached.log',
		user => 'root',
	}
}
