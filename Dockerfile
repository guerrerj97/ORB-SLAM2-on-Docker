FROM ubuntu:18.04

ENV TZ="America"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    libavcodec-dev \
    libavdevice-dev \
    libavformat-dev \
    libavutil-dev \
    libeigen3-dev \
    libglew-dev \
    libgl1-mesa-glx \
    libpython2.7-dev \
    libpcl-dev \
    libswscale-dev \
    mesa-utils \
    wget \
    xorg-dev \
    libgtk2.0-dev \
    libgtkglext1-dev \
    libjpeg-dev \
    libpng-dev \
    pkg-config \
    --reinstall ca-certificates

# Install X11 server (Xvfb)
RUN apt-get install -y --no-install-recommends xvfb

# Install X11 client libraries
RUN apt-get install -y --no-install-recommends libx11-dev libxext-dev libx11-xcb-dev libxcb-glx0-dev

# Download and build OpenCV
RUN git clone https://github.com/opencv/opencv.git && \
    cd opencv && \
#    git checkout 3.2.0 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc) && \
    make install

# Download and build Pangolin
RUN git clone https://github.com/stevenlovegrove/Pangolin.git && \
    cd Pangolin && \
    git checkout v0.5 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j$(nproc) && \
    make install

# Download and build ORB-SLAM2-Example
RUN git clone https://github.com/EricLYang/ORB-SLAM2-Example.git && \
    cd ORB-SLAM2-Example && \
    chmod +x build.sh && \
    ./build.sh

RUN wget https://www.dropbox.com/s/vy8hrolf9xgn914/2019-04-23-23-34-38.tar.gz?dl=0 && \
    tar -zxvf 2019-04-23-23-34-38.tar.gz\?dl\=0

RUN apt-get install -y --no-install-recommends x11-apps
RUN apt-get install -y --no-install-recommends libgl1-mesa-dri

# Copy the entrypoint script
COPY entrypoint.sh /

# Set the entrypoint script as executable
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
