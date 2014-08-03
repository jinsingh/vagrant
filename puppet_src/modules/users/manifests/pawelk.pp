# Adding user for Pawel Krawczyk
class users::pawelk {

  users::account {'pawelk':
    fullname => 'Pawel Krawczyk',
    email    => 'p.krawczyk@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDnSEvMPLWC2ig9gSkw2zzaornmlqIYB2B6D1WMTgh1HGbhz1A2qDgd8dlxd13z2m7XLqG6HZsRW4oVfUwc+G+0Z4DBvA0m8y1rEHyRvPWQxYwT2WJ8HSfJRiDIGckbu2mHBcXSum7gGvZNCoWoMXkVz37fwHRnmI5WTIaHe+KqwxH9tsDRbJuR9gRprEKdbcfRAMBj9yiO0DrVT9mqo7ULJsD4DIq5hMHYqGXvK3ZBZ7bj2Rd4XBBTzSHCaQG1On1aPstit/fhZCOOFIwARCBh+cYHYcsyUAfitAOdLD9UcdZHX4SzhsdVLr4nIT4N/in9UrNFsXCE1rUTKXMO/qQJ',
  }
}
