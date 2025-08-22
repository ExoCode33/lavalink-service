FROM ghcr.io/lavalink-devs/lavalink:4.0.8

# Create plugins directory
RUN mkdir -p /opt/Lavalink/plugins

# Download YouTube Source plugin (compatible with Lavalink 4.0.8)
RUN wget -O /opt/Lavalink/plugins/youtube-plugin.jar \
    https://github.com/lavalink-devs/youtube-source/releases/download/1.7.2/youtube-plugin-1.7.2.jar

# Copy configuration
COPY application.yml /opt/Lavalink/application.yml

# Expose port
EXPOSE 2333

# Set working directory
WORKDIR /opt/Lavalink

# Run Lavalink with proper memory settings
ENTRYPOINT ["java", "-Xms256m", "-Xmx1024m", "-jar", "Lavalink.jar"]
