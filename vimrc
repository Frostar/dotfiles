" Pathogen bundle autorload
execute pathogen#infect()

" Syntax color for type
syntax on


" linenumbers
set number

" textwidth 80, standard for most code
" set textwidth=80

" Highlight cursor line
set cursorline

" Remap arrow keys nothing
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>


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
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
let g:airline#extension#enable#branch=1


" hlsearch trailing
set hlsearch

" colorscheme badwolf
colorscheme badwolf

" trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Open NERDtree if no files specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

