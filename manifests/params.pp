# == Class account::params
#
# This class is meant to be called from account.
# It sets variables according to platform.
#
class account::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'account'
      $service_name = 'account'
    }
    'RedHat', 'Amazon': {
      $package_name = 'account'
      $service_name = 'account'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
