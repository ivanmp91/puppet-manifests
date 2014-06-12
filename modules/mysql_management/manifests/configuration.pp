class mysql_management::configuration {
	include 'stdlib'
	$server_id = $hostname ? {
		mysql-srv1	=> 1,
		mysql-srv2	=> 2,
                default         => 0,
        }
	$root_password= 'P@ssw0rd'
        $mysqld_base = {
                                'max_connections'       => '512',
                                'max_user_connections'   => '128',
                                'table_open_cache'       => '16384',
                                'key_buffer_size'       => '32M',
                                'default_storage_engine' => 'InnoDB',
                                'max_allowed_packet'    => '8M',
                                'thread_stack'          => '192K',
                                'thread_cache_size'     => '16',
                                'query_cache_limit'     => '8M',
                                'query_cache_size'      => '256M',
                                'query_cache_type'      => '1',
                                'slow-query-log-file'   => '/var/log/mysql/mysql_slow.log',
                                'long_query_time'       => '2',
                                'server_id'             => "$server_id",
                                'expire_logs_days'      => '7',
                                'log_error'             => '/var/log/mysql/error.log',
                                'bind_address'          => '0.0.0.0',
                                'innodb_log_file_size'  => '256M',
                                'innodb_open_files'     => '400',
                        }
	$isamchk_base = {
                                'myisam_sort_buffer_size' => '32M',
                                'key_buffer' => '8M',
                                'join_buffer_size' => '1M',
                                'read_buffer_size' => '4M',
                                'sort_buffer_size' => '4M',
                                'table_cache' => '1500',
                                'thread_concurrency' => '4',
                                'thread_cache_size' => '64M',
                                'max_allowed_packet' => '64M',
                                'query_cache_limit' => '1M',
                                'query_cache_size' => '64M',
                                'query_cache_type' => '1',
                                'wait_timeout' => '20',
                                'connect_timeout' => '10',
	}
	$mysqldump_base = {
		'max_allowed_packet' => '16M',
	}
	# Used for mysql master-slave replication	
	if ($server_id == 1 ){
		$mysqld_options = {
			'binlog_do_db' => 'db1',
			'log_bin' => '/var/log/mysql/mysql-bin.log',
		}
	}	
	else{
		$mysqld_options = {
                	'binlog_do_db' => 'db1',
			'relay-log' => '/var/log/mysql/mysql-relay-bin.log',
			'log_bin' => '/var/log/mysql/mysql-bin.log',
		}
	}
	$mysqld=merge($mysqld_base,$mysqld_options)
	$override_options= {
		'mysqld' => $mysqld,
		'isamchk' => $isamchk_base,
		'mysqldump' => $mysqldump_base
	}
}
