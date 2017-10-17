" Bootstrap & Setup {{{
" vim: fdm=marker
"
if has('vim_starting')
    set nocompatible
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
    if !executable("curl")
        echoerr "You have to install curl or first install vim-plug yourself!"
        execute "q!"
    endif
    echo "Installing Vim-Plug..."
    echo ""
    silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let g:not_finish_vimplug = "yes"

    autocmd VimEnter * PlugInstall
endif
" }}}
" Plugins {{{

  " Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" This is my file explorer! It is all I need.
Plug 'tpope/vim-vinegar'
Plug 'roxma/nvim-completion-manager'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Commenting
Plug 'tpope/vim-commentary'

" Unix commands.
Plug 'tpope/vim-eunuch'


" Versioning / Git etc
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'

" Writing etc
Plug 'junegunn/goyo.vim'
" Plug 'unblevable/quick-scope'

"" Colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" Required:
filetype plugin indent on

" }}}

" Basic Setup {{{
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile
" set undodir -- use defaults

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh


"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" Wild ignore
set wildmenu
set wildignore+=*.pch,*.opt,*.ncb,*.dep,*.pyc,.git,.bzr,*.o,build/**
" set wildmode=list:full
" set suffixes-=.h
" set suffixes+=.pch,.idb,.pdb


"}}}
" Visual Settings {{{
"
syntax on
set ruler
" I don't like this.
" set number

" set termguicolors
" set t_Co=256

" My preferred scheme
set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'
set fillchars+=vert:\  " The trailing space is fine!
hi clear VertSplit
hi link VertSplit StatusLine

" Menus are for sissies
let no_buffers_menu=1

" Mouse
set mousemodel=popup
set guioptions=egmrti

" let g:CSApprox_loaded = 1

" endif
"" Disable the blinking cursor.
" set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Showing chars
set listchars=precedes:<,extends:>
set listchars+=tab:»·,trail:·,eol:¶,space:·

if has("gui")
    set guifont=Hack\ Regular:h14
else
    " Make this easy to see
    autocmd BufEnter * setlocal cursorline
    autocmd BufLeave * setlocal nocursorline
endif


"}}}
" Plugin Config
" Session management {{{
"
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_command_aliases = 1

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
" }}}

" Mappings ---------------------------------------------------------------- {{{

" Dvorak easiness
" nnoremap ; :

" Still can't leave this behind
map <c-s> :w<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>c <C-w>c

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
" nnoremap n nzzzv
" nnoremap N Nzzzv

"" Buffer nav
" noremap <silent> <S-t> :bn<CR>
" noremap <silent> <S-h> :bp<CR>

"" Tabs
" nnoremap <Tab> gt
" nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
" noremap <C-h> <C-w>h
noremap <C-right> <C-w>w
noremap <C-left> <C-w>W
noremap <S-right> :bn<cr>
noremap <S-left> :bp<cr>

"" Vmap for maintain Visual Mode after shifting > and <
" vmap < <gv
" vmap > >gv

"" Move visual block
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv

nnoremap <Leader>vv :e $HOME/.config/nvim/init.vim
" }}}
"
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

