configs
=======

Config files for vim, tmux, bash alongside startup scripts for
installations, symbolic links etc

### setup files

Repo should be cloned into $HOME

#### startup.sh

To be run with sudo after new OS installation. Installs Rmarkdown with
tinytex, Anaconda etc.

#### sync.sh

Creates symbolic links for each of the config files.

### Installation

1. set up keyboard mappings (details in startup.sh)
2. sudo apt install git 
3. add ssh keys 
[tutorial](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
4. git clone dotfiles
5. bash sync.sh
6. sudo bash startup.sh
7. bash startup_part_2.sh
