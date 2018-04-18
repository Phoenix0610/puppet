#- file:  modules/profile/manifests/logstash.pp
#- Class: profile::monitoring
#
# Class to install the sensu client for any host
#
class profile::logstash_agent {


class { 'logstash':
  manage_repo  => true,
  java_install => true,
}

#It is essential to provide valid a Logstash configuration file for the daemon to start.
logstash::configfile { 'my_ls_config':
  content => template('/etc/puppet/modules/logstash/templates/default/authlog.conf'),
}
exec {"update-user":
  command => "/bin/sed -i 's/LS_USER=logstash/LS_USER=root/g' /etc/init.d/logstash",
}
exec {"update-group":
  command => "/bin/sed -i 's/LS_GROUP=logstash/LS_GROUP=root/g' /etc/init.d/logstash",
}
exec {"starting-logstash":
  command => "/usr/sbin/service logstash restart",
}

}
