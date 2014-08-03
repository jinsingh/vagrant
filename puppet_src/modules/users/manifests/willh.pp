# Adding user for Will Hamill
class users::willh {

  users::account {'willh':
    fullname => 'Will Hamill',
    email    => 'w.hamill@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDHcK8tms0wTnkM8W5gH8tRbkwMXjEy2EfouriCYm5dmAL3T0qvcUdgzm1bfeaW5pn7+QVryLDnZR0kaETrRx6jUUIHQVHyW8CEduMFNi7QGnm6hBmul3ktt5P+qnEonlMBtmaQ/1+GP0Zn9XYOF9o5NM0gthWl8EyALJuqpOCIEzLnb2i6D5RnpyatGAb6UhasHd0T4LK6h+MP8sZ3mpXF0ei1UX15+O4oqDHFdngNR0dphCy7z/Aabzr7Ks7dUJovnfSHjg9sJ/PBhb4+2tqmLtLhZ++3jXZtdQMPSg+baaLrz9VQSmG4gT/X9E+IuguHEcNDgaelkf9Wnktt1Tk5',
  }
}
