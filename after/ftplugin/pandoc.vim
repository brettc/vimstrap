setlocal wrap
setlocal fo=r
nnoremap <buffer> j gj
nnoremap <buffer> k gk
vnoremap <buffer> j gj
vnoremap <buffer> k gk
" nnoremap <Down> gj
" nnoremap <Up> gk
" vnoremap <Down> gj
" vnoremap <Up> gk
" inoremap <Down> <C-o>gj
" inoremap <Up> <C-o>gk 
setlocal spell
setlocal display+=lastline
setlocal showbreak= 
setlocal complete-=k
setlocal complete+=kspell
" setlocal cursorline

" set linespace=9
" set guifont=Cousine:h17
" set laststatus=0
" set columns=78

let g:tagbar_autoclose = 1
let g:tagbar_width = 50

set foldcolumn=0


" nmap ,t :TagbarOpen<CR>
setlocal spell

map <F5> ]s
setlocal breakindent
setlocal breakindentopt=shift:2

hi link pdcBiblio String
hi link pdcBlockquote Include
hi Folded gui=underline
hi link pandocAtxHeader Underlined
