syntax on
" colorscheme nord
" colorscheme nvcode
" colorscheme onedark
" colorscheme TSnazzy
" colorscheme aurora
jellybeans-vim

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif