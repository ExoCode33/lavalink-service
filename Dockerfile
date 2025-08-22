FROM ghcr.io/lavalink-devs/lavalink:4.0.8

# Copy configuration
COPY application.yml /opt/Lavalink/application.yml

# Create plugins directory with proper permissions
USER root
RUN mkdir -p /opt/Lavalink/plugins && \
    chown -R lavalink:lavalink /opt/Lavalink/plugins && \
    chmod -R 755 /opt/Lavalink/plugins

# Switch to lavalink user for plugin downloads
USER lavalink

# Download compatible plugins
RUN curl -L -o /opt/Lavalink/plugins/lavasrc-plugin-4.0.8.jar \
    "https://maven.topi.wtf/releases/com/github/topi314/lavasrc/lavasrc-plugin/4.0.8/lavasrc-plugin-4.0.8.jar" && \
    curl -L -o /opt/Lavalink/plugins/youtube-plugin-1.7.2.jar \
    "https://maven.lavalink.dev/releases/dev/lavalink/youtube/youtube-plugin/1.7.2/youtube-plugin-1.7.2.jar"

# Verify downloads and set permissions
RUN ls -la /opt/Lavalink/plugins/ && \
    chmod 644 /opt/Lavalink/plugins/*.jar

# Expose port
EXPOSE 2333

# Set memory and GC options
ENV JAVA_TOOL_OPTIONS="-Xms256m -Xmx1024m -XX:+UseG1GC -XX:+UseStringDeduplication"

# Run as lavalink user
USER lavalink
