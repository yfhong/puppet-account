# == Class account::config
#
# This class is called from account for service config.
#
class account::config {

  account::local_group{$account::local_groups:}

  account::local_user{$account::local_users:}
}
