setlocal wrap
setlocal fo=r
nnoremap <buffer> j gj
nnoremap <buffer> k gk
vnoremap <buffer> j gj
vnoremap <buffer> k gk

" Function for smart-quotes: double
function! s:TexQuotes()
    if getline('.')[0:col(".")] =~ '\(^\|[^\\]\)%'
       let kinsert = "\""
    else
        let kinsert = "\'\'"
        let left = getline('.')[col('.')-2]
        if left =~ '^\(\|\s\|{\|(\|\[\|&\)$'
            let kinsert = "\`\`"
        elseif left == "\\"
            let kinsert = "\""
        endif
    endif
    return kinsert
endfunction
" mapping for quotation marks
inoremap <buffer> " <C-R>=<SID>TexQuotes()<CR>

" Function for smart-quotes: single
function! s:TexSingQuotes()
    if getline('.')[0:col(".")] =~ '\(^\|[^\\]\)%'
       let schminsert = "'"
    else
        let schminsert = "'"
        let left = getline('.')[col('.')-2]
        if left =~ '^\(\|\s\|{\|(\|\[\|&\)$'
            let schminsert = '`'
        endif
    endif
    return schminsert
endfunction
" mapping for single quotation mark
inoremap <buffer> ' <C-R>=<SID>TexSingQuotes()<CR>

let g:vimtex_quickfix_ignored_warnings = [
    \ 'Underfull',
    \ 'Overfull',
    \ 'specifier changed to',
    \ 'Marginpar on page',
    \ ]

