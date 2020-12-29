Configs
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
11. in usr/share/vim/vim80/syntax/tex.vim find the TexNewMathZone parts and add 
      call TexNewMathZone("E","align",1)

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
2. ```git clone git@github.com:hcollins345/dotfiles.git```
3. Update ssh key 
      ```
    ssh-keygen -t ed25519 -C "hcollins345@gmail.com" # try replacing email with hcollins345 instead
    git config --global user.email "hcollins345@gmail.com" # try replacing with git config --global user.name "hcollins345"
    clip < ~/.ssh/id_ed25519.pub
      ```
    1. Paste clipboard into https://github.com/settings/ssh/new

### Python3
https://www.anaconda.com/products/individual (scroll to bottom of page)

### Download 64bit Vim
1. 64 bit vim - https://github.com/vim/vim-win32-installer/releases
    1. Add to .bashrc 
    ```
        alias vim="vim.bat"  
        alias gvim="gvim.bat"  
    ```
    2. In git bash
    ```
        bash ~/dotfiles/sync.sh  
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        vim +PluginInstall +qall
    ```

### YCM - needs 64 bit vim and python3
1. cake - https://cmake.org/download/
2. Visual Studio Build Tools - https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16  
        * Select Visual C++ build tools in Workloads in Visual Studio (was selected by default).  
            ![Visual studio workload screenshot](https://github.com/hcollins345/random/blob/master/visual_studio_build_tools.png)
3. Compile YCM - ```python .vim/bundle/YouCompleteMe/install.py```
4. Add Environment variable ```PYTHONPATH``` with value (update path names first), ```C:\Users\<name>\Anaconda3\Lib;C:\Users\<name>\Anaconda3\libs;C:\Users#<name>\Anaconda3\Lib\site-packages;C:\Users\<name>\Anaconda3\DLLs```

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

## Windows Monitor Overlay
https://www.msi.com/Landing/afterburner

Msi afterburner auto installs RTSS (used for the overlays)

https://pcgamehaven.com/easily-monitor-cpu-gpu-usage-gaming/





