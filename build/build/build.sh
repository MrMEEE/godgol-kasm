#!/bin/bash
apt update
apt -y install automake gcc g++ make libncurses-dev nasm libsdl-net1.2-dev libsdl2-net-dev libpcap-dev libslirp-dev fluidsynth libfluidsynth-dev libavdevice58 libavformat-dev libavcodec-dev libavcodec-extra libavcodec-extra58 libswscale-dev libfreetype-dev libxkbfile-dev libxrandr-dev && cd /src && ./build-debug-sdl2
