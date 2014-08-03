#User for Simon Watson
class users::simonw {

  users::account {'simonw':
    fullname => 'Simon Watson',
    email    => 's.watson@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDWVJrVBAf3LDlV4XoJRnGu8o1YB7DI8dPys+gCE+6E7T3uZ4TxHvjxmaQNWuOd0h4bbr1Xzv7NYCiFue2zFbcfJURaHqsLAa4HC8/jzKfMSUlW6kqiPX4W7mXFNvIK541IE8/X/oA0xJU5882wzZsazD82kAU7WKCW9pM3ehpn4Fwep/AuyZ30UrThDlIcT3Pzxl/motgQqwQAqiqi6nXYSVUiQmKz8jVne+gBQ8aqRXIf52vs9Kgib5uj08x+eTA0b3miD2MZIaIcXbXF7qE/BB+9l+6CXYcEWkBYJrQybSaYsr0O3Xgs5P9+AYTyebcx9jjC63L6oOcomdO4KndL',
  }
}
