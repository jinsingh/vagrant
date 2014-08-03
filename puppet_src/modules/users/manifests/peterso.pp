# Adding user for Peter Souter
class users::peterso {

  users::account {'peterso':
    fullname => 'Peter Souter',
    email    => 'p.souter@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDdbSovfV9l3sOgsn8XTO/ChuG05+Ym5ELeIYdlDcb4M66LwJAZWKxZJsn418qmew+TxQiIFb3+YSa1hT7uIU93sC/QL6PfeYIWie773oQLq5SLtcxtQfdeEfFFka01/LaOaLeEbi0yVNy+Nr/giWy+qn4HpNlwTZsLuaU44ZsuUEvXWqOj7RMKkYoOV5BTL8cKwxrMJ0mFGa2ShE5rl2DKEpbuYNusRiK0nXhqNABjf5UZDafTQAzXNlNDR5m7qjK61NtNOcT+GgVvcqfaeiJ+Kd9iLNKo2AvDogSanCa362G4tbhsyJXfJ8vAOfCzr3XoKm2I97K8M+yEVmTLnK/n',
  }
}
