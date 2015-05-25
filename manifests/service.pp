# == Class account::service
#
# This class is meant to be called from account.
# It ensure the service is running.
#
class account::service {

  service { $::account::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
