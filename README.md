# Example of using the dotfiles via symlink (vimrc)

1. $ cd ~
2. $ ln -s code/dotfiles/vimrc .vimrc

# Problems and solutions upon setup:

## 1.  There was a problem with the editor 'vi'

Try running `$ git config --global core.editor $(which vim)`
