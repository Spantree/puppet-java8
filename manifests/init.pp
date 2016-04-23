# Class: java8
#
# This module manages Oracle java8
# Parameters: none
# Requires:
#  apt
# Sample Usage:
#  include java8
class java8 {
  case $::operatingsystem {
    debian, ubuntu: {
      file { '/tmp/java.preseed':
        source => 'puppet:///modules/java8/java.preseed',
        mode   => '0600',
        backup => false,
      }
    }

    default: { notice "Unsupported operatingsystem ${::operatingsystem}" }
  }

  case $::operatingsystem {
    debian: {
      include apt
      apt::source { 'webupd8team-java':
        location => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
        release  => 'precise',
        repos    => 'main',
        key      => {
          'id'     => '7B2C3B0889BF5709A105D03AC2518248EEA14886',
          'server' => 'keyserver.ubuntu.com',
        },
        include  => {
          'deb' => true,
          'src' => true,
        },
      }

      package { 'oracle-java8-installer':
        responsefile => '/tmp/java.preseed',
        require      => [
          Apt::Source['webupd8team-java'],
          File['/tmp/java.preseed']
        ],
      }
    }

    ubuntu: {
      include apt

      apt::ppa { 'ppa:webupd8team/java': }

      exec { 'apt-update':
        command => '/usr/bin/apt-get update',
        require => [
          Apt::Ppa['ppa:webupd8team/java']
        ],
      }

      package { 'oracle-java8-installer':
        responsefile => '/tmp/java.preseed',
        require      => [
          Exec['apt-update'],
          File['/tmp/java.preseed']
        ],
      }
    }

    default: {
      notice "Unsupported operatingsystem ${::operatingsystem}"
    }
  }

  file { '/etc/profile.d/set_java_home.sh':
    ensure  => file,
    group   => root,
    owner   => root,
    mode    => '0755',
    source  => 'puppet:///modules/java8/set_java_home.sh',
    require => Package['oracle-java8-installer']
  }
}
