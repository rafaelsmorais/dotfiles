" show line numbers
set number
set relativenumber
" use system clipboard
set clipboard+=unnamedplus
" set mouse on for all modes
set mouse=a
" don't show status bar for lightline
set noshowmode

" vim plug plugins
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'preservim/nerdtree'
call plug#end()

"let nerdtree show hidden files
let NERDTreeShowHidden=1

"Autostart NerdTree and put cursor back in the window
autocmd VimEnter * NERDTree | wincmd p

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"NerdTree keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

" lightline config
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
