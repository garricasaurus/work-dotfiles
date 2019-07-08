syntax on
set nowrap
set number
set ruler
set cursorline
set tabstop=4
set shiftwidth=4

call plug#begin('~/.local/share/nvim/plugged')
   
	" powerline
	Plug 'vim-airline/vim-airline'
	let g:airline_powerline_fonts = 1

	" auto complete
	if has('nvim')
		Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	else
		Plug 'Shougo/deoplete.nvim'
		Plug 'roxma/nvim-yarp'
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	let g:deoplete#enable_at_startup = 1

	" auto-close
	Plug 'townk/vim-autoclose'

call plug#end()
