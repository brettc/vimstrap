" syntax match footnote "\v\\footnote(text)?\{[^}]+}"
" highlight link footnote Comment

syn match texSectioningCommand '\\\(sub\)\{-\}section\>' skipwhite     nextgroup=texSectioningTitle contains=@texSectioningGroup
syn region texSectioningTitle        start='{'  end='}' contained
syn cluster texSectioningGroup contains=texSectioningCommand
syn cluster texChapterGroup contains=@texSectioningGroup

hi texSectioningTitle gui=underline,bold
" hi link texSectioningTitle Underlined
