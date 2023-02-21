FROM amazonlinux:2 AS base


ARG GAME_ID=222860
ARG INSTALL_DIR="l4d2"
ARG DEFAULT_MAP="c2m1_highway"

ADD enviroment.sh .
RUN ./enviroment.sh

WORKDIR /home/l4d2
USER l4d2

FROM base AS game

EXPOSE 27015/tcp
EXPOSE 27015/udp

ENV MAP=$DEFAULT_MAP \
    PORT=27015 \
    HOSTNAME="Zsir Docker Server" \
    REGION=4 \
    GAME_ID=$GAME_ID \
    INSTALL_DIR=$INSTALL_DIR \

ADD entrypoint.sh entrypoint.sh
ENTRYPOINT ./entrypoint.sh
