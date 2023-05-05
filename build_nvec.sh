#!/bin/bash
# Automatically compile and install FFMPEG with NVIDIA hardware acceleration on Debian
# Based on https://www.tal.org/tutorials/ffmpeg_nvidia_encode
# Verified working on Debian 10 and 11

# Abort on error
set -e

suite=stable

apt-get build-dep ffmpeg -t $suite
apt-get install nvidia-cuda-toolkit -t $suite
mkdir -p ffmpeg-deb/src
cd ffmpeg-deb
if [[ -d nv-codec-headers ]]
then
  cd nv-codec-headers
  git fetch --tags
else
  git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
  cd nv-codec-headers
fi
# Checkout latest release, intead of HEAD. The Debian driver in stable may not yet support the pre-release API.
git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
make
make install
cd ../src
rm -rf ./*
apt-get source ffmpeg -t $suite
cd ffmpeg-*
sed -i 's/--enable-sdl2/--enable-sdl2 --enable-cuda --enable-nvenc/' debian/rules
DEB_BUILD_OPTIONS="nocheck nodoc notest" dpkg-buildpackage -r -nc -j4 --no-sign
cd ..
# Install all built packages, except the non-extra variants of libavfilter and libavcodec
dpkg -i $(ls *.deb | grep -Ev "(libavfilter|libavcodec)[0-9]+_")
echo "Verification:"
ffmpeg -codecs 2> /dev/null | grep nvenc
