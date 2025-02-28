# 
# make a file named "Dockerfile" in visual studio code V0.2025.2.28 not yet working corectley but a window!
# then past all this text inside of it
#
# WARNING THIS IS A LEARNING FILE FOR MAKING VISUAL STUDIO CODE INSSIDE OF A DOCKER CONTAINER
# WARNING I ADD SUDO !!!!!!!
# Use the official Ubuntu as the base image
FROM ubuntu:22.04

# Install necessary dependencies
# RUN apt-get update && apt-get install -y \
#     curl \
#     ca-certificates \
#     git \
#     libx11-dev \
#     libxkbfile-dev \
#     libsecret-1-0 \
#     gpg \
#     && rm -rf /var/lib/apt/lists/*



RUN apt-get update && apt-get install -y \
    sudo \
    build-essential \
    g++ \
    cmake \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install Visual Studio Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh


# Expose port for VS Code (default 8080)
EXPOSE 8080

# Create a non-root user and set the working directory
RUN useradd -m vscode-user
USER vscode-user
WORKDIR /home/vscode-user/workspace

# Start VS Code Server no pasword requerd
#ENTRYPOINT ["code-server", "--host", "0.0.0.0", "--auth", "none"]
# Start VS Code Server with pasword ( the pasword is set below in the dock run comand!!!)
ENTRYPOINT ["code-server", "--host", "0.0.0.0", "--auth", "password"]
# # run the folowing comands in visual studio code terminal
# #
# # first you must build a image
# # docker build -t image-name-abc .

# #
# # you can list all the images by
# # docker images
# #

# #
# # then if it is sucseful build you can run a container based on that image file
# # docker run -p 1111:8080 -v ".:/workspace" --name container-name-xyz -d image-name-abc
# # then if it is sucseful build you can run a container based on that image file with pasword
# # docker run -p 1111:8080 -v ".:/workspace" --name container-name-xyz -d -e PASSWORD=123456 image-name-abc

# #
# # show runing containers
# # docker ps -a

# #
# # show runing containers
# # docker ps -a
