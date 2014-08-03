# Adding user for Ireneusz Pastusiak
class users::ireneuszp {

  users::account {'ireneuszp':
    fullname => 'Ireneusz Pastusiak',
    email    => 'i.pastusiak@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC844hO9q/8Os/+JPiuL395497hAf3Fu6mO8TUZqguANJXvM18OtTAeiCuvMWAl39C+fUdKzPLVqwULwCRh6pCvK9Jksu1CLoe1tjeLJge0bSaPAUpUgQqpQsDKQDxyF5w5bgJOs2KuYlw3T/kOJLxXQhSltu/zRueB+0TtibQVm3ZshjU4l97L0NhZaECClBpfGF+HlJR+BdYEeTj3dBAXQqDh1nf82VbaUuVj6kQrnhS1lU18kEvb0nXcRTggb12u2p4GJdyT8vFEbf8WVqoy081p6SOONvh86ax8bmLlbwGmPz/zt/RI36ANHNgnEZ0nVABUb0yV+CCAA3iCE2tr',
  }
}