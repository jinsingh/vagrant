# Adding user for David Colmer
class users::davidc {

  users::account {'davidc':
    fullname => 'David Colmer',
    email    => 'D.Colmer@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDGsJ3m4318ui+2EF9tRBlTQMrlEGOsCqvbOamGu9kzSM4WumCskOjoUL336rjMJiEjHldbYjekHUfhMdxd9E97faPLByt9xfobOMxNKzRXovbm5XWgKCdo2186b0OH7crSLockV5zErOUS2QxUvgfil3e7lE9QddMyldwEDemA11wHt5yQ6HkDCu8dvys99ijtNDNiHz7zPxfj3VLTmNdWGY5+Fg+a2dLHqzDUXjJV/Wv92KV+Rn2ZAxZ1gy4X6CuMfoIdhHAxnq9THaaZPbpau+2m30TRA3t+rp67FlH5E1h3mp4hGX2MnCt5H+TGAqla2NP+aF1mpghvkHl0+xrQIffukAt6VIr7KueKJsvcXGDM8EAzjypOaFSCXu0ZS65DnCVughVx2XJdNB2r0tm6j5shKHbdmDOwtMQbsxuA4KT2GnldgHThwH6ALAWvo86iuf15Rq8athsCV/eUWPk4ckfdOHFzZAOihr+qSZKOQuXoGyNBL74lsbRpLAYJ8icBOny8HOJ8gvTc93O/Fk45cOaKPbW7XMwO20eDcGhcgFb+zS4aKgXTAGtEitcyPM8xY7whhMXjABURFc4ihKRE/rio8CRrtLzZLSPZEvfAQGecrmkZQTAFmoc9zlV6a8rsPu5aqfMBR1Q5J+iHwdjLxjfjGMyAGkbkkUMjJ0ATrQ==',
  }
}
