"
" Tango Vim Color Scheme
" =======================
"
" For best results, set up your terminal with a Tango palette.
" Instructions for GNOME Terminal:
" http://uwstopia.nl/blog/2006/07/tango-terminal
"
" author:   Michele Campeotto <micampe@micampe.it>
"
set background=dark

highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "tango"

" Default Colors
highlight NonText       ctermfg=darkgray

" Search
highlight Search        cterm=none ctermfg=grey ctermbg=blue
highlight IncSearch     cterm=none ctermfg=yellow ctermbg=green

" Window Elements
highlight StatusLine    ctermfg=black    ctermbg=green      cterm=bold
highlight StatusLineNC  ctermfg=black    ctermbg=blue       cterm=bold
highlight Folded        ctermfg=white   ctermbg=magenta     cterm=none
highlight Visual        ctermbg=white   ctermfg=lightgreen  cterm=reverse
highlight Pmenu		    ctermfg=none    ctermbg=magenta
highlight PmenuSel	    ctermfg=none	ctermbg=blue
highlight PmenuSbar	    ctermfg=none    ctermbg=blue
highlight PmenuThumb	ctermfg=none    ctermbg=green
highlight TabLine	    ctermfg=white   ctermbg=magenta     cterm=reverse
highlight TabLineFill   ctermfg=white   ctermbg=magenta     cterm=reverse
highlight TabLineSel    ctermfg=white   ctermbg=magenta     cterm=bold
highlight CursorColumn	ctermfg=none	ctermbg=red
highlight CursorLine    ctermfg=none	ctermbg=none        cterm=underline
highlight MatchParen    ctermfg=none	ctermbg=magenta
if has('spell')
  highlight SpellBad	    ctermfg=none	ctermbg=red
  highlight SpellCap	    ctermfg=none	ctermbg=blue
  highlight SpellRare	    ctermfg=none	ctermbg=magenta
  highlight SpellLocal	ctermfg=none	ctermbg=green
endif

" Syntax
highlight Constant      ctermfg=magenta
highlight Number        ctermfg=white
highlight Statement     ctermfg=yellow
highlight Identifier    ctermfg=green
highlight PreProc       ctermfg=blue
highlight Comment       ctermfg=cyan cterm=none
highlight Type          ctermfg=green cterm=bold
highlight Special       ctermfg=magenta cterm=bold
highlight Function      ctermfg=white
highlight Repeat        ctermfg=white
highlight Directory	    ctermfg=blue
highlight Operator      ctermfg=red
highlight Ignore        ctermfg=white
highlight Error         ctermfg=white ctermbg=red
highlight Todo          ctermfg=white ctermbg=green
highlight Title         ctermfg=white cterm=bold

" Common groups that link to default highlighting.
hi link String	        Constant
hi link Character       Constant
hi link Number	        Number
hi link Boolean	        Number
hi link Float	        Number
hi link Conditional     Repeat
hi link Label	        Statement
hi link Keyword	        Statement
hi link Exception       Statement
hi link Include	        PreProc
hi link Define	        PreProc
hi link Macro		    PreProc
hi link PreCondit	    PreProc
hi link StorageClass	Type
hi link Structure	    Type
hi link Typedef	        Type
hi link Tag		        Special
hi link SpecialChar	    Special
hi link Delimiter	    Special
hi link SpecialComment  Special
hi link Debug		    Special

" Diff
highlight DiffAdd       ctermfg=gray ctermbg=blue cterm=none
highlight DiffChange    ctermfg=gray ctermbg=darkgray cterm=none
highlight DiffDelete    guibg=bg
highlight DiffDelete    ctermfg=gray ctermbg=none cterm=none
highlight DiffText      ctermfg=gray ctermbg=yellow cterm=none

