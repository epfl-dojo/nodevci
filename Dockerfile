FROM ubuntu:latest
MAINTAINER epfl-dojo@groupes.epfl.ch

RUN apt-get update
RUN apt-get -y install nodejs git-core vim npm
RUN apt-get -y install git
RUN apt-get -y install curl
RUN npm cache clean -f
RUN npm install -g n
RUN n stable
RUN ln -sf /usr/local/n/versions/node/*/bin/node /usr/local/bin/node

ENV gitrepo https://github.com/ponsfrilus/EPFLegram.git
RUN git clone $gitrepo /opt/app
WORKDIR /opt/app
CMD npm start
