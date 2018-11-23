set nocompatible
"colorscheme badwolf
filetype off 
set encoding=utf-8 
set rtp+=~/.vim/bundle/Vundle.vim
syntax on

setlocal noexpandtab shiftround autoindent
setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4
set autoindent
set breakindent
set breakindentopt=shift:2
set number
set relativenumber
set nosmd
set ignorecase

call vundle#begin()
filetype plugin indent on

Plugin 'VundleVim/Vundle.vim'
""add plugins here
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'Shougo/vimfiler.vim'
"Plugin 'hail2u/vim-css3-syntax'
"Plugin 'tclem/vim-arduino'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'flazz/vim-colorschemes'
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'
Plugin 'francoiscabrol/ranger.vim'

call vundle#end()
filetype plugin indent on

"Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1

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

""Java
autocmd Filetype java set makeprg=javac\ %
autocmd Filetype java set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
autocmd Filetype java map <F5> :make<Return>:copen<Return>
autocmd Filetype java map <F6> :!java %:t:r<Return>
autocmd FileType java :command R w | !javac % | !java %

