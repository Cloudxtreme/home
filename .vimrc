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
autocmd QuickFixCmdPost [^l]* nested bot cwindow 5 | redraw
autocmd QuickFixCmdPost    l* nested bot lwindow 5 | redraw
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
  bot cwindow 5
endfunction
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
" Set mouse behavior
"------------------------------------------------------------
nnoremap <2-leftmouse>  *N
nnoremap <rightmouse>   <c-o>
nnoremap <c-leftmouse>  <leftmouse>:YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <c-rightmouse> <leftmouse><c-]>
"------------------------------------------------------------
" Some fast editing keymaps
"------------------------------------------------------------
nnoremap <leader>s        :w!<cr>
nnoremap <leader>m        :make<cr>:redraw!<cr>
nnoremap <leader>gg       :Rgrep<cr>
nnoremap <leader>gc       :Rgrep<cr><cr><cr>.cpp *.c<cr>
nnoremap <leader>gh       :Rgrep<cr><cr><cr>.hpp *.h<cr>
nnoremap <leader>ga       :Rgrep<cr><cr><cr>.hpp *.h *.cpp *.c<cr>
nnoremap <leader>gs       :Rgrep<cr><cr><cr>.sh<cr>
nnoremap <leader>e        :e! ~/.vimrc<cr>
nnoremap <leader>p        ::UltiSnipsEdit<cr>
nnoremap <leader>t        :silent !ctags -R --sort=foldcase --c++-kinds=+p --fields=+ianS --extra=+q --language-force=auto .<cr>:redraw!<cr>
nnoremap <leader><space>  :FixWhitespace<cr>
nnoremap <leader>y        :YcmDiags<CR>
nnoremap <leader>i        :IndentLinesToggle<cr>
nnoremap <Leader>c        :ClangFormatAutoToggle<CR>
nnoremap <Leader>cf       :<C-u>ClangFormat<CR>
vnoremap <Leader>cf       :ClangFormat<CR>
nnoremap <leader>,        :cp<cr>
nnoremap <leader>.        :cn<cr>
nnoremap <leader>/        :cc<cr>
"------------------------------------------------------------
" Make editing easier
"------------------------------------------------------------
nnoremap <space>    i<space><esc><right>
nnoremap Q          <nop>
nnoremap s          :noh<cr>
nnoremap S          :noh<cr>
xnoremap p          pgvy
" nmap     f          <Plug>(easymotion-s)
" vmap     f          <Plug>(easymotion-s)
vmap     v          <Plug>(expand_region_expand)
vmap     <Enter>    <Plug>(EasyAlign)
noremap  <c-h>      8<left>
noremap  <c-j>      8<down>
noremap  <c-k>      8<up>
noremap  <c-l>      8<right>
noremap  <c-a>      <pageup>
noremap  <c-u>      <pagedown>
noremap  <c-s>      :BClose<cr>
noremap  <c-w>      :winc w<cr>
noremap  <c-q>      :winc q<cr>
noremap  <c-f>      :CtrlP<cr>
nmap     <c-c>      <Plug>TComment_gcc
vmap     <c-c>      <Plug>TComment_gc
map      <c-left>   zM
map      <c-right>  zR
" ------------------------------------------------------------
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
" Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'junegunn/vim-easy-align'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/LeaderF'
Plugin 'majutsushi/tagbar'
Plugin 'rhysd/vim-clang-format'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sukima/xmledit'
Plugin 'SirVer/ultisnips'
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
let NERDTreeWinSize       = 35
let NERDTreeBookmarksFile = $HOME."/.vim/.NERDTreeBookmarks"
let NERDTreeIgnore        = ['objdep$','\.o$','\.d$']
"------------------------------------------------------------
" easy align
"------------------------------------------------------------
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
" tagbar
"------------------------------------------------------------
let g:tagbar_width = 40
let g:tagbar_sort = 0
let g:tagbar_autoshowtag = 1
"------------------------------------------------------------
" YouCompleteMe
"------------------------------------------------------------
let g:ycm_global_ycm_extra_conf               = '~/.vim/.ycm_extra_conf.py'
let g:ycm_error_symbol                        = '>>'
let g:ycm_warning_symbol                      = '>*'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax        = 1
let g:ycm_confirm_extra_conf                  = 0
let g:ycm_complete_in_comments                = 1
let g:ycm_key_list_select_completion          = ['<down>']
let g:ycm_key_list_previous_completion        = ['<up>']
"------------------------------------------------------------
" UltiSnips
"------------------------------------------------------------
" if has expand snippet, expand it
" else if has complete options, navigate
" else return original tab
function! g:Tab()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
      if pumvisible()
        return "\<c-n>"
      else
        return "\<tab>"
      endif
    else
      return ""
    endif
endfunction
" if has snippet jump forward, then jump
" else return original enter
function! g:Enter()
  call UltiSnips#JumpForwards()
  if g:ulti_jump_forwards_res == 0
    return "\<enter>"
  else
    return ""
endfunction
au InsertEnter * exec "inoremap <silent> <tab> <c-r>=g:Tab()<cr>"
au InsertEnter * exec "inoremap <silent> <enter> <c-r>=g:Enter()<cr>"
" let g:UltiSnipsExpandTrigger = "<tab>"
" let g:UltiSnipsJumpForwardTrigger = "<enter>"
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
" "------------------------------------------------------------
" " easy motion
" "------------------------------------------------------------
" let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
" let g:EasyMotion_smartcase = 1
" let g:EasyMotion_use_smartsign_us = 1
" let g:EasyMotion_use_upper = 1
" let EasyMotion_leader_key='<leader><f12>'
"------------------------------------------------------------
" expand region
"------------------------------------------------------------
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
let g:ctrlp_match_window='top,order:btt,min:1,max:10,results:20'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|svn)$',
  \ 'file': '\v\.(exe|so|dll|d|o)$',
  \ }
"------------------------------------------------------------
" clang format
"------------------------------------------------------------
let g:clang_format#code_style = "google"
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AlignTrailingComments" : "true",
            \ "AlwaysBreakBeforeMultilineStrings" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "BinPackParameters" : "true",
            \ "ColumnLimit" : 120,
            \ "ConstructorInitializerAllOnOneLineOrOnePerLine" : "true",
            \ "Standard" : "C++11"}

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
" Bash
"------------------------------------------------------------
autocmd BufReadPre *.sh set fdm=indent fdl=99
"------------------------------------------------------------
" C/C++
"------------------------------------------------------------
autocmd BufReadPre *.c,*.cpp,*.cc,*.h,*.hpp set fdm=indent fdl=99
" fix gcc 4.8 compile errror
" set errorformat^=%-GIn\ file\ included\ from\ %f:%l:%c:,%-GIn\ file
"       \\ included\ from\ %f:%l:%c\\,,%-GIn\ file\ included\ from\ %f
"       \:%l:%c,%-GIn\ file\ included\ from\ %f:%l
"------------------------------------------------------------
" Protobuf
"------------------------------------------------------------
autocmd BufReadPre *.proto set fdm=indent fdl=99
"------------------------------------------------------------
" XML
"------------------------------------------------------------
autocmd BufReadPre *.xml set fdm=indent fdl=99

" vim:ts=2:sw=2:et:ft=vim:tw=85:fdm=marker
