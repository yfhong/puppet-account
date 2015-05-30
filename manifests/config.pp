# == Class account::config
#
# This class is called from account for service config.
#
class account::config {

  if ($::operatingsystem == 'Debian' or $::operatingsystem == 'Ubuntu') {
    file_line { 'first_uid':
      path  => '/etc/adduser.conf',
      line  => "FIRST_UID=${account::start_uid}",
      match => "[#\s]*FIRST_UID.*",
    }
    file_line { 'last_uid':
      path  => '/etc/adduser.conf',
      line  => "LAST_UID=${account::end_uid}",
      match => "[#\s]*LAST_UID.*",
    }
    file_line { 'first_gid':
      path  => '/etc/adduser.conf',
      line  => "FIRST_GID=${account::start_gid}",
      match => "[#\s]*FIRST_GID.*",
    }
    file_line { 'last_gid':
      path  => '/etc/adduser.conf',
      line  => "LAST_GID=${account::end_gid}",
      match => "[#\s]*LAST_GID.*",
    }
  }

  $local_groups = hiera_array('account::local_groups')
  account::local_group{$local_groups:}

  $local_users = hiera_array('account::local_users')
  account::local_user{$local_users:}
}
