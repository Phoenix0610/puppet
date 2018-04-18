
class profile::universalforwarder {

class { '::splunk::params':
    server   => '35.164.58.80',
    version  => '6.4.4',
    build    => 'b53a5c14bb5e',
    src_root => '/etc/puppet/modules/splunk/files',
}

@splunkforwarder_input { 'puppetserver-sourcetype':
  section => 'monitor:///var/log/puppet.log',
  setting => 'sourcetype',
  value   => 'puppetserver',
  tag     => 'splunk_forwarder'
}
include ::splunk::forwarder

}
