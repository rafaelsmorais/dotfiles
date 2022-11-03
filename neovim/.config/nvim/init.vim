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
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-table-mode'
Plug 'preservim/nerdtree'
call plug#end()

"Autostart NerdTree and put cursor back in the window
autocmd VimEnter * NERDTree | wincmd p

"NerdTree keybindings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" VimWiki + Nextcloud Notes
let g:vimwiki_list = [{'path': '~/Nextcloud/Notas/',
                       \ 'syntax': 'markdown', 'auto_toc' : 1,
                       \ 'ext': '.md'}]

" colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

" lightline config
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
