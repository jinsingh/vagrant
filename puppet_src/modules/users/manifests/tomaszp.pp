# Adding user for Tomasz Powroznik
class users::tomaszp {

  users::account {'tomaszp':
    fullname => 'Tomasz Powroznik',
    email    => 'T.Powroznik@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDbOMqNsAnCzft/S0jrKLlIa+2lroGFeyUIafTI4njJkfLIPlWtMvflDXZQzv9b8Hv4c/eQsLAz0LIza84hgnMkydYQjEVGECzDET6MPwN0O4fRtWNYEMab+bUHNAU0haBZjyUArFVGDCDLxLPpOAePGXOz/FMmCf5irfurVnWk4VJz66IbvxySmu4F1oc9N/acmQhrCvxK11/bNFo8T+xdZQ3ZH+dEQCodXMco/PgAOCwGPfQBXibrVTveddRCSrS2UUx7NLxSKnIpEON9tKrAE+jyiszJg7iVhVlQgPES9lBNxmY/u+2NH6SQyXzf5Oe6bjHq36yyCjua5fZ2cCWF',
  }
}
