
FROM ghcr.io/lavalink-devs/lavalink:4.0.8
COPY application.yml /opt/Lavalink/application.yml
EXPOSE 2333
ENV JAVA_TOOL_OPTIONS="-Xms256m -Xmx1024m -XX:+UseG1GC -XX:+UseStringDeduplication"
