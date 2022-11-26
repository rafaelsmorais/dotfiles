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
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'patstockwell/vim-monokai-tasty'
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

" colorschemes
"autocmd vimenter * ++nested colorscheme gruvbox
let g:vim_monokai_tasty_italic = 1
let g:vim_monokai_tasty_machine_tint = 1
colorscheme vim-monokai-tasty

" lightline config
let g:lightline = {}
"let g:lightline.colorscheme = 'gruvbox'
let g:lightline.colorscheme = 'monokai_tasty'
