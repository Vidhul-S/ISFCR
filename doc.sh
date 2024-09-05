#!bin/bash
xhost +local:root
sudo docker run -it --runtime nvidia \
  --name UWD \
  --device /dev/video0 \
  --device /dev/nvhost-ctrl \
  --device /dev/nvhost-ctrl-gpu \
  --device /dev/nvhost-prof-gpu \
  --device /dev/nvmap \
  --device /dev/nvhost-gpu \
  --device /dev/nvhost-vic \
  --device /dev/nvhost-nvdec \
  --device /dev/nvhost-msenc \
  --device /dev/nvhost-isp \
  --device /dev/nvhost-vi \
  --volume "/tmp/argus_socket:/tmp/argus_socket" \
  --volome "/home/intern/UWD/models:/ultralytics/models" \
  --net="host" \
  --env="DISPLAY" \
  --env="QT_X11_NO_MITSHM=1" \
  --volume="/tmp/.X11-unix:/tmp/.X11unix:rw" \
  --privileged \
  ultralytics/ultralytics:latest-jetson-jetpack4 \

