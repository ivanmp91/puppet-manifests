class mysql_management::grants {
	$grants = {
		'usu1@host1.mydomain.com/db1.*' => {
                                ensure     => 'present',
                                options    => ['GRANT'],
                                privileges => ['ALL'],
                                table      => 'db1.*',
                                user       => 'usu1@host1.mydomain.com',
		},
		'usu2@host2.mydomain.com/db2.*' => {
                        ensure     => 'present',
                        options    => ['GRANT'],
                        privileges => ['ALL'],
                        table      => 'db2.*',
                        user       => 'usu2@host2.mydomain.com',
                },
	}
}
