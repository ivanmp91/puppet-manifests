class mysql_management::users {
	$users = {
			'usu1@host1.mydomain.com' => {
                                ensure                   => 'present',
                                max_connections_per_hour => '0',
                                max_queries_per_hour     => '0',
                                max_updates_per_hour     => '0',
                                max_user_connections     => '0',
                                password_hash            => '*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29',
                        },
			'usu2@host2.mydomain.com' => {
                                ensure                   => 'present',
                                max_connections_per_hour => '0',
                                max_queries_per_hour     => '0',
                                max_updates_per_hour     => '0',
                                max_user_connections     => '0',
                                password_hash            => '*94BDCEBE19083CE2A1F959FD02F964C7AF4CFC29',
                        },
	}
}
