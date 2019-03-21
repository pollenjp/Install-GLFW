SHELL := /bin/bash

GLFW_VERSION := 3.2.1
ERROR_MESSAGE :=

CXX := g++
CXXFLAGS = -g -Wall -std=c++11
INC := ${HOME}/.glfw/install/GLFW-${GLFW_VERSION}/include
INC := $(addprefix -I,${INC})
LDLIBS1 := ${HOME}/.glfw/install/GLFW-${GLFW_VERSION}/lib
LDLIBS2 := glfw3 dl X11 Xxf86vm Xinerama Xrandr Xcursor Xi pthread
LDLIBS  := $(addprefix -L,${LDLIBS1}) $(addprefix -l,${LDLIBS2})
LINK.cc := $(CXX) $(CXXFLAGS) $(CPPFLAGS) ${LDFLAGS} $(TARGET_ARCH)

OBJECTS = $(patsubst %.cpp,%.o,$(wildcard *.cpp))
TARGET := check_version
export

.DEFAULT_GOAL := run

#===============================================================================
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
${TARGET} : ${OBJECTS}

%.o : %.cpp
	@$(MAKE) preprocess
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) $^ ${INC} ${LDLIBS} -c -o $@
% : %.o
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


