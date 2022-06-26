call plug#begin()
" Go Plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" ALE (linter)
Plug 'dense-analysis/ale'
" LightLine (status/tabline plugin)
Plug 'itchyny/lightline.vim'
" COC (Code completion)
Plug 'Valloric/YouCompleteMe'
" Colorschemes
Plug 'morhetz/gruvbox'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

let g:termdebug_wide=1

" Colorscheme settings
set termguicolors
let g:lightline = {} 
let g:lightline.colorscheme = 'gruvbox'
colorscheme gruvbox

" Leader keybinds
noremap <Space> <Nop>
map <Space> <Leader>

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

" Go Settings
let g:go_fmt_command='goimports'
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>dd <Plug>(go-def)

" Google style required setting
:set nofixendofline



