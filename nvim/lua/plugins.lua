local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('preservim/nerdtree')      -- file browser
Plug('itchyny/lightline.vim')   -- powerline
Plug('tpope/vim-fugitive')      -- git helper
Plug('EdenEast/nightfox.nvim')  -- color theme

vim.call('plug#end')
