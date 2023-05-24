#!/bin/bash

# Start Xvfb
Xvfb :0 -screen 0 1024x768x24 &

export DISPLAY=:0

# Run your ORB-SLAM2-Example command here
cd ORB-SLAM2-Example
# Replace the following line with your actual command to run ORB-SLAM2-Example
./RGBD_excutable/rgbd_tum Vocabulary/ORBvoc.bin Setting/SETTING.yaml / /2019-04-23-23-34-38/2019-04-23-23-34-38.txt / false

# Keep the container running
# tail -f /dev/null
