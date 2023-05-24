# ORB-SLAM2-on-Docker
Docker version of the ORB-SLAM2 project

## Build Instructions
1. docker build -t orb_slam_image .       
2. docker run -it --rm --net=host --privileged \                  
    -e DISPLAY=host.docker.internal:0 \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    orb_slam_image

This implementation is derived from the following repo: https://github.com/EricLYang/ORB-SLAM2-Example
