let current_compiler="pytest"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" CompilerSet efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
CompilerSet efm=\|\|\ %f:%l:%m
" set efm=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#
CompilerSet makeprg=python
" setlocal makeprg=python
