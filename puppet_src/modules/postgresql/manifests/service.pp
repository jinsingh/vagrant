# Class ensures postgres-.92 service is running

class postgresql::service {

  service { 'postgresql-9.2' :
    ensure     => running,
    enable     => true,
    name       => 'postgresql-9.2', # can we change this name here to postgressql so it's easier to operate on this service?. Piotr.
    hasstatus  => true,
  }

}
