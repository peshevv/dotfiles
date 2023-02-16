call plug#begin("~/.config/nvim/plugged")
" Git Plugins
Plug 'tpope/vim-fugitive'
" Go Plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" ALE (linter)
Plug 'dense-analysis/ale'
" LightLine (status/tabline plugin)
Plug 'itchyny/lightline.vim'
" COC (Code completion)
" Colorschemes
Plug 'morhetz/gruvbox'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Gutentags
Plug 'ludovicchabant/vim-gutentags'
" Tagbar
Plug 'preservim/tagbar'
call plug#end()

let g:termdebug_wide=1

" Colorscheme settings
set termguicolors
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }
colorscheme gruvbox

" Leader keybinds
noremap <Space> <Nop>
map <Space> <Leader>
nnoremap <Leader>b :buffers<CR>:buffer<Space>

" Misc Settings
set noshowmode
set number
set tabstop=4
set shiftwidth=4
set matchtime=0
set cmdheight=1
set autochdir

" Tab Settings
set showtabline=1

" Nav Settings"
"nnoremap j 10j
"vnoremap j 10j
"nnoremap k 10k
"vnoremap k 10k

" Search settings
set noic
set incsearch
set hlsearch

" FZF Settings
" nnoremap <Leader>f :GFiles<Cr>
nnoremap <Leader>g :Rg<Cr>

" YCM Settings
set completeopt-=preview

" Tagbar Settings
nnoremap <Leader>t :TagbarToggle<Cr>
nnoremap <Leader>ff g<C-]>
nnoremap <Leader>ft <C-w><C-]><C-w>T

" Go Settings
let g:go_fmt_command='goimports'
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>dd <Plug>(go-def)

" Google style required setting
:set nofixendofline

" Statusline


