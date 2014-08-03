# Adding user for Tomasz Janeczko
class users::tomaszj {

  users::account {'tomaszj':
    fullname => 'Tomasz Janeczko',
    email    => 't.janeczko@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCqcm3kTUZA2AEeor/bZK+CU2Chi3qNvHX9tDRzvCDnezZccys0D1DqEqAedK/29gev8gUuFZML2fqOH16TXTI/ToGd6MQt8/m93WdRjyuwtr9y/L/9pYRaTe4cKSuJzFNSBZL4KiKlQaUtGRGpp5NSjq859j4sPSQvEi8sVWGpw+Ue9gR7itleeF6Cpn3Jyb8nr0NdzvRxLJVowhcDKy1o6vSknYAXGIUx/gR1FR1OhLVM2LwrsMiKwX+18/3B0EAhvqpzVP1JBQf1Wbz9zROZeHCsTLWTKD7QCu438JPTbmWGLRAMuehiUBlKNYCYmKw4bA8Jp2sXl3q0JF9RKQaz',
  }
}
