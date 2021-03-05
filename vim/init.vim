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
