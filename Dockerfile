FROM ghcr.io/lavalink-devs/lavalink:4.0.8

# Create plugins directory
RUN mkdir -p /opt/Lavalink/plugins

# Download lavasrc plugin (adds SoundCloud, Spotify, Apple Music support)
RUN wget -O /opt/Lavalink/plugins/lavasrc.jar \
    https://github.com/topi314/LavaSrc/releases/download/4.2.0/lavasrc-plugin-4.2.0.jar

# Download lavasearch plugin (improves search capabilities)
RUN wget -O /opt/Lavalink/plugins/lavasearch.jar \
    https://github.com/topi314/LavaSearch/releases/download/1.0.0/lavasearch-plugin-1.0.0.jar

# Copy configuration
COPY application.yml /opt/Lavalink/application.yml

# Expose port
EXPOSE 2333

# Set working directory
WORKDIR /opt/Lavalink

# Run Lavalink
ENTRYPOINT ["java", "-jar", "Lavalink.jar"]
