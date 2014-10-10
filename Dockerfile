FROM ubuntu:saucy

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install python-software-properties software-properties-common
RUN apt-get -y install vim
RUN apt-get install -y g++ curl libssl-dev apache2-utils
RUN apt-get -y install make
RUN apt-get -y install wget
RUN apt-get -y install git
RUN apt-get -y install bzip2

WORKDIR /home
RUN wget http://nodejs.org/dist/v0.10.30/node-v0.10.30.tar.gz
RUN tar zxf node-v0.10.30.tar.gz
WORKDIR node-v0.10.30
RUN ./configure
RUN make
RUN make install
RUN npm install -g yo

WORKDIR /
RUN mkdir /home/app

WORKDIR /home/app
CMD npm install && bower --config.interactive=false --allow-root install && grunt serve --force

EXPOSE 9000
