""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""
""""""         Settings
""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""



"""""" Plugin installs """""""""""
""""""""""""""""""""""""""""""""""

call plug#begin()

" autocompletion
" """""""""""""""""""""
" deoplete autocomplete tool
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" For func argument completion
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" javascript autocomplete
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
" typescript autocomplete
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'
Plug 'Shougo/vimproc.vim', {'do': 'make'}
Plug 'rudism/deoplete-tsuquyomi'

" linting
" """"""""""""
Plug 'neomake/neomake'

" files
" """"""""""""
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dbakker/vim-projectroot'

" buffers
" """"""""""""
Plug 'jlanzarotta/bufexplorer'
Plug 'mhinz/vim-startify'
Plug 'rbgrouleff/bclose.vim'

" ctags
" """""""""""
Plug 'ludovicchabant/vim-gutentags'

" git
" """""""""""
Plug 'tpope/vim-fugitive'

" editing
" """"""""""""
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'dhruvasagar/vim-table-mode'

" statusline
" """"""""""""""""
Plug 'bling/vim-airline'

" color schemes
" """"""""""""""""""
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mhartington/oceanic-next'

" viewing
" """"""""""""""""
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()



"""""""""" Plugin settings """"""""""
"""""""""""""""""""""""""""""""""""""

" nerdtree
" close vim if nerdtree only window left open
autocmd! bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" set working dir to current file (silently fail because otherwise fugitive
" gets upset)
" (note we could use set autochdir - not sure why i don't)
autocmd BufEnter * silent! lcd %:p:h

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
" call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
let g:deoplete#sources#tss#javascript_support = 1

" neosnippet
let g:neosnippet#enable_completed_snippet = 1

" tern
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]

" tsuquyomi
let g:tsuquyomi_completion_detail = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

" neomake
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_typescript_enabled_makers = ['tslint']
call neomake#configure#automake('w')
"autocmd! BufWritePost * Neomake

" fzf
" run grep in whole git dir
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)

" Ag command with preview (type ? to show in normal view)
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%', '?'),
  \                 <bang>0)

command! -bang -nargs=+ -complete=dir GagAllSrc
        \ call fzf#vim#ag_raw(<q-args> . ' ~/src',
        \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)

" Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

function! s:find_git_root()
	return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

command! ProjectFiles execute 'GFiles' s:find_git_root()

" colorschemes
set background=dark

colorscheme palenight
" let g:palenight_terminal_italics=1

"colorscheme OceanicNext
let g:airline_theme='oceanicnext'



"""""" APP """""""""""
""""""""""""""""""""""

" turn off compatibility mode from vi
set nocompatible

" No annoying sound on errors
set noerrorbells
set t_vb=
set tm=500
command! Nob set vb t_vb=
set vb t_vb=
set visualbell

" show partial commands on the right of the command window
set showcmd

" enable true colors
if (has("termguicolors"))
 set termguicolors
endif

"""""""""" STATUS LINE """""""
""""""""""""""""""""""""""""""

:set laststatus=2



"""""" FORMATTING """"""
""""""""""""""""""""""""

" Line Numbers
set relativenumber
au InsertEnter * set norelativenumber number
au InsertLeave * set relativenumber

" Who doesn't like autoindent?
set autoindent

syntax enable

" tabbing
set smarttab
set shiftwidth=2
set tabstop=2
" Use spaces instead of tabs
set expandtab



""""""" KEYS """""""
""""""""""""""""""""

let mapleader = " "

" omnicomplete shortcut
inoremap <C-Space> <C-x><C-o>

" evil remaps from hell
nnoremap ' `
nnoremap ` '

nnoremap ; :
nnoremap : ;

inoremap jk <ESC>

" select all with ctrl-a
nmap <C-A> mzgg^V$G

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" map control -n to next buffer
nnoremap <C-n> :bnext<CR>

" scroll buffer while keeping cursor on same line relative to viewport
noremap <c-j> j<c-e>
noremap <c-k> k<c-y>

" map ctrl-p to fuzzy file searching in root of git repo
noremap <C-P> :GFiles<CR>
noremap <leader>p :GFiles<CR>

" map leader-f to fuzzy text searching in root of git repo
noremap <leader>f :Gag<CR>
command! Gag :ProjectRootExe Ag



"""""""" BUFFERS """"""""
"""""""""""""""""""""""""

" when :vs the loaded file will show up on the right
set splitright

set foldlevel=99
set foldmethod=indent

autocmd! BufNewFile,BufReadPost *.md set filetype=markdown | set syntax=markdown

" start editing last file
command! GoL :e#

" reader mode
command! ReaderMode :Goyo | :Limelight | set norelativenumber | set nonumber
command! ReaderModeOff :Goyo | :Limelight! | set relativenumber



"""""""" FILES """""""""
""""""""""""""""""""""""

set encoding=utf8
" auto reload changed files (doesn't really work very well)
set autoread

" turn off auto backing up - using google drive or git anyway right? :)
set nobackup
set noswapfile
set nowb
set nowrap
" allow hidden buffers - don't complain about not saving them
set hidden

"enable inline spellcheck
set spelllang=en_gb



"""""""" SEARCHING """""""""
""""""""""""""""""""""""""""

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



""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""
""""""         Commmands
""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""


"""""" PRESENTING """"""
""""""""""""""""""""""""

command! MakeFontBiggest set guifont=Consolas:h18:cANSI
command! MakeFontBigger set guifont=Consolas:h16:cANSI
command! MakeFontBig set guifont=Consolas:h14:cANSI
command! MakeFontNormal set guifont=Consolas:h12:cANSI
command! MakeFontSmall set guifont=Consolas:h10:cANSI



"""""" FORMATTING """"""
""""""""""""""""""""""""

command! AutoIndent :normal mzgg=G'z

function! RemoveTrailingWhitespaceFromFile()
    :let _s=@/
    :%s/\s\+$//e
    :let @/=_s
endfunction

command! RemoveAllTrailingWhitespace call RemoveTrailingWhitespaceFromFile()



"""""""""" Diffing """"""""""
""""""""""""""""""""""""""""""""
command! GetLeft :diffget //2
command! GetRight :diffget //3



"""""""""" JavaScript """"""""""
""""""""""""""""""""""""""""""""

function! GotoImportInCurrentWindow()
    :normal 0f/gf
endfunction

function! GotoImportInNewSplit()
    :normal 0f/
    :wincmd f
endfunction

function! GotoImportInNewVerticalSplit()
    call GotoImportInNewSplit()
    :wincmd L
endfunction

command! GotoImport call GotoImportInCurrentWindow()
command! GotoImportInSplit call GotoImportInNewSplit()
command! GotoImportInVSplit call GotoImportInNewVerticalSplit()

" add .only to current mocha it
nnoremap ton :silent ?it(<CR>la.only<ESC>:noh<CR>
" remove .only to current mocha it
nnoremap tnon :silent ?it.only<CR>lldt(:noh<CR>



"""""""""" JSON """"""""""
""""""""""""""""""""""""""""""""

function! FormatJSONFunc()
  :%!python -m json.tool
endfunction

command! FormatJSON call FormatJSONFunc()



"""""""""" XML """"""""""
""""""""""""""""""""""""""""""""

function! DoPrettyXML()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XML that may contain multiple top-level elements.
    0put ='<PrettyXML>'
    $put ='</PrettyXML>'
    silent %!xmllint --format -
    " xmllint will insert an <?xml?> header. it's easy enough to delete
    " if you don't want it.
    " delete the fake tags
    2d
    $d
    " restore the 'normal' indentation, which is one extra level
    " too deep due to the extra tags we wrapped around the document.
    silent %<
    " back to home
    1
    " restore the filetype
    exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

set mouse=a
