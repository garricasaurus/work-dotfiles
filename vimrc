syntax on
filetype plugin on
filetype indent on

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}
call plug#end()

set grepprg=grep\ -nH\ $*
let g:tex_flavor = 'latex'
let g:livepreview_previewer = 'mupdf'
let g:powerline_pycmd = 'py3'
