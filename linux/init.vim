"Generic stuff
let mapleader=","
set lazyredraw
set relativenumber
set ignorecase
set sts=2
set ts=2
set sw=2

"windows navigation
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if(t:curwin == winnr())
    if(match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"search settings 
set incsearch
set hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"Plugins
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'kaicataldo/material.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'scrooloose/nerdcommenter'
	Plug 'ervandew/supertab'
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --clang-completer --rust-completer' }

	Plug 'mattn/emmet-vim'
	Plug 'posva/vim-vue'
	Plug 'ObserverOfTime/scss.vim', {'for': 'scss'}
call plug#end()

"NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI=1
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['vue'] = '42b883'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

"NerdCommenter
map <C-_> <Plug>NERDCommenterToggle

"True Colors
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

"ColorScheme
let g:material_theme_style = 'dark'
let g:lightline = { 'colorscheme': 'material_vim' }
set background=dark
colorscheme material

"Languages
au BufRead,BufNewFile *.scss set filetype=scss.css

"Custom keybindings
nmap <leader>b :!bash %<CR>
