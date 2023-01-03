set number
set relativenumber
set nocompatible
set clipboard+=unnamedplus
set mouse=a
set noshowmode "for lightline
"set tabstop=4
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab  smarttab autoindent
set scrolloff=8
set signcolumn=yes
syntax on

" vim plug plugins
call plug#begin()
Plug 'sainnhe/gruvbox-material'
Plug 'itchyny/lightline.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
call plug#end()

"let nerdtree show hidden files
let NERDTreeShowHidden=1

"Autostart NerdTree and put cursor back in the window
"autocmd VimEnter * NERDTree | wincmd p

"Exit Vim if NERDTree is the only window remaining in the only tab.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"NerdTree keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"Colorscheme
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
colorscheme gruvbox-material
let g:lightline = {'colorscheme' : 'gruvbox_material'}
