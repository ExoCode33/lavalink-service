FROM ghcr.io/lavalink-devs/lavalink:4.0.8

# Create plugins directory
RUN mkdir -p /opt/Lavalink/plugins

# Download the CORRECT YouTube plugin version for Lavalink 4.0.8
# Using version 1.5.2 which is confirmed compatible
RUN wget -O /opt/Lavalink/plugins/youtube-plugin.jar \
    https://github.com/lavalink-devs/youtube-source/releases/download/1.5.2/youtube-plugin-1.5.2.jar

# Copy configuration
COPY application.yml /opt/Lavalink/application.yml

# Expose port
EXPOSE 2333

# Set working directory
WORKDIR /opt/Lavalink

# Run Lavalink with proper memory settings
ENTRYPOINT ["java", "-Xms256m", "-Xmx1024m", "-jar", "Lavalink.jar"]
