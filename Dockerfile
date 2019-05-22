FROM daocloud.io/ubuntu:16.04

USER root

COPY sources.list /etc/apt/

RUN buildDeps='software-properties-common python-software-properties git libtool curl wget cmake python-dev libseccomp-dev' && \
	sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list' && \
    apt-get update && apt-get install -y python python3.5 python-pkg-resources $buildDeps && \
    add-apt-repository ppa:chris-lea/node.js && add-apt-repository ppa:openjdk-r/ppa && \
    wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add - && \
    apt-get install -y openjdk-8-jdk nodejs nodejs-legacy npm && npm install --global gulp && \
    apt-get install -y --force-yes jenkins && npm install -g cnpm --registry=https://registry.npm.taobao.org