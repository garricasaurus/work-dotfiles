" swap <caps> and <esc> for the session 
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" basic settings
set number
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4

syntax on
