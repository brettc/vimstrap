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
setlocal breakindent
setlocal complete-=k
setlocal complete+=kspell
setlocal cursorline
