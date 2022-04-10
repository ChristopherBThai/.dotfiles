" Enable most vim settings
set nocompatible
" Confirm when quitting without having written
set confirm

" Change this to enable linting
let g:enable_ale = 0
" Use coc.vim for LSP (perf)
let g:ale_disable_lsp = 1

" ----- Start Plugin Install -----
call plug#begin('~/.local/share/nvim/site/autoload')
" Status bar
Plug 'itchyny/lightline.vim'
" Color Scheme
Plug 'morhetz/gruvbox'
" Coc for autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'fannheyward/coc-styled-components', {'do': 'yarn install --frozen-lockfile'}
" File Tree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Editor Config
Plug 'editorconfig/editorconfig-vim'
" Syntax Checking and Highlighting
Plug 'sheerun/vim-polyglot'
" Fuzzy finding
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Inline Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-rhubarb'
" Global find and replace
Plug 'windwp/nvim-spectre'
" Comment blocks
Plug 'preservim/nerdcommenter'
" Multiline Editing
Plug 'mg979/vim-visual-multi'
" Previewer for files - used only for it's vim window implementation
Plug 'rmagatti/goto-preview'
" Linting
if g:enable_ale
  Plug 'dense-analysis/ale'
endif
call plug#end()
filetype plugin indent on

" ----- General Vim Settings -----
set tabstop=2
set shiftwidth=2
set expandtab
set noswapfile
set breakindentopt=shift:2
set foldmethod=syntax         
set foldlevelstart=99
set scrolloff=5
set backspace=indent,eol,start
set ruler
set number
set relativenumber
set showcmd
set incsearch
set hlsearch
set ignorecase " Case-insensitive search
set smartcase  " Smart case-insensitive search (requires ignorecase)
" Always show gutter (dont move left to right)
set signcolumn=yes
" Update git and syntax more quickly
set updatetime=250
syntax on

nnoremap <silent> J :tabp<Enter>
nnoremap <silent> K :tabn<Enter>
nnoremap <silent> j gj
nnoremap <silent> k gk
inoremap <silent> jk <esc>

" ----- Lightline -----
" -- INSERT -- no longer needed
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
		  \              [ 'percent' ],
		  \              [ 'filetype' ] ]
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" ----- Theme (gruvbox) -----

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
set background=dark

" ----- CoC settings -----
" Tab completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Intellisesnse
nmap <silent> gd :PreviewDefinition<CR>
nmap <silent> gy :PreviewTypeDefinition<CR>
nmap <silent> gr <Plug>(coc-references)

" Show documentation (\h)
nnoremap <silent> <leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Rename (\rn)
nmap <leader>rn <Plug>(coc-rename)

" Inline previews (similar to VSCode)
function! OpenPreviewInline(...)
    let fname = a:1
    let call = ''
    if a:0 == 2
        let fname = a:2
        let call = a:1
    endif
    lua require('goto-preview.lib').open_floating_win(fname, { 1, 0 })
    " goto-preview does not actually open the correct file lol
    execute 'e ' . fname

    "" Execute the cursor movement command
    exe call
endfunction
command! -nargs=+ CocOpenPreviewInline :call OpenPreviewInline(<f-args>)

command! -nargs=0 PreviewDefinition :call CocActionAsync('jumpDefinition', 'CocOpenPreviewInline')
command! -nargs=0 PreviewTypeDefinition :call CocActionAsync('jumpTypeDefinition', 'CocOpenPreviewInline')

" BG for inline previews
"hi Pmenu ctermbg=233 guibg=#1d2021

" ----- jistr/vim-nerdtree-tabs -----

" Open/close NERDTree Tabs with t
nmap <silent> T :NERDTreeTabsToggle<CR>
nmap <silent> t :NERDTreeMirror<CR>:NERDTreeFocus<CR>
let NERDTreeShowHidden=1

" Clear gutter bg color
hi clear SignColumn
