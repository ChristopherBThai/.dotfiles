set nocompatible
set background=dark
"colorscheme badwolf
filetype off 
set encoding=utf-8 
set rtp+=~/.vim/bundle/Vundle.vim
" fzf
set rtp+=~/.fzf

syntax on

set shiftround
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set breakindent
set breakindentopt=shift:2
set number
set relativenumber
set nosmd
set ignorecase
set cursorline
set incsearch
set hlsearch
set showmatch
set scrolloff=5


call vundle#begin()
filetype plugin indent on

Plugin 'VundleVim/Vundle.vim'
""add plugins here
Plugin 'scrooloose/nerdtree'
"Plugin 'storyn26383/vim-vue'
Plugin 'leafOfTree/vim-vue-plugin'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/vimfiler.vim'
"Plugin 'hail2u/vim-css3-syntax'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
"Plugin 'tclem/vim-arduino'
"Plugin 'xolox/vim-notes'
"Plugin 'xolox/vim-misc'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'junegunn/fzf.vim'

call vundle#end()
filetype plugin indent on

"Powerline font
let g:powerline_pycmd = 'py3'
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
if !exists('g:airline_symbols')
		let g:airline_symbols = {}
endif
let g:Powerline_symbols = 'fancy'
let g:airline_symbols.linenr = 'Ξ'

"Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
"let g:Powerline_symbols='unicode'

"Vim Arduino
au BufRead,BufNewFile *.pde set filetype=arduino
au BufRead,BufNewFile *.ino set filetype=arduino

"Vim Notes
let g:notes_suffix = '.noteV'
let g:dir = expand('%:p:h:t')
let g:name = expand('%:r:t')
au BufReadPost,BufNewFile *.note :w | :execute ':Note '.g:dir.'-'me

"Vim ranger
let g:ranger_map_keys = 0
command T RangerNewTab

"Shortcuts
nnoremap J :tabp<Enter>
nnoremap K :tabn<Enter>
nnoremap j gj
nnoremap k gk
inoremap jk <esc>

" fzf
nnoremap <C-p> :Files <Enter>
let g:fzf_action = {'enter': 'tab split' }
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
"command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)
"command! -bang -nargs=? Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? Rg call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case -g "!README.md" -g "!package.json" -g "!package-lock.json" -- '.shellescape(<q-args>), 1, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)
nnoremap <C-S-f> :Rg<Enter>

"Nerdtree
let NERDTreeShowHidden=1
