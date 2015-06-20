"===================================================================================
"         FILE:  .vimrc
"  DESCRIPTION:  suggestion for a personal configuration file ~/.vimrc
"       AUTHOR:  Leo Xiang
"      CREATED:  2009/05/21 
"     REVISION:  2011/08/30
"===================================================================================
"===================================================================================
" GENERAL SETTINGS {{{1
"===================================================================================
"-------------------------------------------------------------------------------
" Important settings
"-------------------------------------------------------------------------------
set nocompatible    " Use Vim settings, rather then Vi settings. Set this first.
syntax   on         " Switch syntax highlighting on.
filetype plugin on  " Enable file type detection.
filetype indent on  " Enable language-dependent indenting.
"-------------------------------------------------------------------------------
" Various settings
"-------------------------------------------------------------------------------
set autoindent                  " Copy indent from current line
set autoread                    " Read open files again when changed outside Vim
set autowrite                   " Write a modified buffer on each :next , ...
set backspace=indent,eol,start  " Backspacing over everything in insert mode
set browsedir=current           " Which directory to use for the file browser
set cmdheight=1                 " Make command line two lines high
set complete=.,b                " Scan the files given with the 'dictionary' option
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
set mouse=a                     " Enable the use of the mouse
set mousehide                   " Hide the mouse when typing text
set nobackup                    " Do not keep a backup file
set noswapfile                  " DO not generate swap file
set nowrap                      " Do not wrap lines
set nowritebackup               " Do not use writebackp
set number                      " Show line numbers
set pastetoggle=<F9>            " set paste toggle key
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
set completeopt=longest,menu    " let clang_complete not popup preview window

"===================================================================================
" EDIT SETTINGS {{{1
"===================================================================================
"-------------------------------------------------------------------------------
" Automatic open quickfix windows after cmd, like make.
"-------------------------------------------------------------------------------
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"-------------------------------------------------------------------------------
" Multi-encoding setting
"-------------------------------------------------------------------------------
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
"-------------------------------------------------------------------------------
" Set colortheme depending on GUI or non-GUI
"-------------------------------------------------------------------------------
if has("gui_running")
  set guioptions+=m
  set guioptions+=r
  set guioptions+=l
  set guioptions-=t
  set guioptions-=e
  set guioptions-=L
  set guioptions-=T
  colorscheme tango2
else
  colorscheme tango
endif
"-------------------------------------------------------------------------------
" Format the statusline
"-------------------------------------------------------------------------------
function! CurDir()
   let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
   return curdir
endfunction
set statusline=\ Dir:%r%{CurDir()}%h\ \ %F%m%r%h%w\ \ Line:%l/%L:%c

"===================================================================================
" KEYMAPS {{{1
"===================================================================================
"-------------------------------------------------------------------------------
" Set mapleader keys
"-------------------------------------------------------------------------------
let mapleader   = ","
let g:mapleader = ","
"-------------------------------------------------------------------------------
" Set mouse behavior
"-------------------------------------------------------------------------------
nnoremap <2-leftmouse>  *N
nnoremap <rightmouse>   <c-o>
xnoremap <rightmouse>   <esc><c-o>
nnoremap <c-leftmouse>  <leftmouse>:YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <c-rightmouse> <leftmouse><c-]>

"-------------------------------------------------------------------------------
" Some fast editing keymaps
"-------------------------------------------------------------------------------
nnoremap <leader>ss     :w!<cr>
nnoremap <leader>gg     :Rgrep<cr>
nnoremap <leader>gc     :Rgrep<cr><cr><cr>.cpp *.c<cr>
nnoremap <leader>gh     :Rgrep<cr><cr><cr>.hpp *.h<cr>
nnoremap <leader>gx     :Rgrep<cr><cr><cr>.xml<cr>
nnoremap <leader>gs     :Rgrep<cr><cr><cr>.sh<cr>
nnoremap <leader>so     :so %<cr>
nnoremap <leader>e      :e! ~/.vimrc<cr>
nnoremap <leader>h      :noh<cr>
nnoremap <leader>t      :silent !ctags -R --sort=foldcase --c++-kinds=+p --fields=+ianS --extra=+q --language-force=auto .<cr>:redraw!<cr>
"-------------------------------------------------------------------------------
" Quickfix bindings
"-------------------------------------------------------------------------------
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
"-------------------------------------------------------------------------------
" Set Function keymaps
"-------------------------------------------------------------------------------
nnoremap <silent> <F1>        :BufExplorerHorizontalSplit<cr>
nnoremap <silent> <F2>        :NERDTreeToggle<cr>:wincmd p<cr>
nnoremap <silent> <F3>        :TagbarToggle<cr>
nnoremap <silent> <F4>        :TQuickFix<cr>
nnoremap <silent> <F5>        :YcmDiags<CR>
inoremap <silent> <F1>   <esc>:BufExplorerHorizontalSplit<cr>
inoremap <silent> <F2>   <Esc>:NERDTreeToggle<cr>
inoremap <silent> <F3>   <Esc>:TagbarToggle<cr>
inoremap <silent> <F4>   <esc>:TQuickFix<cr> 
inoremap <silent> <F5>   <esc>:YcmDiags<CR>
"-------------------------------------------------------------------------------
" Don't close window when deleting a buffer
"-------------------------------------------------------------------------------
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
nnoremap <leader>q      :BClose<cr>
"-------------------------------------------------------------------------------
" Make editing easier
"-------------------------------------------------------------------------------
nnoremap <space>        i<space><esc><right>
nnoremap <backspace>    X
noremap  s  <nop>
noremap  S  <nop>
nnoremap t<cr>    :tabnew<cr>
nnoremap tq       :tabclose<cr>
nnoremap tn       :tabn<cr>
nnoremap tp       :tabp<cr>
nnoremap tm       :tabm<cr>
nnoremap <c-h>    8<left>
nnoremap <c-j>    8<down>
nnoremap <c-k>    8<up>
nnoremap <c-l>    8<right>
vnoremap <c-h>    8<left>
vnoremap <c-j>    8<down>
vnoremap <c-k>    8<up>
vnoremap <c-l>    8<right>
"-------------------------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"-------------------------------------------------------------------------------
xnoremap  '  s''<esc>P<right>
xnoremap  "  s""<esc>P<right>
xnoremap  `  s``<esc>P<right>
xnoremap  (  s()<esc>P<right>
xnoremap  [  s[]<esc>P<right>
xnoremap  {  s{}<esc>P<right>
"-------------------------------------------------------------------------------
" autocomplete other half
"-------------------------------------------------------------------------------
inoremap  /*       /*<Space><Space>*/<Left><Left><Left>
vnoremap  /*      s/*<Space><Space>*/<Left><Left><Left><Esc>p
inoremap  /*<CR>  /*<CR><CR>/<Esc>kA<Space>
inoremap  {<CR>    {<CR>}<Esc>O
vnoremap  {<CR>   S{<CR>}<Esc>Pk=iB

"===================================================================================
" PLUGIN CONFIGURATIONS {{{1
"===================================================================================
"-------------------------------------------------------------------------------
" Vundle
"-------------------------------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
" from vim-scripts
Plugin 'grep.vim'
Plugin 'vcscommand.vim'
Plugin 'quickfixsigns'
Plugin 'Align'
Plugin 'xmledit'
" from 3rd git-hub
Plugin 'majutsushi/tagbar'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tomtom/tcomment_vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
call vundle#end()
filetype plugin indent on
"-------------------------------------------------------------------------------
" Align
"-------------------------------------------------------------------------------
let g:Align_xstrlen = 3
"-------------------------------------------------------------------------------
" Grep
"-------------------------------------------------------------------------------
let Grep_Default_Filelist = '*'
let Grep_Skip_Dirs        = 'CVS .svn'
let Grep_Skip_Files       = 'tags cscope'
"-------------------------------------------------------------------------------
" NERDTree
"-------------------------------------------------------------------------------
let NERDChristmasTree     = 1
let NERDTreeAutoCenter    = 0
let NERDTreeShowBookmarks = 1
let NERDTreeMouseMode     = 1
let NERDTreeShowFiles     = 1
let NERDTreeChDirMode     = 2
let NERDTreeShowHidden    = 0
let NERDTreeWinPos        = 'left'
let NERDTreeWinSize       = 35
let NERDTreeBookmarksFile = $HOME."/.vim/.NERDTreeBookmarks"
let NERDTreeIgnore        = ['\.dep$','\.o$','\.d$']
"-------------------------------------------------------------------------------
" TComment
"-------------------------------------------------------------------------------
nmap <c-c> <Plug>TComment_gcc
xmap <c-c> <Plug>TComment_gc
"-------------------------------------------------------------------------------
" tagbar
"-------------------------------------------------------------------------------
let g:tagbar_autofocus = 1
"-------------------------------------------------------------------------------
" taglist 
"-------------------------------------------------------------------------------
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 
"-------------------------------------------------------------------------------
" YouCompleteMe
"-------------------------------------------------------------------------------
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

"===================================================================================
" PREDEFINED LINES {{{1
"===================================================================================
"-------------------------------------------------------------------------------
" binary file
"-------------------------------------------------------------------------------
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
"-------------------------------------------------------------------------------
" Bash
"-------------------------------------------------------------------------------
" comment func
function! s:LeoBashComment()
  let s:eol   = "\<enter>"
  let s:date  = strftime("%Y-%m-%d")
  let s:fname = expand('%:t')
  let s:head =              "#!/bin/bash"
  let s:head = s:head.s:eol."#==============================================================================="
  let s:head = s:head.s:eol."#      FILENAME: ".s:fname
  let s:head = s:head.s:eol."#"
  let s:head = s:head.s:eol."#   DESCRIPTION: ---"
  let s:head = s:head.s:eol."#         NOTES: ---"
  let s:head = s:head.s:eol."#        AUTHOR: leoxiang, leoxiang727@qq.com"
  let s:head = s:head.s:eol."#       COMPANY: "
  let s:head = s:head.s:eol."#      REVISION: ".s:date." by leoxiang"
  let s:head = s:head.s:eol."#==============================================================================="
  let s:tail =        s:eol."# vim:ts=2:sw=2:et:ft=sh:"
  exec "normal O".s:head
  exec "normal Go".s:tail
  exec "normal kO"
  start!
endfunction 
" set autocmd
if has("autocmd")
  autocmd! BufNewFile *.sh
  autocmd  BufNewFile *.sh call s:LeoBashComment()
endif
"-------------------------------------------------------------------------------
" Makefile
"-------------------------------------------------------------------------------
" comment func
function! s:LeoMakefileComment()
  let s:eol   = "\<enter>\<esc>d0i"
  let s:date  = strftime("%Y-%m-%d")
  let s:fname = expand('%:t')
  let s:head =              "#==============================================================================="
  let s:head = s:head.s:eol."#      FILENAME: ".s:fname
  let s:head = s:head.s:eol."#         USAGE: make            :generate executable"
  let s:head = s:head.s:eol."#                make clean      :remove objects, executable, prerequisits"
  let s:head = s:head.s:eol."#"
  let s:head = s:head.s:eol."#   DESCRIPTION: ---"
  let s:head = s:head.s:eol."#         NOTES: Makefile.shared - define project configuration"
  let s:head = s:head.s:eol."#                Makefile.rule  - auto-generate dependencies for c/c++ files"
  let s:head = s:head.s:eol."#                Remember to inlcude build.mk after all your targets!"
  let s:head = s:head.s:eol."#        AUTHOR: leoxiang, leoxiang727@qq.com"
  let s:head = s:head.s:eol."#       COMPANY: "
  let s:head = s:head.s:eol."#      REVISION: ".s:date." by leoxiang"
  let s:head = s:head.s:eol."#==============================================================================="
  let s:tail =        s:eol."# vim:ts=4:sw=4:ft=make:"
  exec "normal O".s:head
  exec "normal Go".s:tail
  exec "normal kO"
endfunction
" set autocmd
if has("autocmd")
  autocmd! BufNewFile Makefile,*.mk
  autocmd  BufNewFile Makefile,*.mk call s:LeoMakefileComment()
endif
"-------------------------------------------------------------------------------
" C/C++
"-------------------------------------------------------------------------------
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
  call s:LeoCInit()
  exec "normal Gkk"
  start!
endfunction 
" init func
function! s:LeoCInit()
  set fdm=indent
  set fdc=2
  set fdl=99
endfunction 
" set autocmd
if has("autocmd")
  autocmd  BufNewFile *.c,*.cpp,*.cc,*.h,*.hpp call s:LeoCComment()
  autocmd  BufReadPre *.c,*.cpp,*.cc,*.h,*.hpp call s:LeoCInit()
endif
" fix gcc 4.8 compile errror
set errorformat^=%-GIn\ file\ included\ from\ %f:%l:%c:,%-GIn\ file
      \\ included\ from\ %f:%l:%c\\,,%-GIn\ file\ included\ from\ %f
      \:%l:%c,%-GIn\ file\ included\ from\ %f:%l
set equalprg=clang-format
"-------------------------------------------------------------------------------
" XML
"-------------------------------------------------------------------------------
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
" init func
function! s:LeoXMLInit()
  set fdm=syntax
  set fdc=2
  set fdl=99
endfunction 
" set autocmd
if has("autocmd")
  autocmd  BufNewFile *.xml call s:LeoXMLComment()
  autocmd  BufReadPre *.xml call s:LeoXMLInit()
endif
"-------------------------------------------------------------------------------
" Protobuf
"-------------------------------------------------------------------------------
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
  call s:LeoProtoInit()
  exec "normal Gkk"
  start!
endfunction 
" init func
function! s:LeoProtoInit()
  set ft=proto
  set fdm=indent
  set fdc=2
  set fdl=99
endfunction 
" set autocmd
if has("autocmd")
  autocmd  BufNewFile *.proto call s:LeoProtoComment()
  autocmd  BufReadPre *.proto call s:LeoProtoInit()
endif

" vim:ts=2:sw=2:et:ft=vim:tw=85:fdm=marker:fdc=2
