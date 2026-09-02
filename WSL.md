# WSL Configurations (WIP)

Basic configuration for WSL/Linux environment. I use this just to have some reference to start fresh

## WSL Fedora

#### For WSL version before 2.4.4 (<2.4.4) ([Docs](https://docs.fedoraproject.org/en-US/cloud/wsl/#_installing_fedora_in_wsl))

- Go through the releases here https://ftp.uni-stuttgart.de/fedora/releases/ or here https://koji.fedoraproject.org/koji/packageinfo?packageID=41688
- Select the 42 (right now is the only one with .tar file)
- I can follow this [guide](https://www.linuxfordevices.com/tutorials/linux/install-fedora-on-windows)
- In powershell run `wsl --import Fedora \installation\folder \fedora.tar`

#### For WSL version after 2.4.4 (>2.4.4)

- Check for the version here https://koji.fedoraproject.org/koji/packageinfo?packageID=41688
- It should be like this `wsl --install --from-file .\Fedora-WSL-Base-43-1.6.x86_64.wsl`

## Customization

### Oh My Posh

Pretty themes for the terminal (Should be enough to only run the script)

- Install `curl -s https://ohmyposh.dev/install.sh | bash -s`
- Run `oh-my-posh font install meslo` (for the themes to work correctly)
- I like this [theme](https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/tokyonight_storm.omp.json). Create the following path `~/.config/oh-my-posh-themes/`
- Run `sh theme-setup.sh` and then `source ~/.bashrc`

## Development

List of basic things that I need

- git (`sudo dnf install git`)

### C++

Some things are already present in the OS (ex: gcc)

- clang (`sudo dnf install clang`)
- cmake (`sudo dnf install cmake`)
- gcc c++ (`sudo dnf install gcc-c++`) - if not already present in Fedora


### OpenGl

- `sudo dnf install mesa-libGL-devel mesa-libGLU-devel freeglut-devel glfw-devel glm-devel`
- mesa-utils to confirm correct installation `sudo dnf install mesa-demos`
- Check the version `glxinfo | grep "OpenGL version"` or `glxinfo -B` or `eglinfo -B` (needs to install glxinfo, which comes from mesa drivers)
- Windowing library, the internet says this one is the one, GLFW `sudo dnf install glfw-devel`
- Also I need this GLAD. I've followed this guide https://linuxvox.com/blog/install-opengl-linux/
  - Go to https://gen.glad.sh/ or to this [permalink](https://tinyurl.com/y33yx3tc) to skip the rest of the steps
  - Select the C generator and gl as the API.
  - Choose OpenGL 3.3 (or your target version) and the Core profile.
  - Leave the built-in loader option disabled because GLFW supplies glfwGetProcAddress.
  - Generate and extract the archive. The files used below are include/glad/gl.h, include/KHR/khrplatform.h, and src/gl.c.
  - Add gl.c to your build and include the generated include/ directory in your compiler's header search path.
