
hi clear
set background=dark
if exists("syntax_on")
    syntax reset
endif
set termguicolors

let g:colors_name='indomitable'
hi Normal guibg=#212121
hi Normal guifg=#e6e6e6 guibg=NONE gui=NONE
hi @punctuation guifg=#999999 guibg=NONE gui=NONE
hi Statement guifg=#d35568 guibg=NONE gui=NONE
hi Function guifg=#d3a355 guibg=NONE gui=NONE
hi String guifg=#a5d355 guibg=NONE gui=NONE
hi Constant guifg=#55d3c2 guibg=NONE gui=NONE
hi Comment guifg=#5585d3 guibg=NONE gui=NONE
hi! link Identifier Normal
hi! link LineNr Normal
hi! link @type Normal
hi! link @include Statement
hi! link @type.builtin Statement
hi! link @constructor Function
hi! link @function.builtin Function
hi! link @function.call Function
hi! link @constant.builtin Constant
