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
let os_type = 'linux' " Specify your OS type: linux, mac, windows
set nocompatible    " Use Vim settings, rather then Vi settings. Set this first.
syntax   on         " Switch syntax highlighting on.
filetype plugin on  " Enable file type detection.
filetype indent on  " Enable language-dependent indenting.
"-------------------------------------------------------------------------------
" OS specific settings
"-------------------------------------------------------------------------------
if os_type == 'linux'
  set backupdir=~/.vim/.backup    " set path used to store backup files.
  set directory=.,~/.vim/.swap    " set path used to store swap files.
  set path=.,/usr/include,,       " set path used to search for files.
elseif os_type == 'mac'
elseif os_type == 'windows'
endif
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
set cst                         " let <C-LeftMouse> use ctags instead of tags
set completeopt=menuone         " let clang_complete not popup preview window

"===================================================================================
" EDIT SETTINGS {{{1
"===================================================================================
"-------------------------------------------------------------------------------
" Automatic open quickfix windows after cmd, like make.
"-------------------------------------------------------------------------------
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow
"-------------------------------------------------------------------------------
" Multi-encoding setting
"-------------------------------------------------------------------------------
"use fencview plugin
let g:fencview_autodetect = 1   
"vim internal support
if has("multi_byte")
  " set vim internal encoding
  set encoding=UTF-8
  set langmenu=en_US.UTF-8
  language message en_US.UTF-8
  " set this according to term
  set termencoding=UTF-8
  " set auto detect
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
else
  echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif
"-------------------------------------------------------------------------------
" Set font type and size depending on OS type
"-------------------------------------------------------------------------------
if os_type == "mac"
  set gfn=bitstream\ vera\ sans\ mono:h13
  set shell=/bin/bash
elseif os_type == "windows"
  set gfn=bitstream\ vera\ sans\ mono:h10
elseif os_type == "linux"
  set gfn=bitstream\ vera\ sans\ mono\ 11
  set gfw=microsoft\ yahei
  set shell=/bin/bash
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
nmap <2-leftmouse>  *N
nmap <rightmouse>   <c-o>
"-------------------------------------------------------------------------------
" Some fast editing keymaps
"-------------------------------------------------------------------------------
nmap <leader>ss     :w!<cr>
nmap <leader>gg     :Rgrep<cr>
nmap <leader>gc     :Rgrep<cr><cr><cr>.cpp *.c<cr>
nmap <leader>gh     :Rgrep<cr><cr><cr>.hpp *.h<cr>
nmap <leader>gx     :Rgrep<cr><cr><cr>.xml<cr>
nmap <leader>gs     :Rgrep<cr><cr><cr>.sh<cr>
nmap <leader>so     :so %<cr>
nmap <leader>mm     :Man 
nmap <leader>e      :e! ~/.vimrc<cr>
nmap <leader>h      :noh<cr>
nmap <leader>t      :call g:ClangUpdateQuickFix()<cr>:silent !ctags -R --sort=foldcase --c++-kinds=+p --fields=+ianS --extra=+q --language-force=auto .<cr>:redraw!<cr>
nmap <leader>dd     :Dox<cr>
nmap <leader>df     :DoxAuthor<cr>
nmap <leader>dl     :DoxLic<cr>
nmap <leader>db     :DoxBlock<cr>
nmap <leader>du     :DoxUndoc<cr>
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
nmap <leader>,  :cp<cr>
nmap <leader>.  :cn<cr>
nmap <leader>/  :cc<cr>
"-------------------------------------------------------------------------------
" Set Function keymaps
"-------------------------------------------------------------------------------
nmap <silent> <F1>        :BufExplorerHorizontalSplit<cr>
nmap <silent> <F2>        :NERDTreeToggle<cr>:wincmd p<cr>
nmap <silent> <F3>        :TlistToggle<cr>
nmap <silent> <F4>        :TQuickFix<cr>
imap <silent> <F1>   <esc>:BufExplorerHorizontalSplit<cr>
imap <silent> <F2>   <Esc>:NERDTreeToggle<cr>
imap <silent> <F3>   <Esc>:TlistToggle<cr>
imap <silent> <F4>   <esc>:TQuickFix<cr> 
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
nmap <leader>q      :BClose<cr>
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
xnoremap  <leader>'  s''<esc>P<right>
xnoremap  <leader>"  s""<esc>P<right>
xnoremap  <leader>`  s``<esc>P<right>
xnoremap  <leader>(  s()<esc>P<right>
xnoremap  <leader>[  s[]<esc>P<right>
xnoremap  <leader>{  s{}<esc>P<right>

"===================================================================================
" PLUGIN CONFIGURATIONS {{{1
"===================================================================================
"-------------------------------------------------------------------------------
" Manpageview
"-------------------------------------------------------------------------------
let g:manpageview_winopen = 'vsplit='
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
" NERD_Tree
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
" NERD_Commenter
"-------------------------------------------------------------------------------
let NERDCreateDefaultMappings = 0
nmap <c-c> <Plug>NERDCommenterComment
nmap <c-x> <Plug>NERDCommenterUncomment
vmap <c-c> <Plug>NERDCommenterComment
vmap <c-x> <Plug>NERDCommenterUncomment
"-------------------------------------------------------------------------------
" taglist 
"-------------------------------------------------------------------------------
let Tlist_Auto_Highlight_Tag        = 1
let Tlist_Auto_Update               = 1
let Tlist_Close_On_Select           = 0
let Tlist_Compact_Format            = 0
let Tlist_Ctags_Cmd                 = "/usr/bin/ctags"
let Tlist_Display_Tag_Scope         = 1
let Tlist_Enable_Fold_Column        = 1
let Tlist_File_Fold_Auto_Close      = 1
let Tlist_GainFocus_On_ToggleOpen   = 0
let Tlist_Display_Prototype         = 0
let Tlist_Show_One_File             = 0
let Tlist_Sort_Type                 = 'order'
let Tlist_Use_Right_Window          = 1
let Tlist_WinWidth                  = 35
"-------------------------------------------------------------------------------
" clang_complete
"-------------------------------------------------------------------------------
let g:clang_auto_select       = 0
let g:clang_complete_auto     = 1
let g:clang_complete_copen    = 0
let g:clang_hl_errors         = 0
let g:clang_periodic_quickfix = 0
let g:clang_snippets          = 1
let g:clang_close_preview     = 1
let g:clang_complete_macros   = 1
let g:clang_use_library       = 1
let g:clang_library_path      = "/usr/lib64/llvm"
let g:clang_user_options      = "-stdlib=libstdc++"
"-------------------------------------------------------------------------------
"" Ctags
""-------------------------------------------------------------------------------
set tags=tags,.tags

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
function! s:LeoCInit()
  set fdm=indent
  set fdc=2
  set fdl=99
  inoremap  <buffer>  /*       /*<Space><Space>*/<Left><Left><Left>
  vnoremap  <buffer>  /*      s/*<Space><Space>*/<Left><Left><Left><Esc>p
  inoremap  <buffer>  /*<CR>  /*<CR><CR>/<Esc>kA<Space>
  inoremap  <buffer>  {<CR>    {<CR>}<Esc>O
  vnoremap  <buffer>  {<CR>   S{<CR>}<Esc>Pk=iB
endfunction 
if has("autocmd")
  autocmd  BufNewFile *.c,*.cpp,*.cc,*.h,*.hpp call s:LeoCComment()
  autocmd  BufReadPre *.c,*.cpp,*.cc,*.h,*.hpp call s:LeoCInit()
endif
"-------------------------------------------------------------------------------
" XML
"-------------------------------------------------------------------------------
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
function! s:LeoXMLInit()
  set fdm=syntax
  set fdc=2
  set fdl=99
endfunction 
if has("autocmd")
  autocmd  BufNewFile *.xml call s:LeoXMLComment()
  autocmd  BufReadPre *.xml call s:LeoXMLInit()
endif
"-------------------------------------------------------------------------------
" Protobuf
"-------------------------------------------------------------------------------
augroup filetype
  au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

" vim:ts=2:sw=2:et:ft=vim:tw=85:fdm=marker:fdc=2
