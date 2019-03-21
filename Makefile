SHELL := /bin/bash

#===============================================================================
GLFW_VERSION := 3.2.1
# "static" or "shared"
GLFW_LIB := static

#===============================================================================
INC :=
LDLIBS  :=
OBJECTS := $(patsubst %.cpp,%.o,$(wildcard *.cpp))
TARGET := main

#===============================================================================
PKG_CONFIG_PATH := ${HOME}/.glfw/install/GLFW-${GLFW_VERSION}/lib/pkgconfig
#=======================================
# v3.*
ifneq ($(shell echo ${GLFW_VERSION} | grep -E "3\.[0-9]+\.[0-9]+"), )
INC += `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --cflags glfw3`
# Select `static` or 'shared' OPENCV LIB 
# --static : static library (.a)
ifeq (${GLFW_LIB}, shared)
LDLIBS += `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --libs glfw3`
else ifeq (${GLFW_LIB}, static)
LDLIBS += `PKG_CONFIG_PATH=${PKG_CONFIG_PATH} pkg-config --static --libs glfw3`
else
ERROR_MESSAGE := 'GLFW_LIB' variable should be 'static' or 'shared'.
$(error "${ERROR_MESSAGE}")
endif
#=======================================
# Others
else
ERROR_MESSAGE := 'GLFW_VERSION' variable (${GLFW_VERSION}) is not supported.
$(error "${ERROR_MESSAGE}")
endif

#===============================================================================
CXX := g++
CXXFLAGS = -g -Wall -std=c++11
LINK.cc := $(CXX) $(CXXFLAGS) $(CPPFLAGS) ${LDFLAGS} $(TARGET_ARCH)
export

#===============================================================================
.DEFAULT_GOAL := run

.PHONY : debug
debug:
	echo ${INC}
	echo ${LDLIBS}

.PHONY : run
run :  # 要件チェック
	${MAKE} ${TARGET}
	./${TARGET}

.PHONY : preprocess
preprocess :
# [Bash - adding color - NoskeWiki printf zsh](http://www.andrewnoske.com/wiki/Bash_-_adding_color)
ifndef GLFW_VERSION
	@printf "\e[101m Variable GLFW_VERSION does not set. \e[0m \n"
	@${MAKE} error ERROR_MESSAGE="GLFW_VERSION"
endif

.PHONY : error
error :  ## errors処理を外部に記述することで好きなエラーメッセージをprintfで記述可能.
	$(error "${ERROR_MESSAGE}")

#===============================================================================
%.o : %.cpp
	@$(MAKE) preprocess
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ ${INC} ${LDLIBS} -c -o $@

${TARGET} : ${OBJECTS}
	@$(MAKE) preprocess
	$(LINK.cc) $(TARGET_ARCH) $^ ${LDLIBS} -o $@

#===============================================================================
.PHONY : clean
clean :
	-${RM} ${TARGET} ${OBJECTS} *~ .*~ core

#===============================================================================
.PHONY : install-glfw
install-glfw :
	@$(MAKE) preprocess
	GLFW_VERSION=${GLFW_VERSION} ./install-glfw.bash.sh


