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
    Plugin 'tpope/vim-rails'
    Plugin 'tpope/vim-surround'
    Plugin 'skammer/vim-css-color'
    Plugin 'nelstrom/vim-mac-classic-theme'
    Plugin 'yaymukund/vim-rabl'
    Plugin 'bling/vim-airline'
    Plugin 'chrisbra/Colorizer'
    Plugin 'gorodinskiy/vim-coloresque'
    Plugin 'toyamarinyon/vim-swift'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'csscomb/vim-csscomb'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'thoughtbot/vim-rspec'
    Plugin 'tpope/vim-dispatch'
    Plugin 'jgdavey/tslime.vim'
    Plugin 'ctrlpvim/ctrlp.vim'
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

set laststatus=2

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

runtime macros/matchit.vim

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

set relativenumber

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Send command from vim to a running tmux session
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
