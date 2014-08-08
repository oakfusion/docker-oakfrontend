FROM ubuntu:saucy

RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install python-software-properties software-properties-common
RUN apt-get -y install vim
RUN apt-get install -y g++ curl libssl-dev apache2-utils
RUN apt-get -y install make
RUN apt-get -y install wget

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

EXPOSE 8080
EXPOSE 9000

WORKDIR /home/app
CMD ["grunt", "serve"]
