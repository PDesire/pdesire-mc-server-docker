FROM ghcr.io/graalvm/jdk-community:21

# Setup Minecraft User
RUN groupadd -g 6969 minecraft
RUN adduser --badname minecraft --uid 6969 --gid 6969

# Setup Minecraft server enviroment
WORKDIR /var/minecraft
RUN mkdir -p /var/minecraft/server

# Copy script
COPY launch.sh /var/minecraft
RUN chmod +x /var/minecraft/launch.sh

# Set permissions
RUN chown -R minecraft:minecraft /var/minecraft

# Run Minecraft Server
CMD [ "bash", "./launch.sh" ]

# Setup Minecraft server
USER minecraft
EXPOSE 25565
EXPOSE 25575
EXPOSE 19132
EXPOSE 8123
