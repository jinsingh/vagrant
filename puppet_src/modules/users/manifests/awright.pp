# Adding user for Andrew Wright 
class users::awright {

  users::account {'awright':
    fullname => 'Andrew Wright',
    email    => 'A.Wright@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCrpDqYy4hVb2SYxzdH1j8Od2DXHvNFzXe5Sp5PQermGMdzBXG3GE69eycaMBSbxG6cwuJrPBGPUZOv7M59o2+o2Q+P3meqNTcJvrlOj77qV8D0qa5r4q/diD73TvcNF2kMsapNwb3uM4Io258SL8VYZsO7+qYqsm+2WzT/nDOxLtsShn6FA2aEP2JuNgUar5Jc0wOdylhG/cYt0kG4EKEFGk1Dd1iSGCG3sGnebGaZ7Thpbqowq1O4ToxkV43Iec6/vXZ1YkE6aPU9gzEaXGD/CfWpT2dhiJJXgy0HOYkdtnCg7mkh7UMP1AgD41JWcthQuF0SnpH6PhuvS+6Jl2T5',
  }
}
