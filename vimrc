" Pathogen bundle autorload
execute pathogen#infect()

" Syntax color for type
syntax on


" linenumbers
set number

" textwidth 80, standard for most code
" set textwidth=80

" identation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Autoread changes in file
" set autoread

" terminal colors
set t_Co=256

" airline appear altime
set laststatus=2
" airline config
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1
let g:airline_enable_branch=1


" hlsearch trailing
set hlsearch

" colorscheme ala sublime monokai
colorscheme molokai

" trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/


