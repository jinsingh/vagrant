# Adding user for Rob Lazzurs
class users::robl {

  users::account {'robl':
    fullname => 'Rob Lazzurs',
    email    => 'r.lazzurs@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDAmYAqy4GTcHbKXs62wXPWrWHNmBaaplpsqmIiFr88ffRZYr/bfAWZhKIV7gMKPYoe3DQjIFP2HCDdvGjTxIHGGCtAA3MfJ06O7j8hNIx5btiLe1zKoz2l+Ci2+j+k+nXOz3wUOr3/hOWXP9ViyujpRrTb8XokUCc0MAUOMhw0WCt3+hp9/jZScxf8BFDq24aGIX27AmwSWqyvBJfeO3CT8bRfBhjz/dqhjpDvSds6DOtapzZ2Kepktx0c0sGo/DTeTlYkE0Uj/KNdwJCjKDVzMBAzGiwhDcU0bnh+s3dpYXAl5guMes+vde9vXQ8u1NnfISu7/SlO6mALX/gVc21yFmue7rc8YHuops0rxAlxoGnj03XoYomZrVRK1WVWxvBr3eu4NoqJU09bH9BQv8pfVkJBayh8GeNY7JU7WZsbDOJ8hKZDtKvgimdq/INjVihcEQ6cHkw8gFlvE07yZcKs/4rgQuirsqePTwi+U10QfU0ED7PMeW/sedpCpXA8nY/qVOkyzVL5aQ03+WZY+qmV0iz++H2jF0oZSA6F2crg9keh7AapDcBveGrYwSGOW55RBgNt/dqww4bewh0xpw8pg1pZIIA/suNCcFPqzZdM/OKwd3qjrHcHKeDUcUOxfjDrY4kgPNLxa+HY9Kzg/KtULLfBjVkMfPgxmkDUBdqROQ==',
  }
}
