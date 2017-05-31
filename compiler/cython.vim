" Vim compiler file
" Compiler:		Cython
" Maintainer:   Brett Calcott
" Last Change:  2010-11-04

if exists("current_compiler")
  finish
endif
let current_compiler = "cython"

let s:cpo_save = &cpo
set cpo-=C

setlocal makeprg=cython\ --cplus

" /Users/brett/Code/goldschmidt/cybox2d/_core.pxd:19:50: 'b2BodyDef' is not a type identifier
setlocal errorformat=%f:%l:%c:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save

"vim: ft=vim
