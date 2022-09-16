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

"= Vim-plug plugin anager =======================================================
  filetype off " vundle requires to set filetype off
  "set rtp+=~/.vim/bundle/Vundle.vim
  call plug#begin()
      "Plug 'gmarik/Vundle.vim'
      Plug 'tpope/vim-fugitive'
      Plug 'vim-scripts/L9'
      Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
      Plug 'scrooloose/nerdtree'
      Plug 'slim-template/vim-slim'
      Plug 'kchmck/vim-coffee-script'
      Plug 'tpope/vim-rails'
      Plug 'tpope/vim-surround'
      Plug 'nelstrom/vim-mac-classic-theme'
      Plug 'yaymukund/vim-rabl'
      Plug 'vim-airline/vim-airline'
      Plug 'toyamarinyon/vim-swift'
      Plug 'godlygeek/tabular'
      Plug 'plasticboy/vim-markdown'
      Plug 'christoomey/vim-tmux-navigator'
      Plug 'thoughtbot/vim-rspec'
      Plug 'tpope/vim-dispatch'
      Plug 'jgdavey/tslime.vim'
      Plug 'vim-scripts/Rename2'
      Plug 'tomtom/tcomment_vim' " use with gc key
      Plug 'junegunn/fzf'
      Plug 'MarcWeber/vim-addon-mw-utils'
      Plug 'tomtom/tlib_vim'
      Plug 'garbas/vim-snipmate'
      Plug 'honza/vim-snippets'
      Plug 'vim-scripts/greplace.vim'
      Plug 'tomasr/molokai'
      Plug 'pangloss/vim-javascript'
      Plug 'mxw/vim-jsx'
      Plug 'mileszs/ack.vim'
      Plug 'vim-scripts/Align'
      Plug 'dense-analysis/ale'
  call plug#end()

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

  " Set specific linters
  let g:ale_linters = {
  \   'javascript': ['eslint'],
  \   'ruby': ['rubocop'],
  \}

  " Only run linters named in ale_linters settings.
  let g:ale_linters_explicit = 1
  let g:ale_sign_column_always = 1
  let g:airline#extensions#ale#enabled = 1


  " Use this when adding custom snippets 
  " let g:snippets_dir='~/code/dotfiles/vim/snippets, ~/path/to/original/snippet/dir'
