" setlocal tags=./tags,../tags,../../tags
setlocal tags=tags;/
" ,~/.pythontags
" setlocal fo+=tcr
" setlocal comments=l:#
compiler python
map <F5> :call PythonMake()<cr>
map <s-f5> :silent !python %<cr>
map <F6> :Pytest function<cr>
map <s-F6> :Pytest function -s<cr>
" map <F6> :TestNearest<cr>
" map <s-F6> :TestNearest -s<cr>

setlocal complete+=t
setlocal formatoptions-=t
setlocal nowrap
setlocal textwidth=78
setlocal commentstring=#%s

" hi link pythonFunction Statement
" hi link pythonClass Statement
" hi link pythonStatement Function
