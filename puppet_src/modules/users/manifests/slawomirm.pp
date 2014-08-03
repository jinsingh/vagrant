# Adding user for Slawomir Malyszek
class users::slawomirm {

  users::account {'slawomirm':
    fullname => 'Slawomir Malyszek',
    email    => 's.malyszek@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDDaxgwQ31pk7G6g2EfIb8Ouwcn7vXYfOyOt+c4xPEMYdSfETGkleKOI2txJj1yIudV3hdM/yKJfRUr151vtr7sE1L7enWhu6/0qKilERdBlHsVMEOLzcKlYw5YriNTzhEVu1LhJilqaiprTx15TKK5vEZC/UetSGcf/repfn3Qm1P5JmvqZFWD+YGoWhwwHkvWYOE+N6UPWNyoAVf9aEr/WCCUvZD+zpFBr0HPPbjF0KKE5FN76b8U9P7ja5+GbN533JUd77NssKaM8Acu0jXZ+XVkpQf1CmAeHO7CarUj17v2cuT9HKb68O+9WaIO7AlpBJkeM2gzuoMcQU6RD1ol',
  }
}
