# Adding user for Antonio Perez
class users::aperez {

  users::account {'aperez':
    fullname => 'Antonio Perez',
    email    => 'a.perez@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCxJXCZG2MmUcnLNbErt13CnejdDRWI5wzfM20quJloD/N8GeDKg/HDqFmXZEjq1xrmfM7TiB6qLano1Q1BYMa3NkQDjPc4rnNIYhMuJCf+euFC/M/1jPeZdy7v7K/pPJXeDbazf1FFAjQAnUYmVNw6KsuZb3/mcXOfzs1+211zgK0uxXe0eR3xC4OKQqDa0FXr6utzspTeJqThqtm/i5B7Mb6gzIkVtA6Y2w/gNt2ZZjPXeFP7ynH0dFuACRk6mbY1DDEuN1AXbrDFRsdle/80VKeVZlnBOH5m7M6oQe9np9GbqDld7bUmF7tnZSL17s3rWSqIHDbFW1NwHJvxF+aR',
  }
}


