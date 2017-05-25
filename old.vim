" Brett's Vim Settings set nocompatible

" General {{{
" Easier on the hands
let mapleader=","
let maplocalleader=","

" Turn Off Swap Files
set noswapfile
set nobackup
set nowb

set cryptmethod=blowfish
set shm=at " abbreviate messages
set history=500
" set gcr=a:blinkon0              "Disable cursor blink
set visualbell
set nowrap
" set showbreak=»
set linebreak
set autoread
set backspace=indent,eol,start
set matchtime=0
set whichwrap=<,>,h,l,[,]
set showmatch
set listchars=precedes:<,extends:>
set listchars+=tab:»·,trail:·,eol:¶,space:·
set autowrite
set hidden
set mousemodel=popup_setpos

" I don't like the lines on the folds
set fillchars=fold:\ 

set complete=.,w,b,u,t,i
" set viewdir=$TEMP/vimviews
"
" Saving folds often causes problems
set viewoptions-=fold

" Movement commands return the cursor to the start of the line
set startofline

" Keep a large status area, otherwise, we seem to get popup problems with some
" plugins
set laststatus=2
set breakindent

" This makes cutting and pasting from other apps easy
" set clipboard=unnamed

" A new option, but very useful -- current dir is ALWAYS the same as the
" current file
set noautochdir

" Show as much text as possible when you are wrapping (rather than loads
" of @ symbols
set display=lastline

" set nofoldenable
" set virtualedit=all
" set browsedir=buffer
" set keymodel=startsel,stopsel

if has("win32")
    set directory=$TEMP//
    " I think this is a good idea
    set shellslash
elseif has("macunix")
    " set directory=$TMPDIR
    set directory=~/tmp//
    " set shell=/bin/bash
    " This is MacVim Specific
    set fuoptions=maxvert,background:Normal
elseif has("unix")
    set directory=~/tmp//
endif

" Let's just use the internal one everywhere ...
" cabbrev grep vimgrep
set updatetime=500

" let dictfile = expand('$HOME/vimfiles/dictionary.txt')
" exe 'map <F6> :silent !echo <cword> >> '.dictfile.'<cr>'
" exe 'imap <F6> <c-o>:silent !echo <cword> >> '.dictfile.'<cr>'
" setlocal dictionary=$HOME/vimfiles/dictionary.txt
set sessionoptions+=resize,winpos
set sessionoptions-=options
" }}}

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

" Plugins {{{
call plug#begin('~/.vim/plugged')

" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f
" your_machines_makefile
Plug 'Shougo/vimproc', { 'do': './make' }
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
" Plug 'Shougo/vimshell'
Plug 'Shougo/vimfiler'
" Plug 'Shougo/neocomplete'
Plug 'tsukkee/unite-tag'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'junegunn/vim-peekaboo'
Plug 'mbbill/undotree'
Plug 'metakirby5/codi.vim'

Plug 'MattesGroeger/vim-bookmarks'

" Lint engine
" Plug 'w0rp/ale'

" Completion
" Plug 'maralla/completor.vim'

" original repos on github
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mileszs/ack.vim'
" Plug 'jreybert/vimagit'

" Plug 'tpope/vim-dispatch'
" Plug 'benmills/vimux'

" Plug 'Shougo/neocomplete.vim'

" Working with remote (tmux etc)
Plug 'sjl/vitality.vim'

" Required for session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Plug 'matze/vim-move'
Plug 'vim-scripts/tcd.vim'

" Python-related plugins
Plug 'davidhalter/jedi-vim'
Plug 'alfredodeza/pytest.vim'

" Which one?
Plug 'janko-m/vim-test'
Plug '5long/pytest-vim-compiler'
Plug 'Rykka/doctest.vim'

Plug 'scrooloose/syntastic'
Plug 'tmhedberg/SimpylFold'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tell-k/vim-autopep8'
Plug 'Konfekt/FastFold'
Plug 'kana/vim-textobj-user'
Plug 'bps/vim-textobj-python'

" Nice Unix stuff
Plug 'tpope/vim-eunuch'
Plug 'rizzatti/dash.vim'

Plug 'gitv'
" Plug 'Mark'
Plug 'greplace.vim'
Plug 'sjl/gundo.vim'
" Plug 'godlygeek/tabular'
" Plug 'majutsushi/tagbar'
Plug 'junegunn/vim-easy-align'

" Writing
Plug 'vim-pandoc/vim-pantondoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc-after'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-textobj-sentence'
Plug 'lervag/vimtex'

" Status line enhancements -- copied to tmux automatically!
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

" Plug 'altercation/vim-colors-solarized'
" Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomtom/tcomment_vim'

" Testing
Plug 'vim-scripts/dbext.vim'

" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

call plug#end()

"}}}

" required
filetype plugin indent on
syntax on

" let g:completor_python_binary = '/Users/brett/anaconda/bin/python'

" }}}
" GUI and OS {{{
" I don't like toolbars and scrollbars. I prefer things naked.
set guioptions=gme

set background=light
colorscheme PaperColor
let g:airline_theme='papercolor'

" AirlineTheme PaperColor
hi clear VertSplit
hi link VertSplit airline_b
hi Folded gui=underline
"Italic is weird on Panic Prompt
hi Comment cterm=None
hi clear Conceal
hi Conceal gui=bold cterm=bold term=bold
" hi Title gui=bold,underline cterm=bold,underline, term=bold,underline gui
hi link pandocAtxHeader Underlined
" colorscheme solarized

if has("gui_running")
    " colorscheme base16-default
    " set guifont=Sauce\ Code\ Powerline:h15
    " set guifont=Source\ Code\ Pro:h15
    set guifont=Hack:h14
    set linespace=0
    set antialias
end

"}}}
" EXPLORER{{{
let g:netrw_sort_sequence="[\/]$,*,\.bak$,\.o$,\.h$,\.info$,\.swp$,\.obj$,\.aux$"
let g:netrw_list_hide=".*\.pyc$"
"}}}
" WILDMENU {{{
set wildmenu
"""set wildmode=list:full
set wildignore+=*.pch,*.opt,*.ncb,*.aps,*.dep,*.pyc,.git,.bzr,attic/**,*.o,build/**
set suffixes-=.h
set suffixes+=.pch,.idb,.pdb
" }}}
" Indenting & Formatting {{{
set autoindent
set cindent

" Allow for wrapped parameters to shorten lines
set cinoptions+=(0,W4
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround
set cino=:0,g0,t0,(0,u0,U1,)20,*30"
set formatoptions=cqtorn
" set formatlistpat=^\\s*[0-9*-]\\+[\\]:.)}\\t\ ]\\s*
" }}}
" SEARCHING {{{
set gdefault
"""set smartcase
set magic
set incsearch
set hlsearch
set wrapscan
" }}}
" INCLUDES & TAGS {{{
" These are the defaults
set path+=.
set path+=../
set path+=../../

" Search up from current folder.
set tags=tags;/
" }}}
" MAPPINGS {{{
" This is more accessible for Dvorak Keyboard
" Much easier on the keyboard
inoremap <C-c> <ESC>

nmap <c-F12> :bn<cr>
nmap <c-F11> :bp<cr>

map <D-F12> :set columns+=8<cr>
map <D-F11> :set columns-=8<cr>
map <s-D-F12> :set linespace+=1<cr>
map <s-D-F11> :set linespace-=1<cr>

map Q gq              " reset standard formatting

map ; :

" I remap c-w and c-b to more natural correlates of their Normal mappings

" forward delete word - delete eol as well
function! DeleteWord()
    let c = col('.')
    let eol = col('$')
    if eol == c
        return "\<del>"
    endif
    return "\<c-o>dw"
endfunction
"
" " <c-w> delete word right
inoremap <c-d> <c-r>=DeleteWord()<cr>
"
" This caused too many problems
" make <c-b> delete back
" inoremap <c-b> <c-w>

" map redo and undo
inoremap <c-y> <c-o><c-r>
inoremap <c-z> <c-o>u

" global mappings
map <Leader>vv :e ~/.vim/vimrc<CR>

" windows type stuff
map <F4> :cn<cr>
map <S-F4> :cp<cr>
map <f6> :make %<cr>

" saving
imap <C-s> <esc>:w<cr>a
nmap <c-s> :w<cr>

" get rid of the hl
map <Leader>k :nohlsearch<cr>
" map <Leader>e :NERDTreeClose<cr>
" map <Leader>e :NERDTreeToggle<cr>
" map <Leader>E :Explore<cr>
" map <Leader>e :VE .<cr>

if has("macunix")
    map <F2> :exe '!opentermhere '.escape(expand("%:p:h"), ' \')<cr>
endif

map gn :set invnu<cr>

"FIXME: <D-w> should call gT only when a tab was closed
map <D-w> :q<CR>gT
map <D-t> :tabnew<CR>
map <D-n> :new<CR>
" map <D-S-t> :browse tabe<CR>
" map <D-S-n> :browse split<CR>
map <D-]> :tabn<CR>
map <D-[> :tabp<CR>
map <C-Tab> :tabn<CR>
" map <D-[> :tabp<CR>

" Bad words!
" nmap ,ab :Mark \(\<is\>\)\|\(\<are\>\)\|\(\<was\>\)\|\(\<be\>\)\|\(\<been\>\)\|\(\<it\>\)\|\(\<that\>\)\|\(\<this\>\)\|\(\<there\>\)<cr>

" TABS! I never have more than this
nnoremap <d-1> 1gt
nnoremap <d-2> 2gt
nnoremap <d-3> 3gt
nnoremap <d-4> 4gt
nnoremap <d-5> 5gt
nnoremap <d-6> 6gt

" }}}
" SYNTAX python {{{
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
" let python_highlight_space_errors = 1
" let python_highlight_all = 1
"}}}
" PLUGIN: A {{{
map <c-q> :A<cr>
map <Leader>h :A<cr>
let g:alternateExtensions_pyx = "pxd"
let g:alternateExtensions_pxd = "pyx"
" let g:alternateExtensions_{'aspx.cs'} = "aspx"
" }}}
" PLUGIN SpellChecker {{{
let dialect='UK'
" }}}
" PLUGIN Session Manager {{{
nmap <Leader>ss :SaveSession<space>
nmap <Leader>so :OpenSession<space>

let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" Save some extra stuff
let g:session_persist_globals = ['&laststatus', '&linespace', '&cmdheight']
" }}}
" PLUGIN Airline {{{
let g:airline_powerline_fonts=1
let g:airline#extensions#whitespace#enabled = 0
" let g:airline_section_a       (mode, paste, iminsert)
" let g:airline_section_b       (hunks, branch)
" let g:airline_section_c       (bufferline or filename)
" let g:airline_section_gutter  (readonly, csv)
" let g:airline_section_x       (tagbar, filetype, virtualenv)
" let g:airline_section_y       (fileencoding, fileformat)
" let g:airline_section_z       (percentage, line number, column number)
" let g:airline_section_warning (syntastic, whitespace)
let g:airline#extensions#default#section_truncate_width = {
            \ 'a': 110,
            \ 'x': 100,
            \ 'y': 90,
            \ 'b': 80,
            \ }
  let g:airline#extensions#wordcount#filetypes = '\vhelp|markdown|rst|org|text|asciidoc|pandoc'
" }}}
" PLUGIN Ack {{{
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
" }}}
" PLUGIN Vimfiler {{{
"
map <Leader>e :VimFiler -tab -force-quit<cr>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_quick_look_command = 'qlmanage -p'
map 0 <Plug>(vimfiler_quick_look)

" }}}
" PLUGIN Pymode {{{
"
let g:pymode_options = 0
" don't show lint result every time we save a file
let g:pymode_lint_write = 0
let g:pymode_breakpoint = 0
let g:pymode_lint_cwindow = 0
" run pep8+pyflakes+pylint validator with \8
autocmd FileType python map <buffer> <leader>8 :PyLint<CR>
" rules to ignore (example: "E501,W293")
let g:pymode_lint_ignore = ""
" don't add extra column for error icons (on console vim creates a 2-char-wide
" extra column)
" let g:pymode_lint_signs = 0
" don't fold python code on open
let g:pymode_folding = 1
auto BufNewFile,BufRead *.py setlocal nofoldenable
" don't load rope by default. Change to 1 to use rope
" let g:pymode_rope = 1
" rope (from python-mode) settings
" nmap ,d :RopeGotoDefinition<CR>
" nmap ,o :RopeFindOccurrences<CR>
"
" Annoying errors
let g:pymode_syntax_indent_errors = 0
let g:pymode_syntax_space_errors = 0

" don't let pyflakes allways override the quickfix list
let g:pyflakes_use_quickfix = 0
let g:pymode_lint_onfly = 0
" }}}
" PLUGIN Pandoc {{{

" Possibilities:
" ["formatting", "folding", "bibliographies", "completion",
" "metadata", "menu", "executors", "motions"]
let g:pandoc#modules#disabled = ['menu', 'keyboard']
" let g:pandoc#biblio#bibs = ["/Users/Brett/Dropbox/library.bib"]
let g:pandoc#biblio#bibs = ["./references.bib"]
let g:pandoc#folding#fold_yaml = 1

" Don't do this for now.
let g:pandoc#syntax#conceal#use = 0
let g:pandoc_use_embeds_in_codeblocks_for_langs = ["yaml"]
" let g:pandoc#syntax#conceal#blacklist = [
  " titleblock image block subscript superscript strikeout atx codeblock_start codeblock_delim footnote definition list newline dashes ellipses quotes inlinecode
"

" }}}
" PLUGIN TagBar {{{
" toggle Tagbar display
" nmap ,t :TagbarToggle<CR>
" autofocus on Tagbar open
" let g:tagbar_compact = 1
" let g:tagbar_expand = 1
let g:tagbar_sort = 0
let g:tagbar_singleclick = 1
" let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 0
let g:tagbar_left = 1
let g:tagbar_width=50
let g:tagbar_type_pandoc = {
	\ 'ctagstype' : 'pandoc',
	\ 'kinds' : [
		\ 'h:Heading',
		\ 't:TODO',
	\ ],
    \ 'sort' : 0,
\ }

" Get rid of this annoying autocommand
" autocmd! TagbarAutoCmds CursorHold
" autocmd BufEnter * nested :call tagbar#autoopen(0)
        " \ 'deffile' : expand('<sfile>:p:h:h') . '/ctags/latex.cnf'
" }}}
" PLUGIN IndentGuides {{{
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
  " let g:indent_guides_enable_on_vim_startup = 0
" }}}
" FOLDING {{{
fu! CustomFoldText()
     "get first non-blank line
     let fs = v:foldstart
     while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
     endwhile
     if fs > v:foldend
         let line = getline(v:foldstart)
     else
         let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    " let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf
set foldtext=CustomFoldText()

" }}}
" PLUGIN Ultisnips {{{
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-t>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"

"}}}
" PLUGIN Jedi {{{

" Get rid of the preview
let g:jedi#auto_vim_configuration = 1
set completeopt=menuone,longest

" Don't use command-space
" let g:jedi#completions_command = "<C-N>"
let g:jedi#usages_command = "<leader>U"
let g:jedi#goto_assignments_command = "<leader>D"

" Currently broken?
" let g:jedi#show_call_signatures = 0

" }}}
" PLUGIN Unite {{{
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
    " Overwrite settings.
    nmap <buffer> <c-c>   <Plug>(unite_exit)
    imap <buffer> <c-c>   <Plug>(unite_exit)
endfunction

" silent nunmap <Leader>n
" nnoremap <leader>n :<C-u>Unite -no-split -buffer-name=recfiles -start-insert file_rec/async<cr>
nnoremap <leader>n :<C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert file_rec/async:!<cr>
nnoremap <leader>N :<C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert file_rec<cr>
" nnoremap <leader>n :<C-u>Unite -no-split -buffer-name=recfiles -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>UniteWithBufferDir -no-split -no-auto-resize -ignorecase -start-insert file<cr>
nnoremap <leader>F :<C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert file<cr>
nnoremap <leader>b :silent Unite -no-split -no-auto-resize -ignorecase -start-insert buffer<cr>
" call unite#custom#profile('outline', 'smartcase', 0)
nnoremap <leader>t :silent <C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert outline<cr>
nnoremap <leader>o :<C-u>Unite -no-split -no-auto-resize -ignorecase -start-insert outline<cr>
" nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=tags -start-insert tag<cr>
" Use ag for search
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <leader>a :<C-u>Unite -no-split -no-auto-resize -buffer-name=grep grep<cr>
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\.o$\|\.pyc$\|\.idea/*\|\.rope/*\|.cache/*\|.__pycach*\|\attic/|\.git/')

nnoremap <leader>T :<C-u>Unite -no-split -buffer-name=tags -start-insert outline<cr>

" }}}
" PLUGIN Neocomplete {{{

" let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 4
" let g:neocomplete#keyword_patterns._ = '^\\\?\h\w*$'

" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return pumvisible() ? "\<C-y>" : "\<CR>"
" endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
"
" Vim tex
" if !exists('g:neocomplete#sources#omni#input_patterns')
"     let g:neocomplete#sources#omni#input_patterns = {}
" endif
"
" let g:neocomplete#sources#omni#input_patterns.tex =
"     \ '\v\\%('
"     \ . '\a*cite\a*%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"     \ . '|\a*ref%(\s*\{[^}]*|range\s*\{[^,}]*%(}\{)?)'
"     \ . '|includegraphics\*?%(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"     \ . '|%(include%(only)?|input)\s*\{[^}]*'
"     \ . ')'

" if !exists('g:neocomplete#sources')
"     let g:neocomplete#sources = {}
" endif
" let g:neocomplete#sources._ = ['buffer']
" let g:neocomplete#sources.tex= ['omni', 'file', 'buffer']

" autocmd FileType python setlocal omnifunc=jedi#completions
" let g:jedi#completions_enabled = 0
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#smart_auto_mappings = 0
" let g:neocomplete#force_omni_input_patterns.python =
"     \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" }}}

" PLUGIN Syntastic {{{

" let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_checkers=['pyflakes', 'vulture']
" let g:syntastic_python_checkers=['prospector']
"
" Disable
" 401: multiple imports
" 501: long lines
let g:syntastic_python_checker_args='--W-no-ignore=E401,E501'
" let g:syntastic_cpp_compiler_options = '-Wno-c++11-extensions'
let g:syntastic_cpp_compiler_options="-std=c++11 -stdlib=libc++"

let g:syntastic_error_symbol = 'X'
let g:syntastic_warning_symbol = '!'
" let g:syntastic_error_symbol = '✗'
" let g:syntastic_warning_symbol = '⚠'
let g:syntastic_c_include_dirs = ['/usr/include/c++/4.2.1', '/usr/include/c++/4.2.1/tr1']

" include=.,/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1,/usr/local/include
" path=.,/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1,/usr/local/include

" Not really the best option -- but it stops annoying stuff in my config file.
" What would be better is to disable certain errors!
autocmd FileType python if expand('%:e') == "cfg" |
    \let b:syntastic_checkers = [] | endif

" Default: [Syntax: line:%F (%t)]
let g:syntastic_stl_format = '[%t @%F]'

" }}}
" PLUGIN Move {{{
let g:move_key_modifier = 'C'
" }}}
" PLUGIN Surround {{{
let g:surround_{char2nr('c')} = "\\\1command\1{\r}"
" }}}
" PLUGIN Vimtex {{{
"
let g:vimtex_fold_enabled=1
let g:vimtex_fold_manual=1

" Use Skim
if has("macunix")
    let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
    let g:vimtex_view_general_options = '-r @line @pdf @tex'
    let g:vimtex_view_general_options_latexmk = '-r 1'
endif

" Ignore annoying shite
" let g:vimtex_quickfix_ignored_warnings = [
"     \ 'Underfull',
"     \ 'Overfull',
"     \ 'specifier changed to',
"     \ 'Marginpar on page',
"     \ 'Package hyperref Warning'
"     \ ]

" Use an output dir -- so much cleaner
let g:vimtex_latexmk_build_dir = 'output'

" Don't continuously build -- it is a pain. But do stuff in the background.
" let g:vimtex_latexmk_continuous = 0
" let g:vimtex_latexmk_background = 1

let g:vimtex_compiler_latexmk = {
    \ 'background' : 0,
    \ 'build_dir' : 'output',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'options' : [
    \   '-pdf',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:vimtex_quickfix_latexlog = {
        \ 'default' : 1,
        \ 'general' : 1,
        \ 'overfull' : 0,
        \ 'underfull' : 0,
        \ 'packages' : {
        \   'default' : 1,
        \   'natbib' : 1,
        \   'biblatex' : 1,
        \   'babel' : 1,
        \   'hyperref' : 0,
        \   'scrreprt' : 1,
        \   'fixltx2e' : 1,
        \   'titlesec' : 1,
        \ },
        \}

"}}}
" PLUGIN Pytest / Test {{{
let test#strategy = "vimux"
let g:VimuxOrientation = "h"
" }}}
" PLUGIN Dash {{{
    nmap <silent> <leader>m <Plug>DashSearch
" }}}
" PLUGIN Git Plugins {{{
" Gitv
let g:Gitv_WipeAllOnClose = 1

" Fugitive, GitGutter and Gitv mappings
nmap <leader>gg :Gstatus<cr>
nmap <leader>gt :GitGutterToggle<cr>
nmap <leader>gs :GitGutterStageHunk<cr>
nmap <leader>gv :Gitv<cr>
nmap <leader>gn :GitGutterNextHunk<cr>
nmap <leader>gp :GitGutterPrevHunk<cr>
" }}}
" PLUGIN Notes {{{
let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_suffix = '.txt'
" }}}
" Colorschemes {{{
let g:pencil_neutral_headings = 0
" }}}


nmap <leader>c :TComment<cr>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" let s:hidden_all = 0
" function! ToggleHiddenAll()
"     if s:hidden_all  == 0
"         let s:hidden_all = 1
"         set noshowmode
"         set noruler
"         set laststatus=0
"         set noshowcmd
"         set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h18
"         set linespace=2
"         set cmdheight=2
"         GitGutterDisable
"         set foldcolumn=0
"         set columns=76
"         colorscheme solarized
"     else
"         let s:hidden_all = 0
"         set showmode
"         set ruler
"         set laststatus=2
"         set showcmd
"         set guifont=Sauce\ Code\ Powerline:h15
"         set linespace=0
"         GitGutterEnable
"         set cmdheight=1
"         set columns=999
"         colorscheme solarized
"     endif
" endfunction
"
" nnoremap <S-h> :call ToggleHiddenAll()<CR>

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<esc>]50;CursorShape=2\x7"
endif

" vim: fdm=marker
