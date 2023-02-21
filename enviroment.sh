#!/bin/bash
# install enviroment
yum -y install curl wget \
  tar bzip2 gzip unzip \
  python3 binutils bc jq tmux \
  glibc.i686 libstdc++ libstdc++.i686 \
  shadow-utils util-linux file nmap-ncat iproute \
  SDL2.i686 SDL2.x86_64

yum -y update --security

# create user
useradd l4d2


# Install steamcmd
wget https://media.steampowered.com/installer/steamcmd_linux.tar.gz && tar -xzf steamcmd_linux.tar.gz \
    && rm steamcmd_linux.tar.gz && ./steamcmd.sh +quit

# Symlink steamclient.so
mkdir -p .steam/sdk32/ && ln -s ~/linux32/steamclient.so ~/.steam/sdk32/steamclient.so \
    && mkdir -p .steam/sdk64/ && ln -s ~/linux64/steamclient.so ~/.steam/sdk64/steamclient.so

# Install game
./steamcmd.sh +force_install_dir "./${INSTALL_DIR}" +login anonymous +app_update "${GAME_ID}" +quit
