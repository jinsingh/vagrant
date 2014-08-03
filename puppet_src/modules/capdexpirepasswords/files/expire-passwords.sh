#!/bin/bash

# Execute password expiration jar, and log errors to syslog.
set -xe

exec /usr/bin/java -Djob.properties=/opt/capdexpirepasswords/expirepasswords.properties -classpath /opt/capdexpirepasswords:/opt/capdexpirepasswords/capd-expire-passwords-batch.jar uk.gov.defra.expirepasswords.ExpirePasswordBatch 2>&1 | logger -t CAPDEXPIREPASSWORD -p daemon.info

