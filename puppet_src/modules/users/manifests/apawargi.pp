# Adding user for Ashish Pawargi
class users::apawargi {

  users::account {'apawargi':
    fullname => 'Ashish Pawargi',
    email    => 'Ashish.Pawargi@rpa.gsi.gov.uk',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAABJQAAAQEA3FrD5BslT7kVP9o6gLFhVORq3TKpulZlYzCD28qf33/iKao8FiYc//DviXGzGfGywepFqctIlw0QdS2wwnvW+BO5ojopMync+xzubTn9GHLx8InH3iDQjK1oCHKv0dUMuhB8xpGLkil37shPj9r4o5hjIsp0hkEfZfQeOyJIKvyiVtlJ7637JhdzaDxJJuPRl6gGfqtsERTM2FaWWqlJrcn20hp2Kjq1RrVp0EIVyXTvYiDKhWW9C3XGS4ImyC6bCl/JL3BoCnrQBWsu/Re3vR1BxxIhsPfDBdW8ZusgkKUZzksSW3IgKn4X5mrCgnCAeSmwirn2jmESXE1gluEP2Q==',
  }
}
