FROM armhf/ubuntu

RUN  apt update ; apt install redis-server mongodb wget npm -y

COPY public/ /opt/chat.io/public/
COPY app/ /opt/chat.io/app/

VOLUME /opt/chat.io/data/

COPY server.js /opt/chat.io/
COPY package-lock.json /opt/chat.io/
COPY package.json /opt/chat.io/
COPY app.json /opt/chat.io/

WORKDIR /opt/chat.io

RUN wget -c https://nodejs.org/dist/v12.2.0/node-v12.2.0-linux-armv7l.tar.xz
RUN xz -d node-v12.2.0-linux-armv7l.tar.xz
RUN tar xvf node-v12.2.0-linux-armv7l.tar
RUN mv node-v12.2.0-linux-armv7l nodejs
RUN ln -Pf nodejs/bin/node /usr/bin/node
RUN npm install -g npm ; npm install
RUN ln -Pf nodejs/bin/node /usr/bin/nodejs

RUN npm install
EXPOSE 80
RUN npm install
VOLUME /data/db
RUN service redis-server restart
COPY mongodb.conf /etc/
RUN service mongodb restart
#CMD ["bash"]
CMD ["node","server.js"]
