call plug#begin('~/.local/share/nvim/plugged')
   Plug 'vim-airline/vim-airline'
   Plug 'lervag/vimtex'
   Plug 'neomake/neomake'
call plug#end()

let g:airline_powerline_fonts = 1
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'mupdf'
