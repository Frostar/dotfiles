set guifont=Meslo\ LG\ S\ for\ Powerline:h12 

" Let grep always generate filename (Vim-Latex recommend)
set grepprg=grep\ -nH\ $*

" Vim-Latex, associate .tex with LaTeX
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_ViewRule_pdf = 'open -a Preview'
let g:Tex_CompileRule_pdf = 'latexmk -pdf'
let g:TCLevel = 4
let g:Tex_GotoError=0
