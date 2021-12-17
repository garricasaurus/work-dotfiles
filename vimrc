set nocompatible

" basic settings
set ruler
set number
set showcmd
set expandtab
set shiftwidth=4
set tabstop=4

syntax on

" disable temp files for  gopass
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

