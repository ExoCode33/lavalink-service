FROM ghcr.io/lavalink-devs/lavalink:4.0.8

# Create plugins directory
RUN mkdir -p /opt/Lavalink/plugins

# Download COMPATIBLE lavasrc plugin for Lavalink 4.0.8
RUN wget -O /opt/Lavalink/plugins/lavasrc.jar \
    https://github.com/topi314/LavaSrc/releases/download/4.1.1/lavasrc-plugin-4.1.1.jar

# Copy configuration
COPY application.yml /opt/Lavalink/application.yml

# Expose port
EXPOSE 2333

# Set working directory
WORKDIR /opt/Lavalink

# Run Lavalink with proper memory settings
ENTRYPOINT ["java", "-Xms256m", "-Xmx1024m", "-jar", "Lavalink.jar"]
