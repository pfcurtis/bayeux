FROM ubuntu:trusty

RUN apt-get update && apt-get -y dist-upgrade

RUN apt-get -y install git build-essential rubygems1.9 ruby-compass zip curl python-minimal

RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -

RUN apt-get -y install nodejs=0.12.18-1nodesource1~trusty1

WORKDIR /root
RUN gem install compass
RUN npm install -g bower
RUN npm install -g grunt-cli

RUN cd /root && git clone https://github.com/htck/bayeux.git
WORKDIR /root/bayeux/htck
RUN mkdir -p node_modules
RUN npm install || true
RUN bower install

EXPOSE 8080

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
