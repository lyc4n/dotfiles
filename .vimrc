" will use vim over vi's command if they both have it
set nocompatible

filetype off

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
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
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

" }}}


" Statusline {{{
hi User1 ctermbg=white    ctermfg=black   guibg=#89A1A1 guifg=#002B36
hi User2 ctermbg=red      ctermfg=white   guibg=#aa0000 guifg=#89a1a1

function! GetCWD()
  return expand(":pwd")
endfunction

function! IsHelp()
  return &buftype=='help'?' (help) ':''
endfunction

function! GetName()
  return expand("%:t")==''?'<none>':expand("%:t")
endfunction

set statusline=%1*[%{GetName()}]\ 
set statusline+=%<pwd:%{getcwd()}\ 
set statusline+=%2*%{&modified?'\[+]':''}%*
set statusline+=%{IsHelp()}
set statusline+=%{&readonly?'\ (ro)\ ':''}
set statusline+=[
set statusline+=%{strlen(&fenc)?&fenc:'none'}\|
set statusline+=%{&ff}\|
set statusline+=%{strlen(&ft)?&ft:'<none>'}
set statusline+=]\ 
set statusline+=%=
set statusline+=c%c
set statusline+=,l%l
set statusline+=/%L\ 

set laststatus=2

" }}}

colorscheme mac_classic

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
