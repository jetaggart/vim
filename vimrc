set nocompatible              " be iMproved, required
filetype off                  " required
runtime macros/matchit.vim

let mapleader = ","

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

let g:scratch_no_mappings=1
Plugin 'mtth/scratch.vim'
nmap ss <plug>(scratch-insert-reuse)
nmap sS <plug>(scratch-insert-clear)
xmap ss <plug>(scratch-selection-reuse)
xmap sS <plug>(scratch-selection-clear)

Plugin 'scrooloose/nerdtree'

Plugin 'gregsexton/gitv'
nmap <leader>gl :Gitv<CR>

Plugin 'tpope/vim-fugitive'
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>gpp :Gpush<CR>
nmap <leader>gfr :Gpull --rebase<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gll :Gitv<CR>

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

Plugin 'pangloss/vim-javascript'

Plugin 'kchmck/vim-coffee-script'

Plugin 'mattn/emmet-vim'

Plugin 'jiangmiao/auto-pairs'

Plugin 'vim-scripts/vim-auto-save'
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

Plugin 'SirVer/ultisnips'
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

set hlsearch

" whitespace
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

nnoremap <silent><expr> <Space> (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

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
map Q <Nop>

" quick write quit
map <leader>wq :x<CR>

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

" more like the real world
imap <A-BS> <C-W>

colorscheme tomorrow

