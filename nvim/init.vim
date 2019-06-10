call plug#begin('~/.local/share/nvim/plugged')
   
   " powerline
   Plug 'vim-airline/vim-airline'
   let g:airline_powerline_fonts = 1

   " completion engine
   if has('nvim')
     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
   else
     Plug 'Shougo/deoplete.nvim'
     Plug 'roxma/nvim-yarp'
     Plug 'roxma/vim-hug-neovim-rpc'
   endif
   let g:deoplete#enable_at_startup = 1

   " snippet support
   Plug 'Shougo/neosnippet.vim'
   Plug 'Shougo/neosnippet-snippets'
   imap <C-k>     <Plug>(neosnippet_expand_or_jump)
   smap <C-k>     <Plug>(neosnippet_expand_or_jump)
   xmap <C-k>     <Plug>(neosnippet_expand_target)
   smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
   \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
   if has('conceal')
     set conceallevel=2 concealcursor=niv
   endif

   " latex
   Plug 'lervag/vimtex'
   let g:tex_flavor = 'latex'
   let g:vimtex_view_method = 'mupdf'
   let &rtp = '~/.local/share/nvim/plugged/vimtex,' . &rtp
   let &rtp .= ',~/.local/share/nvim/plugged/vimtex/after'

   " golang
   Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()
