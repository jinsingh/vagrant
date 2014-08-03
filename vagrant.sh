#!/bin/bash

: ${PUPPET_OPTS:=--debug}

command_exists () {
  command "$1" &> /dev/null ;
}

# Bootstrapping
bootstrapDependancies()
{
#  cd /capd-ops
  yum install -y rubygems git make ruby-devel
#  yes | rsync -vcr /capd-ops/puppet_src/* /etc/puppet/
#  mkdir -p /etc/puppet/hieradata
#  yes | rsync -vcr /capd-ops/hieradata/vagrant_dev/* /etc/puppet/hieradata/
#  mkdir -p /etc/hiera/eyaml/
#  gem install hiera-eyaml --no-ri --no-rdoc
#  cp /capd-ops/vagrant_dev/keystore/ci_private_key.pem /etc/hiera/eyaml/
#  cp /capd-ops/vagrant_dev/keystore/ci_public_key.pem /etc/hiera/eyaml/
}

resolvConfFix()
{
  echo nameserver 8.8.8.8 > /etc/resolv.conf
}



setupyaml()
{
if [ -f '/etc/hiera/eyaml' ]; then
  echo 'eyaml set up already'
else
  mkdir -p /etc/hiera/eyaml/
  cp /capd-ops/vagrant_dev/keystore/ci_private_key.pem /etc/hiera/eyaml/
  cp /capd-ops/vagrant_dev/keystore/ci_public_key.pem /etc/hiera/eyaml/
fi
}

if [ "$HOSTNAME" = web.test ]; then
  cp /capd-ops/vagrant_dev/keystore/capd.test.crt /etc/pki/tls/certs/capd.test.crt
  cp /capd-ops/vagrant_dev/keystore/capd.test.key /etc/pki/tls/private/capd.test.key
fi

#resolvConfFix
#setupyaml
#bootstrapDependancies

#puppet apply $PUPPET_OPTS /etc/puppet/manifests/vagrant.pp
#yum makecache
#puppet apply $PUPPET_OPTS /etc/puppet/manifests/site.pp
