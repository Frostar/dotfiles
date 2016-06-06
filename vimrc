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

" fix backspace
set backspace=2

" identation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Autoread changes in file
" set autoread

" invoke plugin depending on filetype
filetype plugin on

" terminal colors
set t_Co=256

" airline appear altime
set laststatus=2
" airline config
let g:airline_theme='badwolf'
let g:airline_powerline_fonts=1
let g:airline#extension#enable#branch=1
let g:airline_exclude_preview = 1

" for C-language files use the default YouCompleteMe conf
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" YouCompleteMe preview handling
" let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

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

