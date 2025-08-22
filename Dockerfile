FROM ghcr.io/lavalink-devs/lavalink:4.0.8

# Copy configuration
COPY application.yml /opt/Lavalink/application.yml

# Create plugins directory and download required plugins
RUN mkdir -p /opt/Lavalink/plugins

# Download LavaSrc plugin for better source support
ADD https://maven.topi.wtf/releases/com/github/topi314/lavasrc/lavasrc-plugin/4.2.0/lavasrc-plugin-4.2.0.jar /opt/Lavalink/plugins/

# Download LavaSearch plugin for enhanced search
ADD https://maven.topi.wtf/releases/com/github/topi314/lavasearch/lavasearch-plugin/1.0.0/lavasearch-plugin-1.0.0.jar /opt/Lavalink/plugins/

# Expose port
EXPOSE 2333

# Set memory and GC options
ENV JAVA_TOOL_OPTIONS="-Xms256m -Xmx1024m -XX:+UseG1GC -XX:+UseStringDeduplication"
