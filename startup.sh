#Need to add the cran link to etc/../sources.list for ubuntu bionic (if still using linux mint Tara), looks like deb https...
sudo apt-get update && \
sudo apt-get upgrade && \
sudo apt-get install --assume-yes xclip tmux git r-base vim-gtk3 pandoc pandoc-citeproc cmake build-essential && \
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && \
echo "install.packages(c('rmarkdown', 'reticulate', 'tinytex'), repos='http://cran.rstudio.com/'); tinytex::install_tinytex()" | sudo R --vanilla && \
cd /tmp && \
curl -O https://repo.anaconda.com/archive/Anaconda3-5.3.1-Linux-x86_64.sh && \
bash -b Anaconda3-5.3.1-Linux-x86_64.sh && \
cd ~ && \
git config --global user.email "hcollins345@gmail.com"
git config --global user.name "hcollins345"

# ==========Vimrc and YCM=======
# go to .vimrc in ~ and ran :PluginInstall
# Need to refresh the terminal or source the anaconda python before running install.py inside of YCM

# ==========keyboard============
# Map keyboard shortcuts
    # * push windows -- super + h|j|k|i
    # * snap windows -- ctrl + super + h|j|k|i
    # * map CpsLock to ESC
    # * close window -- super + backspace
    # * maximise window -- super + m

# ===========fonts==============
# add fonts to terminal by putting the font in the .fonts folder in $HOME and running;
    #"fv-cache -vf" (I think that's the command)
# you can then access it in preferences


