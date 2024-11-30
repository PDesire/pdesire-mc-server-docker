FROM ghcr.io/graalvm/jdk-community:21

ENV PAPER_MC_VERSION="1.21.1"
ENV PAPER_BUILD_VERSION=131

# Setup Minecraft User
RUN adduser --badname minecraft

# Setup latest Paper
WORKDIR /var/minecraft
RUN mkdir -p /var/minecraft

# Download binaries
RUN curl -o spigot.jar https://api.papermc.io/v2/projects/paper/versions/${PAPER_MC_VERSION}/builds/${PAPER_BUILD_VERSION}/downloads/paper-${PAPER_MC_VERSION}-${PAPER_BUILD_VERSION}.jar

# Copy plugins 
COPY plugins /var/minecraft/plugins

# Set permissions
RUN chown -R minecraft:minecraft /var/minecraft

# Accept EULA
RUN echo "eula=true" >> eula.txt

# Run Minecraft server
USER minecraft
EXPOSE 25565
EXPOSE 25575
EXPOSE 19132
EXPOSE 8123
CMD [ "/bin/bash", "-c", "java -Xms8G -Xmx8G -jar spigot.jar --nogui" ]
