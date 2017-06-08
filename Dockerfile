# -------------------------------------------------
# docker-starbound
#
# Create a docker image to run a starbound server
# http://playstarbound.com/
#
# Authors: Gavin Mogan
# Updated: 2017-06-08
# -------------------------------------------------


# Base system is the latest version of Ubuntu.
FROM   ubuntu:14.04
MAINTAINER Gavin Mogan, docker@gavinmogan.com

# Make sure we don't get notifications we can't answer during building.
ENV    DEBIAN_FRONTEND noninteractive

# Update the env
RUN    apt-get --yes update; apt-get --yes dist-upgrade
RUN    apt-get --yes install python2.7 python-dev python-pip git
# run    [ -f /data/starbound.config ] || cp /etc/starbound/starbound.config /data

EXPOSE 21025

ADD    scripts /scripts
ENTRYPOINT ["/scripts/start_starbound"]
