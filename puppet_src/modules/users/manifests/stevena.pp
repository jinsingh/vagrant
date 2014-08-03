# Adding user for Steven Alexander
class users::stevena {

  users::account {'stevena':
    fullname => 'Steven Alexander',
    email    => 's.alexander@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD8MgiG9CFEROVsGM1CiyRA9jOKk0KrOzh3tYv2htAHBKYdutRCqrcz5WWQ1vPYyNNaJuLwG+rhSWf3T/9N5LfS1V22TXDu0VLYPLTfJI4cJZ45OVEs4LGzDcJhAHWgjYVLbHkFwpoBNcRJH/EfvvakjgbdvWSFNFDlmFUPn2X4waB2SDQD667x/oihIZtVRFIdGIMKvT8iXM7uMqEBxeHn+Zm5xan6L+Cl0oCN+79BtdoDN92gHxyhi1g6KLd0fPvmVaa8qcFJJL44e1BqFiPKNB5tEAmaPSpLoT7GDye+mncAG/sW1ytcfVj7eLNlVCAEmJJf5J20fOIJPSEoeQP7',
  }
}
