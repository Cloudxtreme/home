"===================================================================================
"         FILE:  .vimrc
"  DESCRIPTION:  suggestion for a personal configuration file ~/.vimrc
"       AUTHOR:  Leo Xiang
"      CREATED:  2009/05/21
"     REVISION:  2011/08/30
"===================================================================================
"============================================================
" GENERAL SETTINGS {{{1
"============================================================
"------------------------------------------------------------
" Important settings
"------------------------------------------------------------
set nocompatible    " Use Vim settings, rather then Vi settings. Set this first.
syntax   on         " Switch syntax highlighting on.
filetype plugin on  " Enable file type detection.
filetype indent on  " Enable language-dependent indenting.
"------------------------------------------------------------
" Various settings
"------------------------------------------------------------
set autoindent                  " Copy indent from current line
set autoread                    " Read open files again when changed outside Vim
set autowrite                   " Write a modified buffer on each :next , ...
set backspace=indent,eol,start  " Backspacing over everything in insert mode
set browsedir=current           " Which directory to use for the file browser
set cmdheight=1                 " Make command line two lines high
set complete=.,b                " Scan the files given with the 'dictionary' option
set completeopt=longest,menu    " let clang_complete not popup preview window
set cursorline                  " Highlight the focused window's status line
set expandtab                   " Use <tabstop> numbers of spaces instead of tab
set ffs=unix,dos,mac            " Set EOL format
set fileformats=unix,dos,mac    " Set file formats supporting <nl>, <cr><nl>, <cr>
set foldmethod=marker           " Set to use marker( {{{,}}} ) to fold
set hidden                      " Chang buffer without saving
set history=50                  " Keep 50 lines of command line history
set hlsearch                    " Highlight the last used search pattern
set ignorecase                  " Ignore case when searching
set incsearch                   " Do incremental searching
set laststatus=2                " Always show status line
set listchars=tab:>.,eol:\$     " Strings to use in 'list' mode
set modeline                    " Set modeline for root user
set pastetoggle=<F9>            " Set paste toggle key
set mouse=a                     " Enable the use of the mouse
set mousehide                   " Hide the mouse when typing text
set nobackup                    " Do not keep a backup file
set noswapfile                  " DO not generate swap file
set nowrap                      " Do not wrap lines
set nowritebackup               " Do not use writebackp
set number                      " Show line numbers
set report=0                    " Always get report from : command
set ruler                       " Show the cursor position all the time
set scrolloff=8                 " Set 8 lines to the cursor when moving vertically
set shiftwidth=4                " Number of spaces to use for each step of indent
set showcmd                     " Display incomplete commands
set showmatch                   " Show matching bracets
set smartindent                 " Smart autoindenting when starting a new line
set tabstop=4                   " Number of spaces that a <Tab> counts for
set whichwrap+=<,>,[,],~,b,s    " Set how the cursor could be wrap between lines
set wildignore=*.bak,*.o,*.e,*~ " Wildmenu: ignore these extensions
set wildmenu                    " Command-line completion in an enhanced mode
set term=xterm-256color         " Support powerline color
set cst                         " Support ctags jump with select window
set shortmess=a

"============================================================
" EDIT SETTINGS {{{1
"============================================================
"------------------------------------------------------------
" Automatic open quickfix windows after cmd, like make.
"------------------------------------------------------------
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"------------------------------------------------------------
" Multi-encoding setting
"------------------------------------------------------------
"use fencview plugin
let g:fencview_autodetect = 1
"vim internal support
if has("multi_byte")
  set encoding=UTF-8
  set langmenu=en_US.UTF-8
  language message en_US.UTF-8
  set termencoding=UTF-8
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
else
  echoerr "sorry, this version of vim was not compiled with multi_byte"
endif
"------------------------------------------------------------
" Set GUI or non-GUI
"------------------------------------------------------------
if has("gui_running")
  set guioptions+=m
  set guioptions+=r
  set guioptions+=l
  set guioptions-=t
  set guioptions-=e
  set guioptions-=L
  set guioptions-=T
endif

"============================================================
" KEYMAPS {{{1
"============================================================
"------------------------------------------------------------
" Set mapleader keys
"------------------------------------------------------------
let mapleader   = ","
let g:mapleader = ","
"------------------------------------------------------------
" Set mouse behavior
"------------------------------------------------------------
nnoremap <2-leftmouse>  *N
nnoremap <rightmouse>   <c-o>
xnoremap <rightmouse>   <esc><c-o>
nnoremap <c-leftmouse>  <leftmouse>:YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <c-rightmouse> <leftmouse><c-]>
"------------------------------------------------------------
" Quickfix bindings
"------------------------------------------------------------
command! TQuickFix call s:ToggleQuickFix()
function! s:ToggleQuickFix()
  for i in range(1, winnr('$'))
    let bnum = winbufnr(i)
    if getbufvar(bnum, '&buftype') == 'quickfix'
      cclose
      return
    endif
  endfor
  bot copen
endfunction
nnoremap <leader>,  :cp<cr>
nnoremap <leader>.  :cn<cr>
nnoremap <leader>/  :cc<cr>
"------------------------------------------------------------
" Don't close window when deleting a buffer
"------------------------------------------------------------
command! BClose call s:BufferClose()
function! s:BufferClose()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")
  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif
  if bufnr("%") == l:currentBufNum
    new
  endif
  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction
"------------------------------------------------------------
" Set Function keymaps
"------------------------------------------------------------
nnoremap <silent> <F1>        :ToggleBufExplorer<cr>
nnoremap <silent> <F2>        :NERDTreeToggle<cr>:wincmd p<cr>
nnoremap <silent> <F3>        :TagbarToggle<cr>
nnoremap <silent> <F4>        :TQuickFix<cr>
inoremap <silent> <F1>   <esc>:ToggleBufExplorer<cr>
inoremap <silent> <F2>   <Esc>:NERDTreeToggle<cr>
inoremap <silent> <F3>   <Esc>:TagbarToggle<cr>
inoremap <silent> <F4>   <esc>:TQuickFix<cr>
"------------------------------------------------------------
" Some fast editing keymaps
"------------------------------------------------------------
nnoremap <leader>ss       :w!<cr>
nnoremap <leader>gg       :Rgrep<cr>
nnoremap <leader>gc       :Rgrep<cr><cr><cr>.cpp *.c<cr>
nnoremap <leader>gh       :Rgrep<cr><cr><cr>.hpp *.h<cr>
nnoremap <leader>gx       :Rgrep<cr><cr><cr>.xml<cr>
nnoremap <leader>gs       :Rgrep<cr><cr><cr>.sh<cr>
nnoremap <leader>so       :so %<cr>
nnoremap <leader>e        :e! ~/.vimrc<cr>
nnoremap <leader>h        :noh<cr>
nnoremap <leader>t        :silent !ctags -R --sort=foldcase --c++-kinds=+p --fields=+ianS --extra=+q --language-force=auto .<cr>:redraw!<cr>
nnoremap <leader><space>  :FixWhitespace<cr>
nnoremap <leader>y        :YcmDiags<CR>
nnoremap <leader>i        :IndentLinesToggle<cr>
nnoremap <leader>q        :BClose<cr>
"------------------------------------------------------------
" Make editing easier
"------------------------------------------------------------
nnoremap <space> i<space><esc><right>
nnoremap  s  <nop>
nnoremap  S  <nop>
xnoremap  p  pgvy
nnoremap <c-h>    8<left>
nnoremap <c-j>    8<down>
nnoremap <c-k>    8<up>
nnoremap <c-l>    8<right>
vnoremap <c-h>    8<left>
vnoremap <c-j>    8<down>
vnoremap <c-k>    8<up>
vnoremap <c-l>    8<right>
noremap  <c-p>    :bp<CR>
noremap  <c-n>    :bn<CR>
noremap  <c-x>    :quit<cr>
"------------------------------------------------------------
" tab and window keymap
"------------------------------------------------------------
nnoremap t<cr>    :tabnew<cr>
nnoremap tq       :tabclose<cr>
nnoremap tn       :tabn<cr>
nnoremap tp       :tabp<cr>
nnoremap tm       :tabm<cr>
"------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"------------------------------------------------------------
xnoremap  '  s''<esc>P<right>
xnoremap  "  s""<esc>P<right>
xnoremap  `  s``<esc>P<right>
xnoremap  (  s()<esc>P<right>
xnoremap  [  s[]<esc>P<right>
xnoremap  {  s{}<esc>P<right>
"------------------------------------------------------------
" autocomplete other half
"------------------------------------------------------------
inoremap  /*       /*<Space><Space>*/<Left><Left><Left>
vnoremap  /*      s/*<Space><Space>*/<Left><Left><Left><Esc>p
inoremap  /*<CR>  /*<CR><CR>/<Esc>kA<Space>
inoremap  {<CR>    {<CR>}<Esc>O
vnoremap  {<CR>   S{<CR>}<Esc>Pk=iB

"============================================================
" PLUGIN CONFIGURATIONS {{{1
"============================================================
"------------------------------------------------------------
" Vundle "------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" from colorscheme
Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'nanotech/jellybeans.vim'
" from vim-scripts
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sukima/xmledit'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/quickfixsigns_vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/grep.vim'
Plugin 'vim-scripts/vcscommand.vim'
call vundle#end()
filetype plugin indent on
"------------------------------------------------------------
" NERDTree
"------------------------------------------------------------
let NERDTreeAutoCenter    = 0
let NERDTreeShowBookmarks = 1
let NERDTreeChDirMode     = 2
let NERDTreeWinSize       = 25
let NERDTreeBookmarksFile = $HOME."/.vim/.NERDTreeBookmarks"
let NERDTreeIgnore        = ['\.dep$','\.o$','\.d$']
"------------------------------------------------------------
" easy align
"------------------------------------------------------------
vmap <Enter> <Plug>(EasyAlign)
function! GFM()
  let langs = ['ruby', 'yaml', 'vim', 'c']
  for lang in langs
    unlet b:current_syntax
    silent! exec printf("syntax include @%s syntax/%s.vim", lang, lang)
    exec printf("syntax region %sSnip matchgroup=Snip start='```%s' end='```' contains=@%s",
                \ lang, lang, lang)
  endfor
  let b:current_syntax='mkd'
  syntax sync fromstart
endfunction
"------------------------------------------------------------
" TComment
"------------------------------------------------------------
nmap <c-c> <Plug>TComment_gcc
xmap <c-c> <Plug>TComment_gc
"------------------------------------------------------------
" tagbar
"------------------------------------------------------------
let g:tagbar_autofocus = 1
"------------------------------------------------------------
" taglist
"------------------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
"------------------------------------------------------------
" YouCompleteMe
"------------------------------------------------------------
let g:ycm_global_ycm_extra_conf               = '~/.vim/.ycm_extra_conf.py'
let g:ycm_error_symbol                        = '>>'
let g:ycm_warning_symbol                      = '>*'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax        = 1
let g:ycm_confirm_extra_conf                  = 0
let g:ycm_cache_omnifunc                      = 0
let g:ycm_complete_in_comments                = 1
let g:ycm_min_num_of_chars_for_completion     = 1
let g:ycm_use_ultisnips_completer             = 1
"------------------------------------------------------------
" rainbow parentheses
"------------------------------------------------------------
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"------------------------------------------------------------
" indent line
"------------------------------------------------------------
if has("gui_running")
  let g:indentLine_color_gui = '#A3E57E'
else
  let g:indentLine_color_term = 239
endif
let g:indentLine_char = '|'
let g:indentLine_enabled = 1
"------------------------------------------------------------
" colorscheme
"------------------------------------------------------------
let g:solarized_termcolors = 256
let g:solarized_termtrans  = 1
let g:solarized_contrast   = "normal"
let g:solarized_visibility = "normal"
let g:molokai_original = 1
set background=light
set t_Co=256
" colorscheme solarized
" colorscheme molokai
colorscheme tango
" colorscheme jellybeans
"------------------------------------------------------------
" easy motion
"------------------------------------------------------------
nmap f <Plug>(easymotion-s)
vmap f <Plug>(easymotion-s)
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_use_upper = 1
"------------------------------------------------------------
" expand region
"------------------------------------------------------------
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
"------------------------------------------------------------
" multi cursors
"------------------------------------------------------------
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
"------------------------------------------------------------
" ctrlp
"------------------------------------------------------------
let g:ctrlp_map='<c-f>'
nnoremap <c-f> :CtrlP<cr>
nnoremap <c-b> :CtrlPBuffer<cr>
let g:ctrlp_match_window='top,order:btt,min:1,max:10,results:20'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|svn)$',
  \ 'file': '\v\.(exe|so|dll|d|o)$',
  \ }
"------------------------------------------------------------
" clang format
"------------------------------------------------------------
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

"============================================================
" PREDEFINED LINES {{{1
"============================================================
"------------------------------------------------------------
" binary file
"------------------------------------------------------------
" using xdd-format
augroup Binary
  autocmd!
  autocmd BufReadPre   *.o,*.exe,*.mbr let &bin=1
  autocmd BufReadPost  *.o,*.exe,*.mbr if &bin | %!xxd
  autocmd BufReadPost  *.o,*.exe,*.mbr set ft=xxd | endif
  autocmd BufWritePre  *.o,*.exe,*.mbr if &bin | %!xxd -r
  autocmd BufWritePre  *.o,*.exe,*.mbr endif
  autocmd BufWritePost *.o,*.exe,*.mbr if &bin | %!xxd
  autocmd BufWritePost *.o,*.exe,*.mbr set nomod | endif
augroup END
"------------------------------------------------------------
" Makefile
"------------------------------------------------------------
" comment func
function! s:LeoMakefileComment()
  let s:eol   = "\<enter>\<esc>d0i"
  let s:date  = strftime("%Y-%m-%d")
  let s:fname = expand('%:t')
  let s:line  = []
  let s:line += ["#==============================================================================="]
  let s:line += ["#      FILENAME: ".s:fname]
  let s:line += ["#   DESCRIPTION: ---"]
  let s:line += ["#         NOTES: Makefile.shared - define project configuration"]
  let s:line += ["#                Makefile.rule  - auto-generate dependencies for c/c++ files"]
  let s:line += ["#                Remember to inlcude build.mk after all your targets!"]
  let s:line += ["#        AUTHOR: leoxiang, leoxiang727@qq.com"]
  let s:line += ["#      REVISION: ".s:date." by leoxiang"]
  let s:line += ["#==============================================================================="]
  let s:line += [""]
  let s:line += [""]
  let s:line += [""]
  let s:line += ["# vim:ts=4:sw=4:ft=make:"]
  call setline(1, s:line)
  exec "normal Gkk"
  start!
endfunction
" set autocmd
if has("autocmd")
  autocmd BufNewFile makefile,Makefile,Makefile.* call s:LeoMakefileComment()
endif
"------------------------------------------------------------
" Bash
"------------------------------------------------------------
" comment func
function! s:LeoBashComment()
  let s:eol   = "\<enter>"
  let s:date  = strftime("%Y-%m-%d")
  let s:fname = expand('%:t')
  let s:line  = []
  let s:line += ["#!/bin/bash"]
  let s:line += ["#==============================================================================="]
  let s:line += ["#      FILENAME: ".s:fname]
  let s:line += ["#   DESCRIPTION: ---"]
  let s:line += ["#         NOTES: ---"]
  let s:line += ["#        AUTHOR: leoxiang, leoxiang727@qq.com"]
  let s:line += ["#      REVISION: ".s:date." by leoxiang"]
  let s:line += ["#==============================================================================="]
  let s:line += [""]
  let s:line += [""]
  let s:line += [""]
  let s:line += ["# vim:ts=2:sw=2:et:ft=sh:"]
  call setline(1, s:line)
  exec "normal Gkk"
  start!
endfunction
" set autocmd
if has("autocmd")
  autocmd BufNewFile *.sh call s:LeoBashComment()
  autocmd BufReadPre *.sh set fdm=indent fdl=99
endif
"------------------------------------------------------------
" C/C++
"------------------------------------------------------------
" comment func
function! s:LeoCComment()
  let s:eol   = "\<enter>"
  let s:date  = strftime("%Y-%m-%d")
  let s:fname = expand('%:t')
  let s:line  = []
  let s:line += ["// File:        ".s:fname]
  let s:line += ["// Description: ---"]
  let s:line += ["// Notes:       ---"]
  let s:line += ["// Author:      leoxiang <leoxiang727@qq.com>"]
  let s:line += ["// Revision:    ".s:date." by leoxiang"]
  let s:line += [""]
  let s:line += [""]
  let s:line += [""]
  let s:line += ["// vim:ts=4:sw=4:et:ft=cpp:"]
  call setline(1, s:line)
  exec "normal Gkk"
  start!
endfunction
" set autocmd
if has("autocmd")
  autocmd BufNewFile *.c,*.cpp,*.cc,*.h,*.hpp call s:LeoCComment()
  autocmd BufReadPre *.c,*.cpp,*.cc,*.h,*.hpp set fdm=indent fdl=99
endif
" fix gcc 4.8 compile errror
set errorformat^=%-GIn\ file\ included\ from\ %f:%l:%c:,%-GIn\ file
      \\ included\ from\ %f:%l:%c\\,,%-GIn\ file\ included\ from\ %f
      \:%l:%c,%-GIn\ file\ included\ from\ %f:%l
set equalprg=clang-format
"------------------------------------------------------------
" Protobuf
"------------------------------------------------------------
" comment func
function! s:LeoProtoComment()
  let s:eol   = "\<enter>"
  let s:date  = strftime("%Y-%m-%d")
  let s:fname = expand('%:t')
  let s:line  = []
  let s:line += ["// File:        ".s:fname]
  let s:line += ["// Description: ---"]
  let s:line += ["// Notes:       ---"]
  let s:line += ["// Author:      leoxiang <leoxiang727@qq.com>"]
  let s:line += ["// Revision:    ".s:date." by leoxiang"]
  let s:line += [""]
  let s:line += [""]
  let s:line += [""]
  let s:line += ["// vim:ts=4:sw=4:et:ft=proto:"]
  call setline(1, s:line)
  exec "normal Gkk"
  start!
endfunction
" set autocmd
if has("autocmd")
  autocmd BufNewFile *.proto call s:LeoProtoComment()
  autocmd BufReadPre *.proto set fdm=indent fdl=99
endif
"------------------------------------------------------------
" XML
"------------------------------------------------------------
" comment func
let g:xml_syntax_folding = 1
function! s:LeoXMLComment()
  let s:line  = []
  let s:line += ['<?xml version="1.0" encoding="GBK" standalone="yes" ?>']
  let s:line += ['']
  let s:line += ['']
  let s:line += ['']
  let s:line += ['<!-- vim:set ts=2 sw=2 et ft=xml fdm=syntax: -->']
  call setline(1, s:line)
  exec "normal Gkk"
  start!
endfunction
" set autocmd
if has("autocmd")
  autocmd BufNewFile *.xml call s:LeoXMLComment()
  autocmd BufReadPre *.xml set fdm=syntax fdl=99
endif

" vim:ts=2:sw=2:et:ft=vim:tw=85:fdm=marker
