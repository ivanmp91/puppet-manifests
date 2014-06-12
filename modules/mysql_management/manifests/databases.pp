class mysql_management::databases {
	$databases = {
                'db1' => {
                        ensure  => 'present',
                        charset => 'latin1',
                	collate => 'latin1_swedish_ci',
                },
		'db2' => {
                        ensure  => 'present',
                        charset => 'latin1',
                        collate => 'latin1_swedish_ci',
                },
	}
}
