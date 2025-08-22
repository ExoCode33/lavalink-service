FROM ghcr.io/lavalink-devs/lavalink:4.0.8
COPY application.yml /opt/Lavalink/application.yml
EXPOSE 2333
WORKDIR /opt/Lavalink
ENTRYPOINT ["java", "-Xms256m", "-Xmx1024m", "-jar", "Lavalink.jar"]
