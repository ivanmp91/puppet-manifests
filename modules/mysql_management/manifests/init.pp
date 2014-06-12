class mysql_management {
	include mysql_management::users
        include mysql_management::databases
        include mysql_management::grants
        include mysql_management::configuration
        class { '::mysql::server' :
                        users => $mysql_management::users::users ,
                        databases => $mysql_management::databases::databases,
                        grants => $mysql_management::grants::grants ,
                        root_password => $mysql_management::configuration::root_password,
                        override_options => $mysql_management::configuration::override_options,
			service_manage => true,
	}
}
