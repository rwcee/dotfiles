set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'hashivim/vim-terraform'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Vundle Colorschemes
Plugin 'tomasr/molokai'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set backspace=indent,eol,start
set relativenumber
set number
set tabstop=2
set shiftwidth=2
set expandtab
set nobackup
set history=50        " keep 50 lines of command line history
set ruler        " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch        " do incremental searching
set nocp

syntax enable
colorscheme molokai

" Remap Leader Key
let mapleader=","

" #hardmode
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Remap j,k to select options in popup lists
inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" copy to system clipboard
map <leader>c "+y

" Set the side bar size
let g:NERDTreeWinSize = 40

" Toggle NERDTree with Leader-n
map <leader>n :NERDTreeToggle<CR>

" GitGutter Stuff
"Lower amount of time it takes to update gutter
set updatetime=1000

"Fix Gutter Colors
hi clear SignColumn
call gitgutter#highlight#define_highlights()

"fzf completion
set rtp+=/usr/local/opt/fzf

" show problematic whitespace
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" cron stuff
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif
