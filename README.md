puppet-manifests
================

This is a public repository which contains some useful puppet modules i use. You're free to fork it and modify for your personal use.

List of modules
================
*   [__nagios__][1]
	Set of manifests to deploy a nagios installation made up nagios-server, mk-livestatus, nagios-plugins, some package dependencies and setup of the init script, directories, permissions and user/group for nagios. The packages are downloaded from an url provided on the manifests, by default is provided a recent version of the last packages, modify the url to change for the desired version or upgrade your nagios instances. The download, extraction, compilation and installation are managed using puppi, a module used for application deployments: https://github.com/example42/puppi

*   [__sudoers__][2]
	Use sudo module from https://github.com/saz/puppet-sudo to setup users on /etc/sudoers

*   [__memcached_servers__][3]
        Use memcached module from https://github.com/saz/puppet-memcached to setup configuration parameters for memcached servers.

*   [__mysql_management__][4]
        Use mysql module from https://github.com/puppetlabs/puppetlabs-mysql to setup my.cnf configuration, databases, users and grants. It's arranged in separate manifests files which contains hashes with the configuration and included on the init.pp manifest.

[1]: modules/nagios/
[2]: modules/sudoers/
[3]: modules/memcached_servers/
[4]: modules/mysql_management/
