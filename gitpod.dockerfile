FROM gitpod/workspace-full
FROM ubuntu
USER root
RUN apt update ; apt install -y make gcc g++ python bash wget nano npm xz-utils redis-server mongodb node-gyp
RUN npm install -g npm ; npm install