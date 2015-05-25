# == Class: account
#
# Full description of class account here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class account (
  $package_name = $::account::params::package_name,
  $service_name = $::account::params::service_name,
) inherits ::account::params {

  # validate parameters here

  class { '::account::install': } ->
  class { '::account::config': } ~>
  class { '::account::service': } ->
  Class['::account']
}
