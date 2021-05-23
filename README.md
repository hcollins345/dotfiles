Configs
=====================================================

Config files for vim, tmux, bash alongside startup scripts for
installations, symbolic links etc

Repo should be cloned into $HOME

Linux
-----------------------------------------------------

#### startup.sh
To be run after sudo after new OS installation. Installs Rmarkdown with
tinytex, Anaconda etc.

#### sync.sh
Creates symbolic links for each of the config files.

### Installation

1. set up keyboard mappings (details in startup.sh)
2. sudo apt install git 
3. Update ssh key [tutorial](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
    ```bash
    sudo apt install xclip
    cat /dev/zero | ssh-keygen -t ed25519 -C "hcollins345@gmail.com"
    git config --global user.email "hcollins345@gmail.com"
    git config --global user.name "hcollins345" 
    sudo apt install xclip
    xclip < ~/.ssh/id_ed25519.pub
    ```
    1. Paste clipboard into https://github.com/settings/ssh/new
4. git clone dotfiles
    ```bash
    git clone git@github.com:hcollins345/dotfiles.git
    ```
5. bash sync.sh
6. sudo bash startup.sh
7. bash startup_part_2.sh
8. in usr/share/vim/vim80/syntax/tex.vim find the TexNewMathZone parts and add 
      call TexNewMathZone("E","align",1)

#### Vim install (if not using startup.sh)
```bash
bash sync.sh 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
:PluginInstall #in vim
source ~/.bashrc
```

#### Adding patched fonts
https://github.com/ryanoasis/nerd-fonts#option-6-ad-hoc-curl-download
```bash
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
```

#### SC-IM
https://github.com/andmarti1424/sc-im/wiki/Ubuntu-with-XLSX-import-&-export

```bash
sudo apt-get install -y bison libncurses5-dev libncursesw5-dev libxml2-dev libzip-dev gnuplot
git clone https://github.com/jmcnamara/libxlsxwriter.git
cd libxlsxwriter/
make
sudo make install
```
```bash
sudo ldconfig
cd ..
git clone https://github.com/andmarti1424/sc-im.git
cd sc-im/src
make
sudo make install
```

Install conda

```bash
conda config --add channels conda-forge
conda update -y conda
conda update -y python

```
Extensions:
https://github.com/lambdalisue/jupyter-vim-binding/wiki/Installation

conda install jupyter_contrib_nbextensions
jupyter nbextensions_configurator enable --user

# You may need the following to create the directoy
mkdir -p $(jupyter --data-dir)/nbextensions
# Now clone the repository
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
chmod -R go-w vim_binding

jupyter nbextension enable vim_binding/vim_binding




### TODO
- [x] Run :PluginInstall from commandline
- [ ] Insert backticks in tmux https://gist.github.com/JikkuJose/7509315
            (mod so 3 backticks will insert one backtick)

Windows (GIT BASH)
----------------------


1. Install git https://git-scm.com/download/win
2. Update ssh key 
    ```bash
    git config --global user.email "hcollins345@gmail.com" 
    git config --global user.name "hcollins345" 
    ssh-keygen -t ed25519 -C "hcollins345@gmail.com"
    clip.exe < ~/.ssh/id_ed25519.pub
    ```
    1. Paste clipboard into https://github.com/settings/ssh/new
3. Clone dotfiles repo
    ```bash
    git clone git@github.com:hcollins345/dotfiles.git
    ```
    
### Python3
https://www.anaconda.com/products/individual (scroll to bottom of page)

### 64bit Vim
1. Install 64 bit vim - https://github.com/vim/vim-win32-installer/releases
2. Add to dotfiles/.bashrc 
    ```bash
    alias vim="vim.bat"  
    alias gvim="gvim.bat"  
    ```
3. In git bash
    ```bash
    bash ~/dotfiles/sync.sh  
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
    ```

### YCM - needs 64 bit vim and python3
1. Install cake - https://cmake.org/download/
2. Install Visual Studio Build Tools - https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=BuildTools&rel=16  
        * Select Visual C++ build tools in Workloads in Visual Studio (was selected by default).  
            ![Visual studio workload screenshot](https://github.com/hcollins345/random/blob/master/visual_studio_build_tools.png)
3. Compile YCM - ```python .vim/bundle/YouCompleteMe/install.py```
4. Add Environment variable ```PYTHONPATH``` with value (update path names first), ```C:\Users\<name>\Anaconda3\Lib;C:\Users\<name>\Anaconda3\libs;C:\Users\<name>\Anaconda3\Lib\site-packages;C:\Users\<name>\Anaconda3\DLLs```

### POWERLINE fonts
```bash
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts
```
Navigate to ```C:\Program Files\Git\mingw64\share\fonts```, highlight all, right click and hit install

### Ripgrep
Run in admin powershell
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install ripgrep
```

### Ranger

```bash
wget https://raw.githubusercontent.com/kyoz/purify/master/ranger/purify.py -O ~/.config/ranger/colorschemes/default.py
# or
$ curl https://raw.githubusercontent.com/kyoz/purify/master/ranger/purify.py --output ~/.config/ranger/colorschemes/default.py
```

### Powershell
To use powershell scripting, run this in powershell in admin mode
```
Set-ExecutionPolicy RemoteSigned
```




WINDOWS (WSL1)
-------------------------------------------------------
[More Info](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
1. Run command in Powershell as administer
    ```powershell
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    ```
2. Restart computer
3. Install Linux distro from [Microsoft Store](https://aka.ms/wslstore) or direct [Ubuntu 20.04 LTS](https://www.microsoft.com/store/apps/9n6svws3rx71)
4. Run Ubuntu Terminal to finish install
```bash
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y 
ln -s /mnt/c/Users/hcollins hcollins
ln -svf hcollins/OneDrive\ -\ Intel\ Corporation/ onedrive
```
1. Install WSLTTY https://github.com/mintty/wsltty/releases
2. Update ssh key 
    ```bash
    git config --global user.email "hcollins345@gmail.com" 
    git config --global user.name "hcollins345" 
    ssh-keygen -t ed25519 -C "hcollins345@gmail.com"
    clip.exe < ~/.ssh/id_ed25519.pub
    ```
    1. Paste clipboard into https://github.com/settings/ssh/new
7. Clone dotfiles repo
    ```bash
    git clone -q git@github.com:hcollins345/dotfiles.git
    bash ~/dotfiles/sync.sh 
    ```
8. make tab completion case-insensitive for all users
    ```bash
    echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
    ```
5. change vi mode cursor styles depending on mode
    ```bash
    echo 'set vi-ins-mode-string \1\e[5 q\2' | sudo tee -a /etc/inputrc
    echo 'set vi-cmd-mode-string \1\e[2 q\2' | sudo tee -a /etc/inputrc
    echo 'set show-mode-in-prompt on' | sudo tee -a /etc/inputrc
    ```
    

### VIM
Default vim seems fine
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
Update vim
```bash
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y && sudo apt autoclean -y 
```
Upgrading fzf.vim
```bash
sudo apt install bat silversearcher-ag
```
http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html

### YCM and python - need to install linux anaconda

https://gist.github.com/kauffmanes/5e74916617f9993bc3479f401dfec7da  
https://www.anaconda.com/products/individual (scroll to bottom of page)

```bash
curl -O https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh && bash Anaconda3-2020.11-Linux-x86_64.sh -b
sudo apt -y install python3-dev cmake build-essential
python ~/.vim/bundle/YouCompleteMe/install.py
```

### TMUX config
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```  
prefix + r # re-source tmux  
prefix + I # fetch plugins

### Prompts
```
\[\033]0;$TITLEPREFIX:$PWD\007\]\n\[\033[32m\]\u@\h \[\033[35m\]$MSYSTEM \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\]\n$
```  
![Git Bash Prompt](https://github.com/hcollins345/random/blob/master/PS1_gitbash.png)  
```
\[\e]0;\u@\h: \w\a\]\[\033[01;32m\]\u@\h \[\033[0;36m\]\w\[\033[01;32m\]$(__git_ps1)\n\[\033[01;32m\]└─\[\033[0m\033[01;32m\] λ\[\033[0m\033[01;32m\] ~\[\033[0m\]
```  
![WSLTTY Prompt](https://github.com/hcollins345/random/blob/master/PS1_WSLTTY.png)

colours
https://misc.flogisoft.com/bash/tip_colors_and_formatting
More detail in .bashrc

### COPY/PASTE
In the WSLTTY Terminal, right click acts as both copy and paste using the windows clipboard ie. highlight and right click to copy, no highlight and right click to paste.

[WSL, TMUX and VIM copy/paste setup](https://www.youtube.com/watch?v=_MgrjgQqDcE)

First set up enable copy/paste using ctrl+shift+letter shortcuts in properties (right click image in top left corner of terminal)  
![Git Bash Prompt](https://github.com/hcollins345/random/blob/master/WSLTTY_copy_paste_settings.png)
VcXsrv - install and add config.xlaunch to startup folder
https://sourceforge.net/projects/vcxsrv/files/latest/download

```bash
cp dotfiles/config.xlaunch ~/hcollins/AppData/Roaming/Microsoft/Windows/Start\ Menu/
```

### Right click launch modification (shift right click works already by default)
Can modify registry keys or https://www.sordum.org/7615/easy-context-menu-v1-6/

POWER MANAGEMENT (Linux)
----------------------------------

Details here
https://itsfoss.com/reduce-overheating-laptops-linux/

#### tlp

```bash
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
**If you are using ThinkPads, you require an additional step:**
sudo apt-get install tp-smapi-dkms acpi-call-dkms
```

#### thermald

```bash
sudo apt-get install thermald
```

#### CPUfreq

```bash
sudo apt-get install indicator-cpufreq
```

## Windows Monitor Overlay
https://www.msi.com/Landing/afterburner

Msi afterburner auto installs RTSS (used for the overlays)

https://pcgamehaven.com/easily-monitor-cpu-gpu-usage-gaming/







