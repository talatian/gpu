export LD_LIBRARY_PATH=/usr/local/lib:/usr/local/lib64/:/usr/local/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH

wget https://d2qguwbxlx1sbt.cloudfront.net/TextInMotion-VideoSample-1080p.mp4

ffmpeg -y -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i TextInMotion-VideoSample-1080p.mp4 -c:a copy -c:v h264_nvenc -b:v 5M output.mp4
