# Adding user for Gareth Workman
class users::garethw {

  users::account {'garethw':
    fullname => 'Gareth Workman',
    email    => 'g.workman@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDE8HV3uXEhRnZyZvjArc25Oge8VQW3PVN7Cmo6yKjm+i1lZE2hl88j8QW8s4Yl5KMlPTv8DexPWA3HW/KgzonF9TTLwap3wvIW4TnwYJtOH44UD0pj+qHsF7eHLmbKE8gzmUep/LlOjyuSQk//BtT+xakok7ti1rQH9jj3dWvXqPYADCPy41y5NQbbrm4dhn4QdtlBHbqEKo532RcKbMzm3fcc5mPnV10XgNsawZ661RtYAoVts2FVSPkAOb+x6HEv8ah7NqCxBLwn1FvrEaCPzQzHV1aOGUvg5hyOYHLr0eOMk8dw3ams2r6AKHvcBHBMGgqbIGu2Waj+pHt12hch',
  }
}
