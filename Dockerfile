FROM armhf/ubuntu
RUN  apt update ; apt install redis-server mongodb nodejs npm -y
RUN  service mongodb stop ; service redis-server stop
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
EXPOSE 3000:80
CMD ["bash"]
#CMD ["sh run.sh"]
