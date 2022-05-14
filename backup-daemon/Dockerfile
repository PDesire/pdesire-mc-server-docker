FROM alpine:latest

# Setup container
RUN mkdir /var/backup-daemon/
WORKDIR /var/backup-daemon
RUN apk add build-base git coreutils

# Build mcrcon
RUN git clone https://github.com/Tiiffi/mcrcon.git
WORKDIR /var/backup-daemon/mcrcon
RUN gcc -std=gnu11 -pedantic -Wall -Wextra -O2 -s -o mcrcon mcrcon.c
WORKDIR /var/backup-daemon
RUN mv mcrcon/mcrcon mcrcon-bin
RUN chmod +x mcrcon-bin

# Setup daemon
COPY backup.sh /var/backup-daemon/
RUN chmod +x backup.sh
RUN echo '0  0  *  *  *   /var/backup-daemon/backup.sh' > /etc/crontabs/root

CMD ["crond", "-f"]