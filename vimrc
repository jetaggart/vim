set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'croaky/vim-colors-github'

call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","

set backspace=2 " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set laststatus=2 " Always display the status line
set autowrite " Automatically :write before running commands

syntax on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  "   .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


colorscheme github
highlight NonText guibg=#060606
highlight Folded guibg=#0A0A0A guifg=#9090D0

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1
"
" " Numbers
set number
set numberwidth=5

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

