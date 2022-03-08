-- auto-download vim-plug, and install plugins if needed
vim.cmd [[
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
     silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
     autocmd!
     autocmd VimEnter * PlugInstall
   endif
]]

local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug('preservim/nerdtree')      -- file browser
Plug('itchyny/lightline.vim')   -- powerline
Plug('tpope/vim-fugitive')      -- git helper
Plug('ctrlpvim/ctrlp.vim')      -- finder

Plug('fatih/vim-go', {          -- vim-go
    ['do'] = ':GoUpdateBinaries'
})

Plug('EdenEast/nightfox.nvim')  -- color theme

vim.call('plug#end')


