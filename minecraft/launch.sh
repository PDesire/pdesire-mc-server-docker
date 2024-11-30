#!/bin/bash

export PAPER_MC_VERSION="1.21.1"
export PAPER_BUILD_VERSION=131

cd /var/minecraft/server

curl -o spigot.jar https://api.papermc.io/v2/projects/paper/versions/${PAPER_MC_VERSION}/builds/${PAPER_BUILD_VERSION}/downloads/paper-${PAPER_MC_VERSION}-${PAPER_BUILD_VERSION}.jar

echo "eula=true" >> eula.txt

java -Xms8G -Xmx8G -jar spigot.jar --nogui