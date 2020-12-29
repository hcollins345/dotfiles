configs
=======

Config files for vim, tmux, bash alongside startup scripts for
installations, symbolic links etc

### Setup

Repo should be cloned into $HOME

#### startup.sh

To be run with sudo after new OS installation. Installs Rmarkdown with
tinytex, Anaconda etc.

#### sync.sh

Creates symbolic links for each of the config files.

### Installation

1. set up keyboard mappings (details in startup.sh)
2. sudo apt install git 
3. add ssh keys [tutorial](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
4. chmod 600 ~/.ssh/id_rsa
5. git clone dotfiles
6. bash sync.sh
7. sudo bash startup.sh
8. bash startup_part_2.sh
9. :PluginInstall in .vimrc
10. Compile YCM (run install.py in the YCM directory)
11. in usr/share/vim/vim80/syntax/tex.vim find the TexNewMathZone parts and add 
      call TexNewMathZone("E","align",1)
12. 
13. 

#### Vim install (if not using startup.sh)
```
bash sync.sh 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
:PluginInstall #in vim
source ~/.bashrc
```

### TODO

- [x] Run :PluginInstall from commandline
- [ ] Insert backticks in tmux https://gist.github.com/JikkuJose/7509315
            (mod so 3 backticks will insert one backtick)

## Windows 

1. Install git https://git-scm.com/download/win
2. git clone git@github.com:hcollins345/dotfiles.git
3. Update ssh key - 
 a. ssh-keygen -t ed25519 -C "hcollins345@gmail.com" - try replacing email with hcollins345 instead
 b. git config --global user.email "hcollins345@gmail.com" - try replacing with git config --global user.name "hcollins345"
 c. clip < ~/.ssh/id_ed25519.pub
 d. add to https://github.com/settings/ssh/new
4. 

### YCM 
1. Need 64 bit vim - https://github.com/vim/vim-win32-installer/releases
2. Need python installed (prefarably 3) - https://www.anaconda.com/products/individual (scroll to bottom of page)


### Vim -- youcompleteme
You need to install python  
You need to install cake  
https://cmake.org/download/  
I also needed to select Visual C++ build tools in Workloads in Visual Studio.  
Then compile YCM (run install.py in the YCM directory)

## POWER MANAGEMENT (Linux)

Details here
https://itsfoss.com/reduce-overheating-laptops-linux/

#### tlp
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
**If you are using ThinkPads, you require an additional step:**
sudo apt-get install tp-smapi-dkms acpi-call-dkms

#### thermald

sudo apt-get install thermald

#### CPUfreq

sudo apt-get install indicator-cpufreq

## Monitor overlay
https://www.msi.com/Landing/afterburner

Msi afterburner auto installs RTSS (used for the overlays)

https://pcgamehaven.com/easily-monitor-cpu-gpu-usage-gaming/





