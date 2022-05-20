call plug#begin("~/.config/nvim/plugged")
" ALE (linter)
Plug 'dense-analysis/ale'
" LightLine (status/tabline plugin)
Plug 'itchyny/lightline.vim'
" COC (Code completion)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Colorschemes
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
call plug#end()

source ~/.config/nvim/coc_config.vim

let g:termdebug_wide=1

" Colorscheme settings
set termguicolors
let g:lightline = {} 
let g:lightline.colorscheme = 'gruvbox'
colorscheme gruvbox

" Misc Settings
set noshowmode
set number
set tabstop=4
set shiftwidth=4
set matchtime=0
set cmdheight=1

" Tab Settings
set showtabline=1


" Search settings
set noic
set incsearch
set hlsearch

