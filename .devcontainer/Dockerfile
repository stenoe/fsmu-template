FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install TeX Live (full distribution) + essential dev tools + fonts
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-full \
    texlive-bibtex-extra \
    biber \
    fonts-noto-color-emoji \
    fonts-noto-cjk \
    fonts-freefont-ttf \
    fonts-dejavu-core \
    fonts-lmodern \
    fonts-liberation \
    fonts-roboto \
    fonts-hack-ttf \
    fonts-dejavu \
    fonts-texgyre \
    git \
    curl \
    wget \
    build-essential \
    vim \
    nano \
    && fc-cache -f -v \
    && luaotfload-tool --force --update \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Fix LuaLaTeX locale requirement
# RUN apt-get update && apt-get install -y locales && \
#    sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
#    locale-gen &&
    
# Create a dedicated user (matches VS Code's expected UID/GID)
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000

RUN groupadd --gid $USER_GID $USERNAME && \
    useradd --uid $USER_UID --gid $USER_GID -m -s /bin/bash $USERNAME && \
    echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Set working directory
WORKDIR /workspace

# Fix LuaLaTeX locale requirement
RUN apt-get update && apt-get install -y locales && \
    sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

USER $USERNAME

