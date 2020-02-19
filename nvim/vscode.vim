call plug#begin()
Plug 'tpope/vim-surround'
Plug 'machakann/vim-swap'
Plug 'asvetliakov/vim-easymotion'
call plug#end()

set autoindent
set smarttab
set shiftwidth=2
set tabstop=2
set expandtab
set splitright
set foldlevel=99
set foldmethod=indent
" Ignore case when searching
set ignorecase
set smartcase
" Highlight search results
set hlsearch
" akes search act like search in modern browsers
set incsearch
set wildignore+=node_modules/**
set wildignore+=packages/**
set wildignore+=3rdparty/**
set wildignore+=bower_components/**
set wildignore+=coverage/**
set wildignore+=tags
set wildignore+=target/**
set wildignore+=.teamcity/**
let mapleader = " "

let g:EasyMotion_smartcase = 1

nnoremap ' `
nnoremap ` '
nnoremap ; :
nnoremap : ;
noremap + <C-A>
noremap - <C-X>
nnoremap <C-A> mzgg^V$G

xmap gc <Plug>VSCodeCommentary
nmap gc <Plug>VSCodeCommentary
omap gc <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

nnoremap <Leader><Space> :call VSCodeNotify('workbench.action.showCommands')<CR>
nnoremap <silent> <Leader>rn :<C-u>call VSCodeNotify('editor.action.rename')<CR>

" <Leader>c{char} to move to {char}
nmap <Leader>c <Plug>(easymotion-bd-f)
" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>t <Plug>(easymotion-t2)
" Move to line
nmap <Leader>l <Plug>(easymotion-bd-jk)
" Move to word
nmap <Leader>w <Plug>(easymotion-bd-w)
