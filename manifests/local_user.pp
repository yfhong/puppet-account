# == Define: account::local_user
#
# create user
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
define account::local_user {

  $local_user_name = $title
  $local_user = $account::accounts_db[$local_user_name]

  if ($local_user['home']) {
    $local_user_home = $local_user['home']
  }
  else {
    $local_user_home = "/home/${local_user_name}"
  }

  if ($local_user['shell']) {
    $local_user_shell = $local_user['shell']
  }
  else {
    $local_user_shell = '/bin/bash'
  }

  user { $local_user_name:
    ensure => 'present',
    gid => $local_user['gid'],
    groups =>$local_user['groups'],
    home => $local_user_home,
    managehome => true,
    shell => $local_user_shell,
    purge_ssh_keys => true,
  }

  validate_array($local_user['pubkeys'])
  $local_user['pubkeys'].each |$pubkey| {
      ssh_authorized_key { "${local_user_name}@${::fqdn}":
        user => $local_user_name,
        type => $pubkey['type'],
        key  => $pubkey['key'],
      }
  }
}
