# Example of using the dotfiles via symlink (vimrc)

1. $ cd ~
2. $ ln -s code/dotfiles/vimrc .vimrc

# Some problems and solutions upon setup:

##A.
Problem: **"error: There was a problem with the editor 'vi'"**
Solution: `git config --global core.editor $(which vim)`
