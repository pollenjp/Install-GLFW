#include <iostream>
#include <GLFW/glfw3.h>
 
int main(int argc, char** argv)
{
  // [GLFW: Initialization, version and error reference](https://www.glfw.org/docs/latest/group__init.html)
  if (glfwInit() == GL_FALSE){
    // 初期化に失敗した処理
    std::cerr << "Can't initialize GLFW" << std::endl;
    return 1;
  }
  std::cout << "GLFW version     : " << glfwGetVersionString() << std::endl;
  std::cout << "Major version    : " << GLFW_VERSION_MAJOR     << std::endl;
  std::cout << "Minor version    : " << GLFW_VERSION_MINOR     << std::endl;
  std::cout << "Subminor version : " << GLFW_VERSION_REVISION  << std::endl;
  return 0;
}
