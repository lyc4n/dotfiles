set encoding=utf-8
scriptencoding utf-8
" will use vim over vi's command if they both have it
set nocompatible

filetype off

" -- will now use vundle
" call pathogen#infect()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'L9'
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plugin 'scrooloose/nerdtree'
    Plugin 'slim-template/vim-slim.git'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'wincent/command-t'
    Plugin 'tpope/vim-rails'
    Plugin 'tpope/vim-surround'
    Plugin 'skammer/vim-css-color'
    Plugin 'nelstrom/vim-mac-classic-theme'
    Plugin 'yaymukund/vim-rabl'
    Plugin 'bling/vim-airline'
    Plugin 'chrisbra/Colorizer'
    Plugin 'gorodinskiy/vim-coloresque'
call vundle#end()
filetype plugin indent on

let mapleader = ","
syntax enable
set backspace=indent,eol,start
set hlsearch
set autoindent

set smartcase
set incsearch
set showmatch

set list "use ':so %' to list tabs or returns 
set listchars=""          " reset listchars
set listchars=tab:‣\  " display tabs with a sign
set listchars=tab:·\  " display tabs with a sign
set listchars+=trail:• " display trailing whitespaces with a dot
set listchars+=extends:»  " right wrap
set listchars+=precedes:« " left wrap
set listchars+=nbsp:~ " non breaking space
set list

set noswapfile
set cursorline
set number
set cc=100
set guifont=Monaco

set winheight=999
set winheight=5
set winminheight=5
set tabstop=2
set shiftwidth=2

" Autocommands {{{

".ru files are Ruby.
au BufRead,BufNewFile *.ru set filetype=ruby
au BufRead,BufNewFile [vV]agrantfile set filetype=ruby

" Markdown gets auto textwidth
au Bufread,BufNewFile *.md set filetype=markdown textwidth=79
au Bufread,BufNewFile *.markdown set textwidth=79

set laststatus=2

"colorscheme mac_classic

set expandtab "convert tabs to spaces
set tabstop=2 "for ruby

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <F9> :NERDTreeToggle /newfile

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python,coffee   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType slim             let b:comment_leader = '/ '

noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
