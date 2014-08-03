# Adding user for Piotr Gospodarek
class users::piotrgo {

  users::account {'piotrgo':
    fullname => 'Piotr Gospodarek',
    email    => 'p.gospodarek@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCxBOE81adht5MWHO7HJ2lwf0Y+zBvoVZnfAzWg/3dNDWAFQUjHEZn5TS712X+9iEDbdZFEhTe1/8XM/N+oIW1F0F857VNvknDtm8nIxRzFwtkZMqpaJSnoBJyKEpHiEsf1XtG+BmgUkOwKmvcxKXN90RQjooLkLPYIUUtF0X2GfW+ggLJIT7VyRPl40/YiodDOiqjAL2ulwh30THXUmpPP6uw60dSkipgCcWi6b6HWIYwVf2+jbd0JQzmIwW5+uO1ddbq1Q2VGWmtNierQbKVTF/LYonlRnNp9o0UIu3n4pQ7pMfavkAYGrl2F7gTIdIbRTLyYGiAB2zSMPTz45NK9',
  }
}
