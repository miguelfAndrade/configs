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
