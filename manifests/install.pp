# == Class account::install
#
# This class is called from account for install.
#
class account::install {

  package { $::account::package_name:
    ensure => present,
  }
}
