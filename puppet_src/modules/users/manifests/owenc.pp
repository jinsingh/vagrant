# Adding user for Owen Carleton
class users::owenc {

  users::account {'owenc':
    fullname => 'Owen Carleton',
    email    => 'o.carleton@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDLb1/HeTL0pu0X8FZddYgL87S+bKD5ScEfxdnSHp3LWZUzBaLLCTguWGbOI6433YU8Kqn2lBMxSN+/UQKuILq64AdeAni6p07ZRM1dFs2mYknt6EVLegfslgRHxx0FMHIaqz75/678s9/YRa7CKkGD7FGyhAcapM8Rgj1HSpkgJiBryYFFOd3JJsKE4Qa/IqyO/RvxliEEyHOxRxpO8qHAGK/AKvKFw07N/aURLyi9go3D53zvkP/dNU+mLlyFhQS21cRKTs8mpNw9hnbx/yUaNcSGU+3Dcqx2l0c/ZHm38E3ceWOSSKE7qu+ATe0rwxDiO/aRLtFmNu107aUmyWPl',
  }
}