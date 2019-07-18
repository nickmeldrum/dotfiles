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
Plug 'benjie/local-npm-bin.vim'

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
Plug 'machakann/vim-swap'
Plug 'easymotion/vim-easymotion'
Plug 'dhruvasagar/vim-table-mode'

" statusline
" """"""""""""""""
Plug 'bling/vim-airline'

" color schemes
" """"""""""""""""""
Plug 'rainglow/vim'
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
let g:neomake_typescript_enabled_makers = ['eslint']

"let g:neomake_typescript_enabled_makers = ['tslint']
"let b:neomake_typescript_tslint_exe = split(system('git rev-parse --show-toplevel 2> /dev/null'), '\n')[0] . '/node_modules/.bin/tslint'

function! DoGdwTypescriptSetup()
  let gitdir = split(system('git rev-parse --show-toplevel 2> /dev/null'), '\n')[0]
  let packagedir = join(split(findfile('package.json', '.;'), '/')[:-2], '/')
  if packagedir == ''
    let packagedir = '.'
  else
    let packagedir = '/' . packagedir
  endif

  let g:neomake_typescript_gdwlint_maker = {
      \ 'exe': gitdir . '/node_modules/.bin/tslint',
      \ 'auto_enabled': 1,
      \ 'args': ['--project', packagedir . '/tsconfig.build.json', '--config', gitdir . '/tslint.json', '--format', 'prose'],
      \ 'errorformat': '%-G,'
          \ .'%EERROR: %f:%l:%c - %m,'
          \ .'%WWARNING: %f:%l:%c - %m,'
          \ .'%EERROR: %f[%l\, %c]: %m,'
          \ .'%WWARNING: %f[%l\, %c]: %m',
      \ }

  let g:neomake_typescript_enabled_makers = ['gdwlint']
  Neomake
endfunction

command! GdwTypescriptSetup call DoGdwTypescriptSetup()
autocmd! BufRead,BufEnter,BufNewFile /Users/nicholasmeldrum/src/gdw/* GdwTypescriptSetup

"let g:neomake_verbose=3
"let g:neomake_logfile='/Users/nicholasmeldrum/neomake_error.log'

call neomake#configure#automake('rnw', 200)
command! Fix :w | silent execute "!" . "npx eslint" . " " . bufname("%") . " --fix" | :e
nnoremap <leader>j :Fix<CR>

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

" airline
let g:airline_theme='oceanicnext'
let g:airline#extensions#branch#displayed_head_limit = 10

" colorschemes
set background=dark

colorscheme palenight
let g:palenight_terminal_italics=1



"""""" APP """""""""""
""""""""""""""""""""""

" turn off compatibility mode from vi
set nocompatible

" modelines = feature to set vim features based on lines in opened file -
" potential security vulnerability
set nomodeline

" don't redraw in the middle of a macro
set lazyredraw

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

set undofile

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
set shiftwidth=4
set tabstop=4
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

" remap increment/ decrement number to use ctrl-a as select all
noremap + <C-A>
noremap - <C-X>

" select all with ctrl-a
nnoremap <C-A> mzgg^V$G

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
noremap <leader>g :Gag<CR>
noremap <leader>G :GGrep<CR>
command! Gag :ProjectRootExe Ag

" some default colorscheme choices
nnoremap <leader>1 :colorscheme palenight<CR>
nnoremap <leader>2 :colorscheme oceanicnext<CR>
nnoremap <leader>3 :colorscheme soup<CR>
nnoremap <leader>4 :colorscheme mud<CR>
nnoremap <leader>5 :colorscheme absent<CR>
nnoremap <leader>6 :colorscheme bold<CR>
nnoremap <leader>7 :colorscheme azure<CR>
nnoremap <leader>8 :colorscheme piggy<CR>
nnoremap <leader>9 :colorscheme glowfish<CR>
nnoremap <leader>0 :colorscheme industry<CR>

" terminal mode
tnoremap <Esc> <C-\><C-n>

tnoremap <C-h> <C-\><C-N><C-w>h
" tnoremap <C-S-j> <C-\><C-N><C-w>j " commenting out because it interferes
" with AG usage....
" tnoremap <C-S-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l

" rename local variable
nnoremap gr gd[{V%::s/<C-R>///gc<left><left><left>



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



""""""""""" terminal """""""""" 
""""""""""""""""""""""""""""""""

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert



"""""""""" Diffing """"""""""
""""""""""""""""""""""""""""""""
command! GetLeft :diffget //2
command! GetRight :diffget //3
command! GetRemote :diffget RE
command! GetLocal :diffget LO
command! GetBase :diffget BA
command! NextChange ]c
command! PreviousChange [c



"""""""""" Git """"""""""
""""""""""""""""""""""""""""""""
command! GitPull :Git pull
command! GitPush :Git push


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



""""""""""""""  Arithmetic  """"""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""

command! Sum :normal vt xi<C-r>=<C-r>"<CR><Esc>



""""" easy motion """"""

" <Leader>c{char} to move to {char}
map  <Leader>c <Plug>(easymotion-bd-f)
nmap <Leader>c <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap <Leader>s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

