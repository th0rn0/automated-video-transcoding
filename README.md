# Automated Video Transcoding for Docker

Forked & Heavily inspired From https://github.com/ntodd/video_transcoding_docker

Docker image for Automated Video Encoding that will periodically scan a directory for new video files, transcode them and output them to a new directory significantly decreasing the file size without noticable loss of quality.

## Prerequisites

You must be running [Docker for Mac](https://docs.docker.com/engine/installation/mac/), [Docker for Linux](https://docs.docker.com/engine/installation/linux/), or [Docker for Windows](https://docs.docker.com/engine/installation/windows/).

## Usage

```
docker run -it -v /path/to/input:/input -v /path/to/output th0rn0/automated-video-transcoding
```

The docker image will periodically scan the input directory, convert any compatible video files and then output both the original and the new transcoded file in the output directory.

For best results on Docker for Mac or Windows, set your CPU count in preferences to the maximum available for your machine.

## Notes

File names cannot have spaces

To update to the latest version:

```
docker pull th0rn0/automated-video-transcoding:latest
```
## Todo

- Add Arguments