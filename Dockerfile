# # this is for windows 11 you need to install docker desktop on windows first and  (WSL2 must be enabled)
# # 
# # make a file named "Dockerfile" in visual studio code V0.2025.2.28 not yet working corectley but a window!
# # then past all this text inside of it
# #
# # WARNING THIS IS A LEARNING FILE FOR MAKING VISUAL STUDIO CODE INSSIDE OF A DOCKER CONTAINER
# # WARNING I ADD SUDO !!!!!!!

# Use the official Ubuntu as the base image
FROM ubuntu:22.04

# Set environment variables to avoid any prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    # sudo: Command to allow users to run commands with elevated (root) privileges
    sudo \
    #
    npm \
    #Command-line tool for downloading files
    curl \
    #Version control system (for managing your code)
    git \
    # Installs g++, gcc, make, and other essential build tools
    build-essential \
    # C++ compiler
    g++ \
    # cmake Build system for managing complex builds
    cmake \
    # OpenGL development libraries (useful for graphics)
    libgl1-mesa-dev \
    # OpenGL Utility Library
    libglu1-mesa-dev \
    #OpenGL Utility Toolkit (needed for some graphical apps)
    freeglut3-dev \
    # Python 3 installation
    python3 \
    #  Python package installer
    python3-pip \
    # Python development headers
    python3-dev \
    # Python virtual environment support
    python3-venv \
      # qtbase5-dev: Core development libraries for Qt 5 (needed for building Qt applications)
      qtbase5-dev \
      # qtbase5-dev-tools: Additional Qt development tools for building and working with Qt projects
      qtbase5-dev-tools \
      # qtchooser: Tool for selecting which Qt version to use (useful if you have multiple Qt versions installed)
      qtchooser \
      # qt5-qmake: A build tool for Qt projects (used to generate makefiles for compiling Qt applications)
      qt5-qmake \
      # libqt5widgets5: A Qt library that provides widgets for building GUI applications
      libqt5widgets5 \
      # x11-xserver-utils: Utilities for working with the X11 display server (required for running graphical apps in Docker)
      x11-xserver-utils \
      # libxcb-xinerama0: A library needed to manage windows in X11 (for running graphical applications inside Docker)
      libxcb-xinerama0 \
    # Clean up to reduce image size
    && rm -rf /var/lib/apt/lists/*

# Install Visual Studio Code Server (code-server)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Ensure code-server is installed and added to the PATH
RUN echo $PATH
RUN which code-server
RUN code-server --version

# Expose port for VS Code (default 8080)
EXPOSE 8080

# Create a non-root user and set the working directory
RUN useradd -m vscode-user
USER vscode-user
WORKDIR /home/vscode-user/workspace

# Start VS Code Server with password authentication
ENTRYPOINT ["code-server", "--host", "0.0.0.0", "--auth", "password"]

# # #
# # #
# # # run the folowing comands in visual studio code terminal
# # #
# # # first you must build a image
# # # docker build -t image-name-abc .

# # #
# # # you can list all the images by
# # # docker images
# # #

# # #
# # # then if it is sucseful build you can run a container based on that image file
# # # docker run -p 1111:8080 -v ".:/workspace" --name container-name-xyz -d image-name-abc
# # # then if it is sucseful build you can run a container based on that image file with pasword
# # # docker run -p 1111:8080 -v ".:/workspace" --name container-name-xyz -d -e PASSWORD=123456 image-name-abc

# # #
# # # show runing containers
# # # docker ps -a
