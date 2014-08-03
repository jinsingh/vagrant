# implement Tomcat configuration required to start basic Tomcat instance
# deploy application WAR file when available however it might be best to leave to CI configuration
# and only supply the environment configuration as part of this manifest.
class tomcat::config {

  # Following tasks to be completed
  # Add symbolic link from rc5.d to /etc/init.d/tomcat6 sudo ln -s ../init.d/tomcat S71tomcat
  # Configure Server.xml with the appropriate DB connections

}
