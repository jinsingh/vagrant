# Adding user for Rory Hanratty
class users::roryh {

  users::account {'roryh':
    fullname => 'Rory Hanratty',
    email    => 'r.hanratty@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDG7DtAjM2DEg5hLeuUKvpE+Suu+/F+VqsdNyZsgiYHx3Qq6NuNIjttqWLtqD+kLxdUz0fqj1adJ7BO8LOaL0MDb9NdShaRqQN+rAtwM9KQhhISdcljj8WKuAC82OjEj0hxZZfMZc3+iuP/m8aAmiSWcWqo5OG6rnf2kFwSt9OvtLBlGbVCMCj36x1ae6jVl3JWwO5dbs8DdB9DGImLd8psIVsZwdHLzU70IBI5DH3QU5p76imwF2S4VcLTZ221fT94dKxrODhvk3/04A+FeqqGHPZpvEZkt6qzAH7RMMXZrpdBqH0bBCytr3aqAuohZdT4+NYhBUxMQA2Rm021D8TP',
  }
}
