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
  $start_uid = $::account::params::start_uid,
  $end_uid   = $::account::params::end_uid,
  $start_gid = $::account::params::start_gid,
  $end_gid   = $::account::params::end_gid,
) inherits ::account::params {

  # validate parameters here

  class { '::account::config': } ~>
  Class['::account']
}
