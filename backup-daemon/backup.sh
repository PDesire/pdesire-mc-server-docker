#!/bin/bash

# thanks to NotMilitaryAI on reddit: https://www.reddit.com/r/admincraft/comments/qgeo2b/comment/hi6i3ie/?utm_source=share&utm_medium=web2x&context=3

function rcon {
    /var/backup-daemon/mcrcon-bin -H 127.0.0.1 -P 25575 -p $MINECRAFT_MCRCON_PASSWORD "$1"
}


rcon 'say [§4WARNING§r] Server backup process will begin in 5 minutes.'
sleep 5m

rcon 'say [§4WARNING§r] Server backup process is starting NOW.'

rcon "save-off"
rcon "save-all"
tar -cvpzf /var/backup-daemon/backup/server-$(date +%F_%R).tar.gz /var/backup-daemon/server
rcon "save-on"

rcon 'say [§bNOTICE§r] Server backup process is complete. Carry on.'


## Delete older backups
find /var/backup-daemon/backup -type f -mtime +7 -name 'server-*.tar.gz' -delete