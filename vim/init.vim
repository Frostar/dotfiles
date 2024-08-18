" Should be placed in / linked to ~/.config/nvim/init.vim
"""
" PLUGINS
"""
call plug#begin("~/.vim/plugged")
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'sjl/badwolf'
    Plug 'itchyny/lightline.vim'
    Plug '844196/lightline-badwolf.vim'
    Plug 'itchyny/vim-gitbranch'

    Plug 'neovim/nvim-lspconfig'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip users.
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
call plug#end()

" Plugin Configuration
" let g:deoplete#enable_at_startup = 1
let g:lightline = {
            \ 'colorscheme' : 'badwolf',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
            \ },
            \ 'component_function': {
            \   'gitbranch': 'gitbranch#name'
            \ },
            \ }

"""
" NEOVIM CONFIGURATION
"""
" Pull common vim configuration
source ~/.vim.common

" Colorscheme
syntax on
colorscheme badwolf

" Highlight trailing
set hlsearch
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" NERDTree
let NERDTreeShowHidden=1
