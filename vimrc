"*******************************************************************************
"* My vimrc
"* - @lyc4n
"*******************************************************************************

"= Custom Mappings =============================================================
  let mapleader = ","

  nnoremap <leader>vi :tabe $MYVIMRC<cr>
  nnoremap <leader>so :so $MYVIMRC<cr>
  nnoremap <leader>w :w<cr>

  " zoom a vim pane, <C-w>= to re-balance
  nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
  nnoremap <leader>= :wincmd =<cr>

  " Search visually selected text via //
  vnoremap // y/<C-R>"<CR>

  " vim-rspec mappings
  " nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
  " nnoremap <Leader>s :call RunNearestSpec()<CR>
  " nnoremap <Leader>l :call RunLastSpec()<CR>

  map <leader>gr :topleft :split config/routes.rb<cr>
  map <leader>gg :topleft 100 :split Gemfile<cr>

  nmap j gj
  nmap k gk
  nmap <Leader>f :FZF<cr>
  imap jj <esc>

  command! -complete=file -nargs=1 Mkfulldir execute "!mkdir -p %h" string(<q-args>)
  command! ConvertToSingleQuotes %s/\"\([^"]*\)\"/'\1'/g
  command! ConvertToDoubleQuotes %s/\'\([^']*\)\'/"\1"/g

"= SET Commands ================================================================
  set nocompatible " will use vim over vi's command if they both have it
  set enc=utf-8
  set fileencoding=utf-8
  set fileencodings=ucs-bom,utf8,prc
  set backspace=indent,eol,start
  set hlsearch
  set autoindent
  set smartcase
  set incsearch
  set showmatch
  set expandtab "convert tabs to spaces
  set tabstop=2 "for ruby
  set list "use ':so %' to list tabs or returns 
  set listchars=tab:▸\ ,nbsp:⋅,trail:•
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
  set laststatus=2
  set nofoldenable
  set relativenumber
  if v:version > 703
    set number " hybrid relative and absolute for current line
  endif

  set rtp+=~/.fzf

"= Vundle Plugin Manager =======================================================
  filetype off " vundle requires to set filetype off
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
      Plugin 'nelstrom/vim-mac-classic-theme'
      Plugin 'yaymukund/vim-rabl'
      Plugin 'vim-airline/vim-airline'
      Plugin 'toyamarinyon/vim-swift'
      Plugin 'godlygeek/tabular'
      Plugin 'plasticboy/vim-markdown'
      Plugin 'christoomey/vim-tmux-navigator'
      Plugin 'thoughtbot/vim-rspec'
      Plugin 'tpope/vim-dispatch'
      Plugin 'jgdavey/tslime.vim'
      Plugin 'vim-scripts/Rename2'
      Plugin 'tomtom/tcomment_vim' " use with gc key
      Plugin 'junegunn/fzf'
      Plugin 'MarcWeber/vim-addon-mw-utils'
      Plugin 'tomtom/tlib_vim'
      Plugin 'garbas/vim-snipmate'
      Plugin 'honza/vim-snippets'
      Plugin 'vim-scripts/greplace.vim'
      Plugin 'tomasr/molokai'
      Plugin 'pangloss/vim-javascript'
      Plugin 'mxw/vim-jsx'
      Plugin 'mileszs/ack.vim'
      Plugin 'vim-scripts/Align'
  call vundle#end()

  filetype plugin indent on

"= Commands ===================================================================
  syntax enable
  colorscheme molokai "mac_classic
  runtime macros/matchit.vim

"= Auto Commands ===============================================================
  au BufRead,BufNewFile *.es6 set filetype=javascript.jsx
  au BufRead,BufNewFile *.ru set filetype=ruby                  " .ru files are Ruby
  au Bufread,BufNewFile *.md set filetype=markdown textwidth=79 " Markdown gets auto textwidth
  au Bufread,BufNewFile *.markdown set textwidth=79             " Markdown gets auto textwidth
  au VimResized * :wincmd =                                     " automatically rebalance windows on vim resize
  au FileType javascript.jsx runtime! ftplugin/html/sparkup.vim

"= Plugin Specific Settings ====================================================
"
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

  let g:airline_left_sep=''
  let g:airline_right_sep=''

  " Use this when adding custom snippets 
  " let g:snippets_dir='~/code/dotfiles/vim/snippets, ~/path/to/original/snippet/dir'
