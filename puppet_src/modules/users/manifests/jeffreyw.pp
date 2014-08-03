# Adding user for Jeffrey Wokocha
class users::jeffreyw {

  users::account {'jeffreyw':
    fullname => 'Jeffrey Wokocha',
    email    => 'j.wokocha@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCxDU3pE5BHf9iDXd5LM/Tjwneuv7RqlwsI/fdNLtWhql7UF6nxFcmjCRgEFS0AwXx/v4bvAVhR8Wso6SRNoO/iE7ftNRVCQ3tOs9c/JEX62d/UmHfoYuOV7KIDkviEHwwnHXXkaiZjRCM7Yo/vpaRY7l2u2jYg8jKvUhYYf6R0BMG7mKyRdWEorS/QL7iV2iD/XdMoGw7kwrLCpgSoonGs8JEC0YDlpC2qWroQ4EYIVpGA812H0cMlOgRKxBHm69auwsrZcnVcx7WX4sr4AgtQJ2+LtEGoYHyyXgYZjOccEaenVL+qYln4GkEfPo+NquH6rWNJBv3fo34T8+NGIHyp',
  }
}
