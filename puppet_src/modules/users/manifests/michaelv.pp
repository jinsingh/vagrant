# Adding user for Rory Hanratty
class users::michaelv {

  users::account {'michaelv':
    fullname => 'Michael McVeigh',
    email    => 'm.mcveigh@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCgU14DEyTS8OaxaFw2FMZftwAJB3/rSgKf+FMAyv6AtInGRD3+WrCHcQQdfPCa6cFIJ+4WpjIdmYZN4CthpS85CCmedsRkiY0aLebfaB/ZT7ZAEZaNJ83Jg04rCQgM6NqKHan2gKxUA89xHXUV9062VxUnP9Zbr20rnoIXLhVimkx2nC9tE+9SzN8ussK7WRp8ZyVx/leyuJvY62ltb7yBXCQUK2HHVrppK0+zB4QEihbd2A26OByhA+DRVJyo2O6rAthhg3HtEo0GukzXSWEjJATSp/hrKf2P/Q9lByokVBcuSeUU3NMLtMvM/LM6ODx+pE88dMCEo4aPBC6Pxnpd',
  }
}
