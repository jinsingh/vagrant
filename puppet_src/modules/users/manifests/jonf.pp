# Adding user for Jon Fox
class users::jonf {

  users::account {'jonf':
    fullname => 'Jon Fox',
    email    => 'j.fox@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQClzaYSwJT6bULfGllB+gF2SMZLeckkZxZODebWvt5SJX8ck395A203nDsdKbHbskEwwTlH45U00jbC40qbExiYlwyZICns9jALixLx2bt9gzu2lZRzRO6C89oCX0U2bdeLuxJO51xOIpc03aK5qTfnYyNlXprlhFjEUhh85g77sFfBdTt5B62FoQeg7/yK3yv2Ij551MRY/6pfblEwCs547DN/CWtiLCjOCz5Dwuwa7/netHW/e+/c9wsAozMLvSa8Pzjb8PsCoPuNowKlapNvJkdSgZFTihJ9t0RMt5U6fumfJ1+djLol+7CoN1UbA4NjiPH0+puVggKEBuThPmmV',
  }
}