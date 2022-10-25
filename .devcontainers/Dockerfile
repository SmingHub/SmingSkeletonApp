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
ARG CONTAINER_USER=developer

# Install development software
RUN git clone $SMING_REPO -b $SMING_BRANCH /opt/sming
RUN /opt/sming/Tools/install.sh $INSTALL_ARGS
RUN apt-get clean

# Set users
RUN adduser --disabled-password --gecos "" ${CONTAINER_USER}
USER ${CONTAINER_USER}
WORKDIR /home/${CONTAINER_USER}

RUN echo ". /opt/sming/Tools/export.sh" >> ~/.bashrc
