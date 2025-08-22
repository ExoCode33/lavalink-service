FROM ghcr.io/lavalink-devs/lavalink:4.0.8

# Copy configuration first
COPY application.yml /opt/Lavalink/application.yml

# Create plugins directory with proper permissions
USER root
RUN mkdir -p /opt/Lavalink/plugins && \
    chown -R lavalink:lavalink /opt/Lavalink/plugins && \
    chmod -R 755 /opt/Lavalink/plugins

# Switch to lavalink user for plugin downloads
USER lavalink

# Download plugins with proper permissions using curl (more reliable than ADD)
RUN curl -L -o /opt/Lavalink/plugins/lavasrc-plugin-4.2.0.jar \
    "https://maven.topi.wtf/releases/com/github/topi314/lavasrc/lavasrc-plugin/4.2.0/lavasrc-plugin-4.2.0.jar" && \
    curl -L -o /opt/Lavalink/plugins/lavasearch-plugin-1.0.0.jar \
    "https://maven.topi.wtf/releases/com/github/topi314/lavasearch/lavasearch-plugin/1.0.0/lavasearch-plugin-1.0.0.jar"

# Verify downloads and set final permissions
RUN ls -la /opt/Lavalink/plugins/ && \
    chmod 644 /opt/Lavalink/plugins/*.jar

# Expose port
EXPOSE 2333

# Set memory and GC options
ENV JAVA_TOOL_OPTIONS="-Xms256m -Xmx1024m -XX:+UseG1GC -XX:+UseStringDeduplication"

# Ensure we run as lavalink user
USER lavalink
