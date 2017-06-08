# -------------------------------------------------
# docker-starbound
#
# Create a docker image to run a starbound server with the StarryPy wrapper
# http://playstarbound.com/
# http://github.com/CarrotsAreMediocre/StarryPy
#
# Authors: Gavin Mogan
# Updated: 2016-07-24
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

# Use tini as subreaper in Docker container to adopt zombie processes 
ENV TINI_VERSION v0.9.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# Install StarryPy
#RUN    git clone https://github.com/CarrotsAreMediocre/StarryPy /opt/StarryPy -b v1.7.2; pip install -r /opt/StarryPy/requirements.txt

EXPOSE 21025

ADD    scripts /scripts
#ENTRYPOINT ["/tini", "--", "/scripts/start_starbound", "/scripts/start_starry" ]
ENTRYPOINT ["/scripts/start_starbound"]
