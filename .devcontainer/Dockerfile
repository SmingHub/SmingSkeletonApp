FROM ubuntu

# ------------------------------------------------------------------------------
# Pre-requisites
# ------------------------------------------------------------------------------

RUN apt-get -y update \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    git \
    sudo \
    tzdata \
    python3 \
    python3-pip \
    wget

# ------------------------------------------------------------------------------
# Fetch Sming and install tools
# ------------------------------------------------------------------------------

ARG SMING_REPO=https://github.com/SmingHub/Sming
ARG SMING_BRANCH=develop
ARG INSTALL_ARGS=all
ARG CONTAINER_USER=gitpod

# Set user
RUN mkdir -p /opt && \
    adduser --disabled-password --gecos "" ${CONTAINER_USER} && \
    echo "${CONTAINER_USER}     ALL=(ALL) NOPASSWD:ALL" >>  /etc/sudoers && \
    chown ${CONTAINER_USER} /opt/
USER ${CONTAINER_USER}
WORKDIR /home/${CONTAINER_USER}

# Install development software
RUN git clone $SMING_REPO -b $SMING_BRANCH /opt/sming && \
    /opt/sming/Tools/install.sh $INSTALL_ARGS && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Download Tools
RUN mkdir /home/${CONTAINER_USER}/tools && \
    curl -L https://github.com/bjoernQ/esp-web-flash-server/releases/latest/download/web-flash-x86_64-unknown-linux-gnu.zip \
    -o /tmp/web-flash.zip \
    && unzip /tmp/web-flash.zip \
    -d /home/${CONTAINER_USER}/tools/ && \
    chmod u+x /home/${CONTAINER_USER}/tools/web-flash && \
    rm /tmp/web-flash.zip && \
    curl -L https://github.com/MabezDev/wokwi-server/releases/latest/download/wokwi-server-x86_64-unknown-linux-gnu.zip \
    -o /tmp/wokwi-server.zip \
    && unzip /tmp/wokwi-server.zip \
    -d /home/${CONTAINER_USER}/tools/ && \
    chmod u+x /home/${CONTAINER_USER}/tools/wokwi-server && \
    rm /tmp/wokwi-server.zip
    
ENV PATH="${PATH}:/home/${CONTAINER_USER}/.local/bin:/home/${CONTAINER_USER}/tools"   
COPY tools/flash.sh /home/${CONTAINER_USER}/tools/flash.sh
COPY tools/run-wokwi.sh /home/${CONTAINER_USER}/tools/run-wokwi.sh
    
RUN echo ". /opt/sming/Tools/export.sh" >> ~/.bashrc
