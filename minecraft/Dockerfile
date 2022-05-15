FROM fedora:latest

# Setup container
RUN dnf update -y
RUN dnf install wget -y 

# Setup Minecraft User
RUN useradd -m -d /var/minecraft minecraft

# Setup GraalVM
RUN mkdir /var/graalvm
WORKDIR /var/graalvm
RUN wget https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.1.0/graalvm-ce-java17-linux-amd64-22.1.0.tar.gz
RUN tar -xvzf graalvm-ce-java17-linux-amd64-22.1.0.tar.gz
RUN chown -R minecraft:minecraft graalvm-ce-java17-22.1.0/ 

# Run Minecraft server
USER minecraft
WORKDIR /var/minecraft/server
EXPOSE 25565
EXPOSE 25575
EXPOSE 19132
EXPOSE 8123
CMD [ "/var/graalvm/graalvm-ce-java17-22.1.0/bin/java", "-Xms8G", "-Xmx8G", "-jar", "spigot.jar", "--nogui" ]
