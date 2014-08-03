# Adding user for Xavier Senac
class users::xaviers {

  users::account {'xaviers':
    fullname => 'Xavier Senac',
    email    => 'x.senac@kainos.com',
    ssh_key  => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDXqG+KXAQo1Wjto0JTuzGlKqpIVA1ix1nCVxWb5IuZoCyNv31q+VyMigD+qwquOyaJgfWK9B3kQ2SpixGEvse4p++vvGWijj/YfsPMo/5w8Gal1qgDh38g1bPTAoTJzj7RB8uJ1+odv1935ydcCieG1N6OzRxadgj8dzmr3Vkw0GDPb20mhRC+8p/iiqLTpNAa8ShtSWYWSkLRReeaOSAnAok/WrIrAU0Wh21JZTHSic/pf5bzyU2ORAnPbclWkD6M84F6C71KRuCL7MFwo/WKEJ+r/k/ulou7REdkNNFLl5qmB4jacf5o1yrqaVVO6kRKlH/8exuuWGBvmzlTkcSWvprOeLOWBAWBjJk14of1xQ8sANXD5/2weF+dgeHpX+60vwBXyFANy4dVAZ2kNGi8fGmQxAEz2lSK7bUNkp8bi0DisZvguWWavk/nsA/SVUydUkJ0JjbswtxUV4XmYsuNcktg9HzcPWbAx4E9uZO1LjEU8RvtDob9hmXbtxCekIolb+1CAlP25H8hCAUVL752DgjXisyiXF/Wsk2CdzuSKebmtsxPmYgZYRlv9nEPEnra2AlNJUGzQ0pfm4fz8PeutPHRm+mzp9kDkOZRrO/BQBiVR9BY23xfrX3j/hvgDij9lkyzJVEn2PYycWYnXotbDtHi/R+HAj8InWVj4Ob2Uw==',
  }
}
