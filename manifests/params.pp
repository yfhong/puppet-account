# == Class account::params
#
# This class is meant to be called from account.
# It sets variables according to platform.
#
class account::params {
  $start_uid = 10000
  $start_gid = 10000
  $end_uid = 29999
  $end_gid = 29999

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
