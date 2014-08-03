# User for David Spence
class users::dspence {

  users::account {'dspence':
    fullname => 'David Spence',
    email    => 'd.spence@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC+FruhVIx6yMFiJv9R99ACx1+ZqLDpAnqfu1vo5WbOEH2TIBXH6VbxNkCBFOSw79FKTvDRpuTqVOIJLFcypbO4mNwGSW6be2DFXmPereuh71eS6hMQ1EiHf7iJIvneFKkxm2dJQSg7PZLsoIVkESXWh8Rpv5vol/NCgkIyFcGdlz6pejJPY3jt6pxvH1mOAdZcjrD/nEgUuGDpbDp1N1kdaGQ41gGtXcLm9Vf/dJGP8pqy5sigIqYH0MgtkvZBuhJQeEg6DhsoAK2aL2J2zcIVTrhzoyGrK2H5Z3Xm+U6Fhzbj/2srARojPRATXHPbNKRp+MiDkq+aqQ5Smf6Lj2MT',
  }
}