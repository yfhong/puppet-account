# == Define: account::local_group
#
# create user
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
define account::local_group {

  $local_group_name = $title
  $local_group = $account::groups_db[$local_group_name]

  group { $local_group_name:
    ensure => 'present',
  }
}
