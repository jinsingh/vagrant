#!/bin/bash

# Execute password expiration jar, and log errors to syslog.
set -xe

# provisional cron
#exec /usr/bin/java -Djob.properties=/opt/capdinternaluseractivation/internaluseractivation.properties -classpath /opt/capdinternaluseractivation:/opt/capdinternaluseractivation/capdinternaluseractivation.jar uk.gov.defra.internaluseractivation.internaluseractivation 2>&1 | logger -t internaluseractivation -p daemon.info

