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
  $accounts_db,
  $groups_db,
  $local_users,
  $local_groups,
) inherits ::account::params {

  # validate parameters here

  class { '::account::config': } ~>
  Class['::account']
}
