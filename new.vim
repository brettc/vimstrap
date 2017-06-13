" Bootstrap & Setup {{{
" vim: fdm=marker

if has('vim_starting')
  set nocompatible
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  echo "Installing Vim-Plug..."
  echo ""
  silent !mkdir -p ~/.vim/autoload
  silent !\curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

"}}}
" Plugins {{{

call plug#begin(expand('~/.vim/plugged'))

" Directories etc
" I don't think I need NerdTree!
" Plug 'mbbill/undotree'
" Plug 'sjl/vitality.vim'
" Plug 'greplace.vim'
" Plug 'sjl/gundo.vim'
" Plug 'junegunn/vim-easy-align'
" Plug 'kien/ctrlp.vim'
" Plug 'tacahiroy/ctrlp-funky'
"
" Plug 'junegunn/vim-peekaboo'
" Plug 'metakirby5/codi.vim'

Plug 'MattesGroeger/vim-bookmarks'
" Plug 'jeetsukumaran/vim-filebeagle'

" Commenting
Plug 'tpope/vim-commentary'

" Unix commands.
Plug 'tpope/vim-eunuch'

" This is my file explorer! It is all I need.
Plug 'tpope/vim-vinegar'

" Versioning / Git etc
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" Fast File lookup. Note: This is Terminal Specific!
" if !has("gui")
"     Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"     Plug 'junegunn/fzf.vim'
" endif

" Plug 'ctrlpvim/ctrlp.vim'
" This appears to be less than good on nvim
" Plug 'Shougo/denite.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
"
" Plug 'vim-scripts/grep.vim'
" Plug 'vim-scripts/CSApprox'

" Plug 'bronson/vim-trailing-whitespace'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/syntastic'

" Plug 'majutsushi/tagbar'
" Plug 'Yggdroot/indentLine'
" let g:indentLine_char = '┊'

" For lots of syntax highlighting
Plug 'sheerun/vim-polyglot'

" Python plugins
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-jedi'
" Not sure why I need this AND deoplete...
Plug 'davidhalter/jedi-vim'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tell-k/vim-autopep8'
Plug 'tmhedberg/SimpylFold'
Plug 'alfredodeza/pytest.vim'
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'
Plug 'Konfekt/FastFold'
" Plug 'janko-m/vim-test'
" Plug '5long/pytest-vim-compiler'
" Plug 'Rykka/doctest.vim'
"
" Database
Plug 'vim-scripts/dbext.vim'

" Writing-----------------
Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
Plug 'vim-pandoc/vim-pantondoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'

Plug 'lervag/vimtex'

Plug 'reedes/vim-wordy'
Plug 'reedes/vim-textobj-sentence'

"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()

" Required:
filetype plugin indent on

" }}}
" Basic Setup {{{
"
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

set termguicolors
set t_Co=256

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
" Terminal Handling {{{
if has('win32unix')
    let &t_ti.="\e[1 q"
    let &t_SI.="\e[5 q"
    let &t_EI.="\e[1 q"
    let &t_te.="\e[0 q"
elseif exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<esc>]50;CursorShape=2\x7"
endif


" }}}

" Plugin Config
" Session management {{{
"
let g:session_directory = "~/.config/vim/session"
let g:session_autoload = "no"
let g:session_autosave = "yes"
let g:session_command_aliases = 1

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>


"}}}
" {{{ Bookmarks

let g:bookmark_auto_save = 1

" }}}
" Airline {{{
"
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  " let g:airline#extensions#tabline#left_sep = ' '
  " let g:airline#extensions#tabline#left_alt_sep = '|'
  " let g:airline_left_sep          = '▶'
  " let g:airline_left_alt_sep      = '»'
  " let g:airline_right_sep         = '◀'
  " let g:airline_right_alt_sep     = '«'
  " let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  " let g:airline#extensions#readonly#symbol   = '⊘'
  " let g:airline#extensions#linecolumn#prefix = '¶'
  " let g:airline#extensions#paste#symbol      = 'ρ'
  " let g:airline_symbols.linenr    = '␊'
  " let g:airline_symbols.branch    = '⎇'
  " let g:airline_symbols.paste     = 'ρ'
  " let g:airline_symbols.paste     = 'Þ'
  " let g:airline_symbols.paste     = '∥'
  " let g:airline_symbols.whitespace = 'Ξ'
else
  " let g:airline#extensions#tabline#left_sep = ''
  " let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  " let g:airline_left_sep = ''
  " let g:airline_left_alt_sep = ''
  " let g:airline_right_sep = ''
  " let g:airline_right_alt_sep = ''
  " let g:airline_symbols.branch = ''
  " let g:airline_symbols.readonly = ''
  " let g:airline_symbols.linenr = ''
endif

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

""}}}
" FZF {{{
"
" let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
" let g:fzf_layout = { 'window': 'enew' }
" let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'pointer': ['fg', 'Exception'],
"   \ 'marker':  ['fg', 'Keyword'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }
"
" noremap <leader>n :GFiles<cr>
" noremap <leader>N :Files<cr>
" noremap <leader>b :Buffers<cr>

" }}}
" PLUGIN Unite {{{
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " Overwrite settings.
    nmap <buffer> <c-c>   <Plug>(unite_exit)
    imap <buffer> <c-c>   <Plug>(unite_exit)
endfunction

" silent nunmap <Leader>n

nnoremap <leader>n :<C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert file_rec<cr>
nnoremap <leader>b :silent Unite -no-split -no-auto-resize -ignorecase -start-insert buffer<cr>
nnoremap <leader>o :<C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert outline<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=tags -start-insert tag<cr>

" nnoremap <leader>n :<C-u>Unite -no-split -buffer-name=recfiles -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>UniteWithBufferDir -no-split -no-auto-resize -ignorecase -start-insert file<cr>
" nnoremap <leader>F :<C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert file<cr>
" call unite#custom#profile('outline', 'smartcase', 0)
" nnoremap <leader>t :silent <C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert outline<cr>
" nnoremap <leader>n :<C-u>Unite -no-split -buffer-name=recfiles -start-insert file_rec/async<cr>
" nnoremap <leader>n :<C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert file_rec/async:!<cr>
" nnoremap <leader>T :<C-u>Unite -no-split -buffer-name=tags -start-insert outline<cr>
" Use ag for search
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif
" nnoremap <leader>a :<C-u>Unite -no-split -no-auto-resize -buffer-name=grep grep<cr>
"
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\.o$\|\.pyc$\|\.idea/*\|\.rope/*\|.cache/*\|.__pycach*\|\attic/|\.git/')

" }}}

" File Handling
" Autocmd Rules {{{
" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread
" }}}
" C/C++ {{{
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
"}}}
" Javascript {{{
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

"}}}
" Python {{{

augroup vimrc-python
  autocmd!
  " Not sure about the color column
  " autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#rename_command = "<leader>r"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#usages_command = ""
let g:jedi#rename_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#show_call_signatures = 2
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']

" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

"}}}

" General niceness
" Nice Abbreviations {{{

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
" }}}
" Mappings ---------------------------------------------------------------- {{{

" Dvorak easiness
nnoremap ; :

" Still can't leave this behind
map <c-s> :w<CR>

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>c <C-w>c

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

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
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv




"" Git

"" Open current line on GitHub
" nnoremap <Leader>o :.Gbrowse<CR>

" noremap <Leader>ga :Gwrite<CR>
" noremap <Leader>gc :Gcommit<CR>
" noremap <Leader>gsh :Gpush<CR>
" noremap <Leader>gll :Gpull<CR>
" noremap <Leader>gd :Gvdiff<CR>
" noremap <Leader>gs :Gstatus<CR>
" noremap <Leader>gb :Gblame<CR>
" noremap <Leader>gr :Gremove<CR>


"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
" noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" let g:UltiSnipsEditSplit="vertical"

" syntastic
let g:syntastic_always_populate_loc_list=1
" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
" let g:syntastic_style_error_symbol = '✗'
" let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set visualbell
" set noerrorbells visualbell t_vb=
" if has('autocmd')
"   autocmd GUIEnter * set visualbell t_vb=
" endif

"" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif


" }}}
