set nocompatible              " be iMproved, required
filetype off                  " required
runtime macros/matchit.vim
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
let g:ycm_register_as_syntastic_checker = 0

Plugin 'xolox/vim-misc'

Plugin 'xolox/vim-easytags'
let g:easytags_opts = ['-fileds=+l']
let g:easytags_async = 1
set tags=./tags;
let g:easytags_dynamic_files = 1

Plugin 'jetaggart/vim-te'

Plugin 'mtth/scratch.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-surround'

Plugin 'tpope/vim-markdown'

Plugin 'tpope/vim-bundler'

Plugin 'tpope/vim-endwise'

Plugin 'tpope/vim-unimpaired'

Plugin 'vim-scripts/SyntaxRange'

Plugin 'kien/ctrlp.vim'

Plugin 'vim-ruby/vim-ruby'

Plugin 'dag/vim2hs'

Plugin 'rking/ag.vim'

Plugin 'gregsexton/gitv'

Plugin 'pangloss/vim-javascript'

Plugin 'kchmck/vim-coffee-script'

Plugin 'mattn/emmet-vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'vim-scripts/vim-auto-save'
let g:auto_save = 1

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "util_snippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"


call vundle#end()            " required
filetype plugin indent on    " required


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
set clipboard=unnamed

syntax on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  "   .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

highlight NonText guibg=#060606
highlight Folded guibg=#0A0A0A guifg=#9090D0

" Make it obvious where 80 characters is
set textwidth=80
"
" " Numbers
set number
set numberwidth=5

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

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

" open new line in insert mode
imap <C-o> <esc>o
" go to end of line
imap <C-e> <esc>A

" disable ex mode
:map Q <Nop>

let mapleader = ","

" Ag <leader>f to search
map <leader>f :Ag<Space>
map <leader>F :Ag <C-R><C-W><CR>

map <leader>i :set foldmethod=indent<cr>zM<cr>
" NERDTree
map \           :NERDTreeToggle<CR>
map \|          :NERDTreeFind<CR>

nnoremap Y y$

" shift-tab for command mode
nmap <S-Tab> <<
" shift-tab for insert mode
imap <S-Tab> <Esc><<i

colorscheme tomorrow

