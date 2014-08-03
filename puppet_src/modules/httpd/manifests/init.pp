# = Class: httpd
#
# The config class currently just installs and manages the rsyslogd 
# plugin for httpd, but this could be extended to manage the httpd 
# package and service currently implemented separately in some
# other classes.

class httpd {
  include httpd::config
}
