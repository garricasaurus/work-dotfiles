" basic settings
set nonumber
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4

" disable temp files for  gopass
au BufNewFile,BufRead /dev/shm/gopass.* setlocal noswapfile nobackup noundofile

syntax on
