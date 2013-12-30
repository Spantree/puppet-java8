# Class: java7
#
# This module manages Oracle Java7
# Parameters: none
# Requires:
#  apt
# Sample Usage:
#  include java7
class java7 {
  include apt

  apt::ppa { 'ppa:webupd8team/java': }

  file { '/tmp/java.preseed':
    source => 'puppet:///modules/java7/java.preseed',
    mode   => '0600',
    backup => false,
  }

  package { 'oracle-java7-installer':
    responsefile => '/tmp/java.preseed',
    require      => [
      File['/tmp/java.preseed'],
      Apt::Ppa['ppa:webupd8team/java']
    ]
  }
  
  file { "/etc/profile.d/set_java_home.sh":
    ensure => file,
    group => root,
    owner => root,
    mode => 744,
  	source => "puppet:///modules/java/set_java_home.sh",
  	require => Package['oracle-java7-installer']
  }
}
