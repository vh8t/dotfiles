if exists("b:current_syntax")
  finish
endif

syn keyword xylKeyword dup drop swap inc dec castc return if end else syscall while do derefc derefi proc in buffer
syn keyword xylType int char bool ptr void
syn keyword xylBoolean true false

syn region xylCharacter start=+'+ skip=+\\\\\|\\'+ end=+'+
syn region xylString start=+"+ skip=+\\\\\|\\'+ end=+"+ contains=xylEscape

syn match xylEscape "\\\\.\|\\[nrtbf\"']"
syn match xylImportKeyword "import"
syn match xylNumber "\<\d\+"
syn match xylOperator "[+\-*/<>=!]"

syn match xylTodo "TODO"
syn match xylNote "NOTE"
syn match xylXXX "XXX"
syn match xylFixMe "FIXME"
syn match xylHack "HACK"
syn match xylCommentNote "@\<\w\+\>" contained display

syn region xylComment start=/#/ end=/$/ contains=xylCommentNote,xylTodo,xylNote,xylXXX,xylFixMe,xylHack

hi def link xylTodo Todo
hi def link xylNote Todo
hi def link xylXXX Todo
hi def link xylFixMe Todo
hi def link xylHack Todo
hi def link xylKeyword Keyword
hi def link xylType Type
hi def link xylBoolean Boolean
hi def link xylCharacter Character
hi def link xylString String
hi def link xylEscape SpecialChar
hi def link xylImportKeyword PreProc
hi def link xylNumber Number
hi def link xylOperator Operator
hi def link xylComment Comment

let b:current_syntax = "xylia"
