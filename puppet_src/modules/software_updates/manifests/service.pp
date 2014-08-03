# Class ensures yum-cron service is enabled and running

class software_updates::service {

    service { 'yum-cron' :
    ensure     => running,
    enable     => true,
    name       => 'yum-cron',
    hasstatus  => true,
  }
}
