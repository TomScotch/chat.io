FROM gitpod/workspace-full
FROM mongodb
FROM redis
RUN service mongodb stop ; service redis stop
USER root
VOLUME /workspace/chat.io/data