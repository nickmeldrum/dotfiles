set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'w0ng/vim-hybrid'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'zeis/vim-kolor'
Plugin 'tpope/vim-markdown'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'tpope/vim-surround'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'PProvost/vim-ps1'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/nerdtree'
Plugin 'rbgrouleff/bclose.vim'
"Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-grepper'
Plugin 'mattn/emmet-vim'
"Plugin 'marijnh/tern_for_vim'
"Plugin 'Valloric/YouCompletee'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'isRuslan/vim-es6'
"Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-dispatch'
Plugin 'mhartington/oceanic-next'
Plugin 'w0rp/ale'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/Gundo'
"Plugin 'OmniSharp/omnisharp-vim'
"Plugin 'OmniSharp/omnisharp-roslyn'
Plugin 'leafgarland/typescript-vim'
"Plugin 'Quramy/tsuquyomi'
"Plugin 'stephpy/vim-yaml'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'easymotion/vim-easymotion'
Plugin 'will133/vim-dirdiff'
call vundle#end()

filetype plugin indent on
:set fileformat=unix

au GUIEnter * simalt ~x

let mapleader = " "

let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
"let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
let g:ale_javascript_prettier_use_local_config = 1
nnoremap <leader>p :silent ALEFix<CR> 
command! -bar -nargs=* Gpurr execute 'Git pull --rebase' <q-args> 'origin' fugitive#head()
command! Gnicelog Dispatch powershell gitvimlog
:command! -nargs=+ GREP execute 'silent Ggrep!' <q-args> | cw | redraw!
"command! -nargs=+ Ggrep Dispatch git grep <q-args>
set diffopt+=vertical

:set laststatus=2

function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
    elseif a:mode == 'r'
        hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
    else
        hi statusline guibg=Red ctermfg=1 guifg=Black ctermbg=0
    endif
endfunction

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * hi statusline guibg=LightYellow ctermfg=8 guifg=Black ctermbg=15
"
"set statusline=%f         " Path to the file
"set statusline+=\      " Separator
"set statusline+=%y        " Filetype of the file
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=\      " Separator
"set statusline+=%c    " Current col
"set statusline+=/    " Separator
"set statusline+=%l    " Current line
"set statusline+=/    " Separator
"set statusline+=%L   " Total lines
"set statusline+=\      " Separator
"set statusline+=%{fugitive#statusline()} "git status

set autoread

"let g:OmniSharp_server_type = 'v1'
"let g:OmniSharp_server_type = 'roslyn'

let g:jsx_ext_required = 0

let g:OmniSharp_selector_ui = 'ctrlp'

autocmd! BufWritePost *.cs call OmniSharp#AddToProject()
autocmd! CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

autocmd! FileType cs nnoremap gd :OmniSharpGotoDefinition<cr>
command! CsGotoDef OmniSharpGotoDefinition
autocmd! FileType cs nnoremap <leader>fi :OmniSharpFindImplementations<cr>
command! CsFindImpl OmniSharpFindImplementations
autocmd! FileType cs nnoremap <leader>ft :OmniSharpFindType<cr>
command! CsFindType OmniSharpFindType
autocmd! FileType cs nnoremap <leader>fs :OmniSharpFindSymbol<cr>
autocmd! FileType cs nnoremap <leader>fu :OmniSharpFindUsages<cr>
command! CsFindUsages OmniSharpFindUsages
"finds members in the current buffer
autocmd! FileType cs nnoremap <leader>fm :OmniSharpFindembers<cr>
command! CsFindembers OmniSharpFindembers
" cursor can be anywhere on the line containing an issue
autocmd! FileType cs nnoremap <leader>x  :OmniSharpFixIssue<cr>
autocmd! FileType cs nnoremap <leader>fx :OmniSharpFixUsings<cr>
autocmd! FileType cs nnoremap <leader>tt :OmniSharpTypeLookup<cr>
autocmd! FileType cs nnoremap <leader>dc :OmniSharpDocumentation<cr>
"navigate up by method/property/field
autocmd! FileType cs nnoremap <C-K> :OmniSharpNavigateUp<cr>
"navigate down by method/property/field
autocmd! FileType cs nnoremap <C-J> :OmniSharpNavigateDown<cr>

" turn off auto backing up - using google drive or git anyway right? :)
set nobackup
set noswapfile
set nowb

" buffers can exist in background
set hidden

" map control -n to next buffer
:nnoremap <C-n> :bnext<CR>

" Open markdown files with Chrome.
"autocmd BufEnter *.md exe 'noremap <F5> :!start chrome "%:p"<CR>'

command! ReadProse set wrap | normal zR
"autocmd! BufEnter *.md ReadProse
noremap <leader>pr :ReadProse<cr> 
" allow spell check
"set spell
"set spelllang=en
command! Spell set spell spelllang=en_gb
command! SpellOff set nospell

" so gf knows some files might not include the .js extension in the script
set suffixesadd+=.js

" line numbers
" set nu
set relativenumber

" turn off word wrapping
set nowrap

" show line and column markers
"set cursorline
"set cursorcolumn

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set wildignore+=node_modules/**
set wildignore+=packages/**
set wildignore+=3rdparty/**
set wildignore+=bower_components/**
set wildignore+=coverage/**
set wildignore+=tags
set wildignore+=target/**
set wildignore+=.teamcity/**

let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|teamcity|vs)$\|node_modules$\|bower_components$\|packages$\|3rdparty$\|coverage$\|target$',
            \ 'file': '\v\.(exe|so|dll|class)$'
            \ }
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Ignore case when searching
set ignorecase
set smartcase
" Highlight search results
set hlsearch
" akes search act like search in modern browsers
set incsearch

" No annoying sound on errors
set noerrorbells
set t_vb=
set tm=500
command! Nob set vb t_vb=
set vb t_vb=
set visualbell

" Line Numbers
set number

" Enable syntax highlighting
syntax enable
au BufNewFile,BufRead *.cshtml set filetype=html
au BufNewFile,BufRead *.ejs set filetype=html

au BufNewFile,BufRead *.js set shiftwidth=4 
" Who doesn't like autoindent?
set autoindent

"evil remaps from hell
nnoremap ' `
nnoremap ` '

nnoremap ; :
nnoremap : ;

"nice scrolly remaps

map <c-j> j<c-e>
map <c-k> k<c-y>

" when :vs the loaded file will show up on the right
set splitright

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" tabbing
set smarttab
set shiftwidth=4
set tabstop=4
" Use spaces instead of tabs
set expandtab

" javascript omnicompletion
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" python stuff
autocmd! FileType python nnoremap <buffer> <F9> :w !python<CR>

" markdown stuff
autocmd! BufNewFile,BufReadPost *.md set filetype=markdown

autocmd! BufNewFile,BufReadPost *.js set foldlevel=99

" tabbing
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" color scheme for conemu (256 colors)
if has("gui_running")
    "gvim stuff
    set guioptions -=m
    set guioptions -=T
    set guifont=Consolas:h12:cANSI
    set guioptions -=r
    set guioptions -=R
    set guioptions -=l
    set guioptions -=L
endif
    set term=xterm
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
set t_Co=256
"colorscheme zenburn "colorscheme distinguished
"colorscheme kolor
"colorscheme hybrid
colorscheme OceanicNext

inoremap jk <ESC>

command! Spell set spell spelllang=en_gb

" commands
command! SsWeb cd D:\Prod\src\Web
command! SsScripts cd D:\Prod\src\Web\scripts\Scribestar
command! SsRoot cd D:\Prod

function! GotoAlternateFile()
    :e#
endfunction

command! GotoLastFile call GotoAlternateFile()
command! GoL call GotoAlternateFile()

function! DeleteNextEmptyLine()
    :normal mz
    /^\s*$\n/
    :normal dgn
    :normal 'z
endfunction

command! Delnel call DeleteNextEmptyLine()

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

set path=.,./src,./node_modules
set suffixesadd=.js,.jsx,.ts,.tsx

function! LoadNodeModules(fname)
    let moduleRoot = '~/src/gdw/modules/'
    let indexFile = '/src/index.ts'

    let output = moduleRoot . substitute(a:fname, "gdw/", "", "") . indexFile
    return output
endfunction

set includeexpr=LoadNodeModules(v:fname)

function! AutoIndentFile()
    :normal mzgg=G'z
endfunction

command! AI call AutoIndentFile()

function! RemoveTrailingWhitespaceFromFile()
    :let _s=@/
    :%s/\s\+$//e
    :let @/=_s
endfunction

command! RTW call RemoveTrailingWhitespaceFromFile()

function! AddCatchToEndOfThen()
    :%s/^\(\s*\)});/\1})\r\1.catch((err) => { window.console.error(err);});/gc
endfunction

"following is a copy of my i register that allows me to turn requires into
"imports in js
"cwimportf=vf(cfrom f)dl

"autocmd! BufWritePre *.js :call RemoveTrailingWhitespaceFromFile() | :call AutoIndentFile()

nnoremap ton :silent ?it(<CR>la.only<ESC>:noh<CR>
nnoremap tnon :silent ?it.only<CR>lldt(:noh<CR>

command! EditVimrc :e ~/.vimrc
nnoremap <leader>ev :EditVimrc<CR> 
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

command! MakeFontBiggest set guifont=Consolas:h18:cANSI
command! MakeFontBigger set guifont=Consolas:h16:cANSI
command! MakeFontBig set guifont=Consolas:h14:cANSI
command! MakeFontNormal set guifont=Consolas:h12:cANSI
command! MakeFontSmall set guifont=Consolas:h10:cANSI

command! GL :diffget //2
command! GR :diffget //3

command! RemoveBadNewLines :%s///g
nmap <C-A> mzgg^V$G

function! FormatJSONFunc()
  :%!python -m json.tool
endfunction

command! FormatJSON call FormatJSONFunc()

function! DoPrettyXL()
    " save the filetype so we can restore it later
    let l:origft = &ft
    set ft=
    " delete the xml header if it exists. This will
    " permit us to surround the document with fake tags
    " without creating invalid xml.
    1s/<?xml .*?>//e
    " insert fake tags around the entire document.
    " This will permit us to pretty-format excerpts of
    " XL that may contain multiple top-level elements.
    0put ='<PrettyXL>'
    $put ='</PrettyXL>'
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
command! PrettyXL call DoPrettyXL()

command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
    echo a:cmdline
    let expanded_cmdline = a:cmdline
    for part in split(a:cmdline, ' ')
        if part[0] =~ '\v[%#<]'
            let expanded_part = fnameescape(expand(part))
            let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
        endif
    endfor
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, 'You entered:    ' . a:cmdline)
    call setline(2, 'Expanded Form:  ' .expanded_cmdline)
    call setline(3,substitute(getline(2),'.','=','g'))
    execute '$read !'. expanded_cmdline
    setlocal nomodifiable
    1
endfunction

command! Build Dispatch powershell build
command! ReBuild Dispatch powershell rebuild
command! BuildCollab Dispatch powershell buildcollab
command! BuildCollabTests Dispatch powershell buildcollabtests
command! BuildComment Dispatch powershell buildcomment
command! BuildCommentTests Dispatch powershell buildcommenttests
command! BuildCheck Dispatch powershell buildcheck
command! BuildCheckTests Dispatch powershell buildchecktests
command! BuildCoreTests Dispatch powershell buildcoretests
command! BuildVer Dispatch powershell buildver
command! BuildVerTests Dispatch powershell buildvertests
command! BuildExport Dispatch powershell buildexport
command! BuildExportTests Dispatch powershell buildexporttests
command! BuildSupport Dispatch powershell buildsupport
command! BuildScripts Dispatch powershell buildscripts
command! GulpSite Dispatch cmd /C c:\tools\gulpsite.cmd
command! GulpDocuments Dispatch cmd /C c:\tools\gulpdocuments.cmd
command! GulpPartanagement Dispatch cmd /C c:\tools\gulppartmanagement.cmd
command! GulpToolbar Dispatch cmd /C c:\tools\gulptoolbar.cmd
command! GulpEditor Dispatch cmd /C c:\tools\gulpditaeditor.cmd
command! GulpVerification Dispatch cmd /C c:\tools\gulpverification.cmd
command! GulpCss Dispatch cmd /C c:\tools\gulpcss.cmd
command! BuildCss Dispatch powershell buildcss
command! BuildWeb Dispatch powershell buildweb

command! DebugWeb Shell powershell debugweb
command! DebugCollab Shell powershell debugcollab
command! DebugComment Shell powershell debugcomment
command! DebugCheck Shell powershell debugcheck
command! DebugVer Shell powershell debugver
command! DebugExport Shell powershell debugexport

command! TestAll Dispatch powershell testall
command! TestAllNoSeleniumOrPerf Dispatch powershell testall-exceptseleniumorperf
command! TestCollab Dispatch powershell testcollab
command! TestComment Dispatch powershell testcomment
command! TestCheck Dispatch powershell testcheck
command! TestCore Dispatch powershell testcore
command! TestAndBuildCore Dispatch powershell testandbuildcore
command! TestVer Dispatch powershell testver
command! TestDiff Dispatch powershell testdiff
command! TestExport Dispatch powershell testdiff

command! StartSS Dispatch powershell startss
command! StopSS Dispatch powershell stopss
command! ListSS Dispatch powershell listss

command! UpdateTable Dispatch powershell updatetable

" nerdtree stuff
" close vim if nerdtree only window left open
autocmd! bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set foldmethod=indent
set foldlevel=99

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7" 
set t_ZH=[3m
set t_ZR=[23m

set shiftwidth=4
set showcmd
highlight comment cterm=italic
highlight Type cterm=italic
"highlight Bold cterm=italic 
"hi Debug cterm=italic
"hi Directory cterm=italic
"hi ErrorMsg cterm=italic
"hi Exception cterm=italic
"hi FoldColumn cterm=italic
"hi Folded cterm=italic
"hi IncSearch cterm=italic
"hi Italic cterm=italic
"hi Macro cterm=italic
"hi MatchParen cterm=italic "hi ModeMsg cterm=italic
"hi MoreMsg cterm=italic
"hi Question cterm=italic
"hi Search cterm=italic
"hi SpecialKey cterm=italic
"hi TooLong cterm=italic
"hi Underlined cterm=italic
"hi Visual cterm=italic
"hi VisualNOS cterm=italic
"hi WarningMsg cterm=italic
"hi WildMenu cterm=italic
"hi Title cterm=italic
"hi Conceal cterm=italic
"hi Cursor cterm=italic
"hi NonText cterm=italic
"hi Normal cterm=italic
"hi LineNr cterm=italic
"hi CursorLineNR cterm=italic
"hi SignColumn cterm=italic
"hi StatusLine cterm=italic
"hi StatusLineNC cterm=italic
"hi VertSplit cterm=italic
"hi ColorColumn cterm=italic
"hi CursorColumn cterm=italic
"hi CursorLine cterm=italic
"hi CursorLineNr cterm=italic
"hi PMenu cterm=italic
"hi PMenuSel cterm=italic
"hi PmenuSbar cterm=italic
"hi PmenuThumb cterm=italic
"hi TabLine cterm=italic
"hi TabLineFill cterm=italic
"hi TabLineSel cterm=italic
"hi helpExample cterm=italic
"hi helpCommand cterm=italic
"hi Boolean cterm=italic
"hi Character cterm=italic
"hi Conditional cterm=italic
"hi Constant cterm=italic
"hi Define cterm=italic
"hi Delimiter cterm=italic
"hi Float cterm=italic
"hi Function cterm=italic
"hi Identifier cterm=italic
"hi Include cterm=italic
"hi Keyword cterm=italic
"hi Label cterm=italic
"hi Number cterm=italic
"hi Operator cterm=italic
"hi PreProc cterm=italic
"hi Repeat cterm=italic
"hi Special cterm=italic
"hi SpecialChar cterm=italic
"hi Statement cterm=italic
"hi StorageClass cterm=italic
"hi String cterm=italic
"hi Structure cterm=italic
"hi Tag cterm=italic
"hi Todo cterm=italic
"hi Typedef cterm=italic
"hi SpellBad cterm=italic
"hi SpellLocal cterm=italic
"hi SpellCap cterm=italic
"hi SpellRare cterm=italic
"hi csClass cterm=italic
"hi csAttribute cterm=italic
"hi csModifier cterm=italic
"hi csType cterm=italic
"hi csUnspecifiedStatement cterm=italic
"hi csContextualStatement cterm=italic
"hi csNewDecleration cterm=italic
"hi cOperator cterm=italic
"hi cPreCondit cterm=italic
"hi cssColor cterm=italic
"hi cssBraces cterm=italic
"hi cssClassName cterm=italic
"hi DiffAdd cterm=italic
"hi DiffChange cterm=italic
"hi DiffDelete cterm=italic
"hi DiffText cterm=italic
"hi DiffAdded cterm=italic
"hi DiffFile cterm=italic
"hi DiffNewFile cterm=italic
"hi DiffLine cterm=italic
"hi DiffRemoved cterm=italic
"hi gitCommitOverflow cterm=italic
"hi gitCommitSummary cterm=italic
"hi htmlBold cterm=italic
"hi htmlItalic cterm=italic
"hi htmlTag cterm=italic
"hi htmlEndTag cterm=italic
"hi htmlArg cterm=italic
"hi htmlTagName cterm=italic
"hi javaScript cterm=italic
"hi javaScriptNumber cterm=italic
"hi javaScriptBraces cterm=italic
"hi markdownCode cterm=italic
"hi markdownCodeBlock cterm=italic
"hi markdownHeadingDelimiter cterm=italic
"hi markdownItalic cterm=italic
"hi markdownBold cterm=italic
"hi markdownCodeDelimiter cterm=italic
"hi markdownError cterm=italic
"hi NeomakeErrorSign cterm=italic
"hi NeomakeWarningSign cterm=italic
"hi NeomakeInfoSign cterm=italic
"hi NeomakeError cterm=italic
"hi NeomakeWarning cterm=italic
"hi NERDTreeExecFile cterm=italic
"hi NERDTreeDirSlash cterm=italic
"hi NERDTreeOpenable cterm=italic
"hi phpComparison cterm=italic
"hi phpParent cterm=italic
"hi phpMemberSelector cterm=italic
"hi pythonRepeat cterm=italic
"hi pythonOperator cterm=italic
"hi rubyConstant cterm=italic
"hi rubySymbol cterm=italic
"hi rubyAttribute cterm=italic
"hi rubyInterpolation cterm=italic
"hi rubyInterpolationDelimiter cterm=italic
"hi rubyStringDelimiter cterm=italic
"hi rubyRegexp cterm=italic
"hi sassidChar cterm=italic
"hi sassClassChar cterm=italic
"hi sassInclude cterm=italic
"hi sassMixing cterm=italic
"hi sassMixinName cterm=italic
"hi vimfilerLeaf cterm=italic
"hi vimfilerNormalFile cterm=italic
"hi vimfilerOpenedFile cterm=italic
"hi vimfilerClosedFile cterm=italic
"hi GitGutterAdd cterm=italic
"hi GitGutterChange cterm=italic
"hi GitGutterDelete cterm=italic
"hi GitGutterChangeDelete cterm=italic
"hi xmlTag cterm=italic
"hi xmlTagName cterm=italic
"hi xmlEndTag cterm=italic

hi Normal ctermbg=233

"set mouse=a

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
  call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

set noro
autocmd! bufenter * set noro
let g:NERDTreeNodeDelimiter = "\u00a0"
" Open markdown files with Chrome.
autocmd BufEnter *.md exe 'noremap <F5> :! /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome %:p<CR>'
