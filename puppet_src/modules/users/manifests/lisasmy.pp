# Adding user for Lisa Smyth
class users::lisasmy {

  users::account {'lisasmy':
    fullname => 'Lisa Smyth',
    email    => 'l.smyth@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC/izXuoIv5hXKbJIv+gp/6U1RH5gqqSnHPGbz2Y7Q8brTGjRm0C4GP56WHZEb4DuP4629TylVv9cLtbjj8GlkFtM42jLXdQAecNmBOIxCpdMzV/elJdCJhd5M6Y/4ny1/BUjCA3eoPzWAecG5OukB69B+Vjp17GbqdEZ4OaxonltBGkX4Aj14XP/tZJt/0sbtsH6ZzEjyrmj8Y4UupxQjnH3AW8QfayRh3/wYfu/kd+DcE1aJxiqNkzKRrHF5AgZyllsr4K5PBryV3bJmyJxaPWT6QRvCZMalYoE9T7t1MstTuwphjTIe9DlfLN7pqkzc3LY1qefCWCqjORhAXswPF',
  }
}


