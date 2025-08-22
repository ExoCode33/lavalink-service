FROM ghcr.io/lavalink-devs/lavalink:4.0.8

# Copy configuration
COPY application.yml /opt/Lavalink/application.yml

# Expose port
EXPOSE 2333

# Set working directory
WORKDIR /opt/Lavalink

# Run Lavalink with proper memory settings
ENTRYPOINT ["java", "-Xms256m", "-Xmx1024m", "-jar", "Lavalink.jar"]
