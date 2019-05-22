FROM armhf/ubuntu
RUN  apt update ; apt install redis-server mongodb nodejs npm -y
RUN  service mongodb start ; service redis-server start
COPY public/ /opt/chat.io/public/
COPY app/ /opt/chat.io/app/
VOLUME /opt/chat.io/data/
COPY server.js /opt/chat.io/
COPY package-lock.json /opt/chat.io/
COPY package.json /opt/chat.io/
COPY app.json /opt/chat.io/
WORKDIR /opt/chat.io/
RUN npm install
COPY run.sh /opt/chat.io/
RUN chmod +x run.sh
EXPOSE 80
#RUN mongod --port 27017
RUN npm install
CMD ["bash"]

#CMD ["npm start"]
