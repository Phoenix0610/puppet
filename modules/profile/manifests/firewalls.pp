#- file:  modules/profile/manifests/sensu.pp
#- Class: profile::monitoring
#
# Class to install the sensu client for any host
#
class profile::firewalls {

    class { 'firewall': }

  firewall { '100 allow http and https access':
    dport   => [80, 443],
    proto  => tcp,
    action => accept,
  }

  firewall {'102 forward port 80 to 8080':
  table       => 'nat',
  chain       => 'PREROUTING',
  proto       => tcp,
  dport       => '80',
  jump        => 'REDIRECT',
  toports     => '8080',
  }

}
