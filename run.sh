wget https://d2qguwbxlx1sbt.cloudfront.net/TextInMotion-VideoSample-1080p.mp4
ffmpeg -y -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i TextInMotion-VideoSample-1080p.mp4 -c:a copy -c:v h264_nvenc -b:v 5M output.mp4
