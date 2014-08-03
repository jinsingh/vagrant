#!/bin/bash

: ${PUPPET_OPTS:=--debug}

command_exists () {
  command "$1" &> /dev/null ;
}

# Bootstrapping
bootstrapDependancies()
{
   cd /tmp
   wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
   rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
   yum install -y rubygems make ruby-devel jenkins
   cd /devops
   yes | rsync -vcr puppet_src/* /etc/puppet/
   cp jenkinsjobs/* /var/lib/jenkins/workspace
}

resolvConfFix()
{
  echo nameserver 8.8.8.8 > /etc/resolv.conf
}

#resolvConfFix
#setupyaml
bootstrapDependancies

#puppet apply $PUPPET_OPTS /etc/puppet/manifests/vagrant.pp
#yum makecache
#puppet apply $PUPPET_OPTS /etc/puppet/manifests/site.pp
