# == Class account::params
#
# This class is meant to be called from account.
# It sets variables according to platform.
#
class account::params {
  case $::operatingsystem {
    'Debian', 'Ubuntu',
    'RedHat', 'CentOS',
    'Amazon': {
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
