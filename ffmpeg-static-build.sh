#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TEMP_DIR=$(mktemp -d)
echo $TEMP_DIR

(cd $TEMP_DIR; \
  wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz; \
  tar -zxf ffmpeg-release-amd64-static.tar.xz; \
  rm *.xz; \
  export FFMPEG_RELEASE=$(ls -1); \
  cd ffmpeg*; \
  zip -r ../$FFMPEG_RELEASE.zip *; \
  cp $TEMP_DIR/$FFMPEG_RELEASE.zip $SCRIPT_DIR/$FFMPEG_RELEASE.zip)
