FROM ghcr.io/lavalink-devs/lavalink:4.0.8

# Copy configuration
COPY application.yml /opt/Lavalink/application.yml

# Expose port
EXPOSE 2333

# Set memory and GC options optimized for Railway
ENV JAVA_TOOL_OPTIONS="-Xms256m -Xmx1024m -XX:+UseG1GC -XX:+UseStringDeduplication"
