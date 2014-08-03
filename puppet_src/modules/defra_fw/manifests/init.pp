# Class defra_fw used to configure global firewall rules\
# evaluated by firewall module provided by puppet forge
#
#
class defra_fw {

  include defra_fw::config

# note when defining new FW rules keep in mind naming convention used
# and so every rule has to start with a number:
#
# 0## for ::PRE set
# 1## for ::config and node specific rules, 1[n]# where n would be node number.
#  11# - web
# 12# - db
# 13# - geo
# 14# - gis
# 15# - services
# 16# - management
# 17# - capapp - SITI Agri application server
# 2## - other
# 9## for ::POST set

# be aware that firewall resource may be declared anywhere - ie. in any module/class
# this takes place in rackconnect module, but this has to be done on purpose
# after carefull thinking.
}
