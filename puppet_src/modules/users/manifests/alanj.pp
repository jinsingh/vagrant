# Adding user for Alan Jennings
class users::alanj {

  users::account {'alanj':
    fullname => 'Alan Jennings',
    email    => 'A.Jennings@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDO+gl9zTPq4lbziQv34iySeUCLpsYlG3TIpfaA1Ws66XD7tz9z/hRbn2UQ/tAiSO8gwg4fFy7xcDd+i73l5fD/sD8G9O333wqo4t8gkqd/YJVX3KHuABieWmapAS020Kaf3RAPS5cHdwarbSf4VohS8qy4Bz7giIdy4WUR3Sff3Bk5FTH0pvKpd8q+sIZFruK1djT0p8tu63RQdr6JNGVMFZHc3BJ76N++1chfbUstWSCemF2OMfC8tPokzyxdBM+f//8PO/vbhbPZg0AMaM4PvpZeWY4Ridb4QrAZ0kZ/kG2mtTrw0gEMXPdRyraOB/mujZk7v1dNXjzwWSDW1oRz',
  }
}