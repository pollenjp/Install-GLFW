#!/bin/bash -eux
#GLFW_VERSION=3.2.1
GLFW_DIR="${HOME}/.glfw"
CMAKE_INSTALL_PREFIX=${GLFW_DIR}/install/GLFW-${GLFW_VERSION}
# current working directory
CWD=$(pwd)

# [glfw/glfw: A multi-platform library for OpenGL, OpenGL ES, Vulkan, window and input](https://github.com/glfw/glfw)
# [Dependencies for Linux and X11](https://www.glfw.org/docs/latest/compile.html#compile_deps_x11)
# [Generating build files with CMake](https://www.glfw.org/docs/latest/compile.html#compile_generate)
# [Shared CMake options](https://www.glfw.org/docs/latest/compile.html#compile_options_shared)

#=======================================
# Dependencies
# [Dependencies for Linux and X11](https://www.glfw.org/docs/latest/compile.html#compile_deps_x11)
sudo apt update -y
sudo apt install -y xorg-dev

if [ ! -d "${GLFW_DIR}" ] && [ ! -L "${GLFW_DIR}" ]; then
  # if symbolic link file or directory does not exist
  mkdir ${GLFW_DIR}
fi
cd ${GLFW_DIR}

#=======================================
# > [glfw/glfw: A multi-platform library for OpenGL, OpenGL ES, Vulkan, window and input](https://github.com/glfw/glfw)
# > See the downloads page for details and files, or fetch the `latest` branch, which always points to the latest stable release
if [ ! -d "${GLFW_DIR}/glfw" ]; then
  git clone https://github.com/glfw/glfw.git
fi

cd "${GLFW_DIR}/glfw"
git checkout ${GLFW_VERSION}
cd ..
 
#=======================================
# [Generating build files with CMake](https://www.glfw.org/docs/latest/compile.html#compile_generate)
# [Shared CMake options](https://www.glfw.org/docs/latest/compile.html#compile_options_shared)
cd "${GLFW_DIR}/glfw"
directory1="${GLFW_DIR}/glfw/build"
if [ -d "${directory1}" ]; then
  rm -rf ${directory1}
  mkdir ${directory1}
fi
if [ ! -d "${directory1}" ] && [ ! -L "${directory1}" ]; then
  mkdir ${directory1}
fi
cd ${directory1}
cmake \
      -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} \
      -D GLFW_BUILD_EXAMPLES=ON \
      -D GLFW_BUILD_TESTS=ON \
      -D GLFW_BUILD_DOCS=ON \
      ..
      #-D BUILD_SHARED_LIBS=ON \
      #-D BUILD_SHARED_LIBS=ON \
      #-D GLFW_VULKAN_STATIC=ON \
make -j4
if [ -d "${CMAKE_INSTALL_PREFIX}" ]; then
  rm -rf ${CMAKE_INSTALL_PREFIX}
fi
make install

#=======================================
#  Back to working directory
cd ${CWD}

