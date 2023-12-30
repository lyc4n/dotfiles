# Setup - Vimrc

1. Download plug.vim and put it in ~/.vim/autoload
    ```
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    ```

2. Reload .vimrc and :PlugInstall to install plugins

# Example of using the dotfiles via symlink (vimrc)

1. $ cd ~
2. $ ln -s code/dotfiles/vimrc .vimrc

# Problems and solutions upon setup:

1. There was a problem with the editor 'vi'

   Try running `$ git config --global core.editor $(which vim)`
