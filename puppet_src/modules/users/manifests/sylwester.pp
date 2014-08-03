# Adding user for Sylwester Gryzio
class users::sylwester {

  users::account {'sylwester':
    fullname => 'Sylwester Gryzio',
    email    => 'S.Gryzio@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDDYcnu03xztdngkmNtMcpPXGdwwxiVbKrHyUVfzzdq3tBiJrdSWaz/WNWIjdD5mbSsNHWzoJEX71Q16iK6Ph3bvQB8O/X3nEi2Eo29LJc5B6j/YJozO/5I/qH6J31cSoq+5GwaTWwA3JSIATRFTnxS0QnPRCuUWa2Tx4SS4YJoMWvXCbax9dtexACkGViOglYEIv1CwN1+Ff4rP+Lh3arRSvGv9n9sFC1jCxkpHL9XJ9nzV6pe3DSAL++GWqEvlyf0ycJE35jWALLbH+vZSfSLwRJdO4H2TrJSgPpFtaS1RAHekFNmIeIUVLzb1/E9kmrcBlp5ow3E1pUeN/aE3QVocvOyq/f9aNaaWWsnfWcl1W3v8XzIqQJmPznq0bSKWKfr/MjeHpuKTLi/t3/8Lkn2t+a2VUGcIst/obVB13DNDU9UjcmsREKGIKak6hx6evMsZ4qlsSSDI7HCTioB7ue7hwaD0/nDNvmwcEGB2wbs4Lsh5Z0s/SzWaOqwCLxrIbDGjt0/VkmJ/kaml1A56UQHaZhk1gg6S06Ehy4kwDWqadPqtoOTYXfYsYZUOyHMI3dJQ0JgKm3D+/SHH+ujeNhl/eBfuz2nEnZtALaKG/XnB0+fQQsXWhYefi9EW3/Of+2OjrXH/4ZaO+7e1jfCfYyv/NxOQqfB4KOK5YAcEtpINQ==',
  }
}