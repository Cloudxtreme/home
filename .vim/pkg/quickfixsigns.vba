" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
doc/quickfixsigns.txt	[[[1
386
*quickfixsigns.txt*   Mark quickfix & location list items with signs
                      Author: Thomas Link, micathom at gmail com

Display |signs| at interesting lines:

    - items in the |quickfix| and |location-lists| (e.g. compilation errors)
    - |marks| a-zA-Z
    - changes (given the file is under a VCS like git, svn, mercurial, 
      or bazaar)
    - relative line numbers (show numbers only until the cursor moves)
    - etc.

Other lists can be configured via the |g:quickfixsigns_lists| variable.

The text attached to a quickfix or location-list entry is displayed in a 
balloon via 'balloonexpr'.
NOTE: This could cause a conflict with other plugins that make use of 
balloons.

If you want nicer looking images instead of the ASCII markers, you have 
to change the following signs' definition either in your |vimrc| file or 
in $VIMFILES/after/plugin/quickfixsigns.vim (by use of |sign-define|):

    QFS_QFL ... Entries in the |quickfix| list
    QFS_LOC ... Entries in the |location-list|
    QFS_Mark_[a-zA-Z] ... Marks
    QFS_CURSOR ... Current cursor position
    QFS_BREAKPOINT ... Breakpoints
    QFS_REL_x ... Relative line numbers
    QFS_VCS_{ADD,DEL,CHANGE} ... VCS changes (see also 
            |g:quickfixsigns#vcsdiff#highlight|)

CREDITS:
quickfixsigns includes some icons from the open icon library. See 
http://openiconlibrary.sourceforge.net for details.


-----------------------------------------------------------------------
Install~

Edit the vba file and type: >

    :so %

See :help vimball for details. If you have difficulties or use vim 7.0, 
please make sure, you have the current version of vimball
(vimscript #1502) installed or update your runtime.


Optional enhancements~

If tinykeymap (vimscript #4199) is installed, a map (see 
|g:tinykeymap#map#quickfixsigns#map|, which defaults to <Leader>ms) can be used 
to jump from sign to sign or between sign groups.


========================================================================
Contents~

        :QuickfixsignsSet ........................... |:QuickfixsignsSet|
        :QuickfixsignsDisable ....................... |:QuickfixsignsDisable|
        :QuickfixsignsEnable ........................ |:QuickfixsignsEnable|
        :QuickfixsignsToggle ........................ |:QuickfixsignsToggle|
        :QuickfixsignsSelect ........................ |:QuickfixsignsSelect|
        g:quickfixsigns_classes ..................... |g:quickfixsigns_classes|
        g:quickfixsigns_events ...................... |g:quickfixsigns_events|
        g:quickfixsigns_class_rel ................... |g:quickfixsigns_class_rel|
        g:quickfixsigns_class_qfl ................... |g:quickfixsigns_class_qfl|
        g:quickfixsigns_class_loc ................... |g:quickfixsigns_class_loc|
        g:quickfixsigns_class_cursor ................ |g:quickfixsigns_class_cursor|
        g:quickfixsigns_balloon ..................... |g:quickfixsigns_balloon|
        g:quickfixsigns_max ......................... |g:quickfixsigns_max|
        g:quickfixsigns_blacklist_buffer ............ |g:quickfixsigns_blacklist_buffer|
        g:quickfixsigns_icons ....................... |g:quickfixsigns_icons|
        QuickfixsignsSelect ......................... |QuickfixsignsSelect()|
        QuickfixsignsUpdate ......................... |QuickfixsignsUpdate()|
        QuickfixsignsSet ............................ |QuickfixsignsSet()|
        QuickfixsignsUnique ......................... |QuickfixsignsUnique()|
        QuickfixsignsBalloon ........................ |QuickfixsignsBalloon()|
        QuickfixsignsToggle ......................... |QuickfixsignsToggle()|
        QuickfixsignsClear .......................... |QuickfixsignsClear()|
        QuickfixsignsListBufferSigns ................ |QuickfixsignsListBufferSigns()|
        g:quickfixsigns#use_relativenumber .......... |g:quickfixsigns#use_relativenumber|
        quickfixsigns#CompleteSelect ................ |quickfixsigns#CompleteSelect()|
        quickfixsigns#RelNumbersOnce ................ |quickfixsigns#RelNumbersOnce()|
        quickfixsigns#AssertUniqueSigns ............. |quickfixsigns#AssertUniqueSigns()|
        quickfixsigns#AssertNoObsoleteBuffers ....... |quickfixsigns#AssertNoObsoleteBuffers()|
        quickfixsigns#MoveSigns ..................... |quickfixsigns#MoveSigns()|
        g:quickfixsigns_class_marks ................. |g:quickfixsigns_class_marks|
        g:quickfixsigns#marks#buffer ................ |g:quickfixsigns#marks#buffer|
        g:quickfixsigns#marks#global ................ |g:quickfixsigns#marks#global|
        g:quickfixsigns#marks#texthl ................ |g:quickfixsigns#marks#texthl|
        quickfixsigns#marks#GetList ................. |quickfixsigns#marks#GetList()|
        quickfixsigns#marks#GetSign ................. |quickfixsigns#marks#GetSign()|
        g:quickfixsigns#vcsdiff#vcs ................. |g:quickfixsigns#vcsdiff#vcs|
        g:quickfixsigns_class_vcsdiff ............... |g:quickfixsigns_class_vcsdiff|
        g:quickfixsigns#vcsdiff#cd .................. |g:quickfixsigns#vcsdiff#cd|
        g:quickfixsigns#vcsdiff#cmd_separator ....... |g:quickfixsigns#vcsdiff#cmd_separator|
        g:quickfixsigns#vcsdiff#guess_type .......... |g:quickfixsigns#vcsdiff#guess_type|
        g:quickfixsigns#vcsdiff#highlight ........... |g:quickfixsigns#vcsdiff#highlight|
        quickfixsigns#vcsdiff#GuessType ............. |quickfixsigns#vcsdiff#GuessType()|
        quickfixsigns#vcsdiff#GetList ............... |quickfixsigns#vcsdiff#GetList()|
        g:quickfixsigns#breakpoints#filetypes ....... |g:quickfixsigns#breakpoints#filetypes|
        g:quickfixsigns_class_breakpoints ........... |g:quickfixsigns_class_breakpoints|
        quickfixsigns#breakpoints#GetList ........... |quickfixsigns#breakpoints#GetList()|
        quickfixsigns#breakpoints#Vim ............... |quickfixsigns#breakpoints#Vim()|
        g:tinykeymap#map#quickfixsigns#map .......... |g:tinykeymap#map#quickfixsigns#map|
        g:tinykeymap#map#quickfixsigns#options ...... |g:tinykeymap#map#quickfixsigns#options|


========================================================================
plugin/quickfixsigns.vim~

                                                    *:QuickfixsignsSet*
:QuickfixsignsSet
    Reset the signs in the current buffer.

                                                    *:QuickfixsignsDisable*
:QuickfixsignsDisable
    Disable quickfixsign.

                                                    *:QuickfixsignsEnable*
:QuickfixsignsEnable
    Enable quickfixsign.

                                                    *:QuickfixsignsToggle*
:QuickfixsignsToggle
    Toggle quickfixsign.

                                                    *:QuickfixsignsSelect*
:QuickfixsignsSelect
    Select the sign classes that should be displayed and reset the signs 
    in the current buffer.

                                                    *g:quickfixsigns_classes*
g:quickfixsigns_classes        (default: ['qfl', 'loc', 'marks', 'vcsdiff', 'breakpoints'])
    A list of sign classes that should be displayed.
    Can be one of:

      rel     ... relative line numbers
      cursor  ... current line
      qfl     ... |quickfix| list
      loc     ... |location| list
      vcsdiff ... mark changed lines (see |quickfixsigns#vcsdiff#GetList()|)
      marks   ... marks |'a|-zA-Z (see also " |g:quickfixsigns_marks|)

    The sign classes are defined in g:quickfixsigns_class_{NAME}.

    A sign class definition is a |Dictionary| with the following fields:

      sign:  The name of the sign, which has to be defined. If the 
             value begins with "*", the value is interpreted as 
             function name that is called with a qfl item as its 
             single argument.
      get:   A vim script expression as string that returns a list 
             compatible with |getqflist()|.
      event: A list of events on which signs of this type should be set
      level: Precedence of signs (if there are more signs at a line, 
             the one with the higher level will be displayed)
      timeout: Update the sign at most every X seconds
      test:  Update the sign only if the expression is true.

                                                    *g:quickfixsigns_events*
g:quickfixsigns_events         (default: ['BufEnter', 'CursorHold', 'CursorHoldI', 'InsertLeave', 'InsertEnter', 'InsertChange'])
    List of events for signs that should be frequently updated.

                                                    *g:quickfixsigns_class_rel*
g:quickfixsigns_class_rel      (default: {'sign': '*s:RelSign', 'get': 's:GetRelList(%s, "rel")', 'event': g:quickfixsigns_events, 'max': 9, 'level': 9})
    Signs for number of lines relative to the current line.
    Since 7.3, vim provides the 'relativenumber' option that provides 
    a similar functionality.
    See also |quickfixsigns#RelNumbersOnce()|.

                                                    *g:quickfixsigns_class_qfl*
g:quickfixsigns_class_qfl      (default: {'sign': 'QFS_QFL', 'get': 's:GetQFList(%s)', 'event': ['BufEnter', 'CursorHold', 'CursorHoldI', 'QuickFixCmdPost'], 'level': 7, 'scope': 'vim'})
    Signs for |quickfix| lists.

                                                    *g:quickfixsigns_class_loc*
g:quickfixsigns_class_loc      (default: {'sign': 'QFS_LOC', 'get': 's:GetLocList(%s)', 'event': ['BufEnter', 'CursorHold', 'CursorHoldI', 'QuickFixCmdPost'], 'level': 8})
    Signs for |location| lists.

                                                    *g:quickfixsigns_class_cursor*
g:quickfixsigns_class_cursor   (default: {'sign': 'QFS_CURSOR', 'get': 's:GetCursor(%s)', 'event': ['BufEnter', 'CursorHold', 'CursorHoldI', 'CursorMoved', 'CursorMovedI'], 'timeout': 1, 'level': 3})
    Sign for the current cursor position. The cursor position is 
    lazily updated. If you want something more precise, consider 
    setting 'cursorline'.

                                                    *g:quickfixsigns_balloon*
g:quickfixsigns_balloon        (default: 1)
    If non-null, display a balloon when hovering with the mouse over 
    the sign.
    buffer-local or global

                                                    *g:quickfixsigns_max*
g:quickfixsigns_max            (default: 500)
    Don't display signs if the list is longer than n items.

                                                    *g:quickfixsigns_blacklist_buffer*
g:quickfixsigns_blacklist_buffer (default: '^\(__.*__\|NERD_tree_.*\|-MiniBufExplorer-\)$')
    Don't show signs in buffers matching this |regexp|.

                                                    *g:quickfixsigns_icons*
g:quickfixsigns_icons          (default: {})
    A dictionary {TYPE => IMAGE_FILENAME} that is used to select 
    icons that should be displayed as signs.
    Defaults to empty on windows and non-gui versions.

                                                    *QuickfixsignsSelect()*
QuickfixsignsSelect(list)

                                                    *QuickfixsignsUpdate()*
QuickfixsignsUpdate(?class="")

                                                    *QuickfixsignsSet()*
QuickfixsignsSet(event, ?classes=[])
    (Re-)Set the signs that should be updated at a certain event. If event 
    is empty, update all signs.

    Normally, the end-user doesn't need to call this function.

    If the buffer-local variable b:quickfixsigns_ignore (a list of 
    strings) exists, sign classes in that list won't be displayed for the 
    current buffer.

                                                    *QuickfixsignsUnique()*
QuickfixsignsUnique(list)

                                                    *QuickfixsignsBalloon()*
QuickfixsignsBalloon()

                                                    *QuickfixsignsToggle()*
QuickfixsignsToggle()

                                                    *QuickfixsignsClear()*
QuickfixsignsClear(class)
    Clear all signs with name SIGN.

                                                    *QuickfixsignsListBufferSigns()*
QuickfixsignsListBufferSigns(bufnr)


========================================================================
autoload/quickfixsigns.vim~

                                                    *g:quickfixsigns#use_relativenumber*
g:quickfixsigns#use_relativenumber (default: v:version >= 703)
    VIM 7.3 and later: If non-zero, |quickfixsigns#RelNumbersOnce()| 
    uses 'relativenumber' instead of signs. This avoids clashes with 
    other signs and is faster, but it could cause the visible text area 
    to be temporarily moved to the right.

                                                    *quickfixsigns#CompleteSelect()*
quickfixsigns#CompleteSelect(ArgLead, CmdLine, CursorPos)

                                                    *quickfixsigns#RelNumbersOnce()*
quickfixsigns#RelNumbersOnce()
    Display relative line numbers. Remove the signs when the cursor moves.
    From vim 7.3 on, this uses the 'relativenumber' option.

                                                    *quickfixsigns#AssertUniqueSigns()*
quickfixsigns#AssertUniqueSigns(bufnr, bufsigns)

                                                    *quickfixsigns#AssertNoObsoleteBuffers()*
quickfixsigns#AssertNoObsoleteBuffers(register)

                                                    *quickfixsigns#MoveSigns()*
quickfixsigns#MoveSigns(n, ?pattern="", ?blockwise=0) "{{{3


========================================================================
autoload/quickfixsigns/marks.vim~

                                                    *g:quickfixsigns_class_marks*
g:quickfixsigns_class_marks    (default: {...})
    The definition of signs for marks.

                                                    *g:quickfixsigns#marks#buffer*
g:quickfixsigns#marks#buffer   (default: split('abcdefghijklmnopqrstuvwxyz''.', '\zs'))
    A list of buffer-local marks that should be displayed as signs. If 
    empty, disable the display of marks.

                                                    *g:quickfixsigns#marks#global*
g:quickfixsigns#marks#global   (default: split('ABCDEFGHIJKLMNOPQRSTUVWXYZ<>^', '\zs'))
    A list of global marks that should be displayed as signs. If 
    empty, disable the display of marks.

                                                    *g:quickfixsigns#marks#texthl*
g:quickfixsigns#marks#texthl   (default: 'Identifier')
    Highlight group for mark signs.

                                                    *quickfixsigns#marks#GetList()*
quickfixsigns#marks#GetList(filename)

                                                    *quickfixsigns#marks#GetSign()*
quickfixsigns#marks#GetSign(item)


========================================================================
autoload/quickfixsigns/vcsdiff.vim~

                                                    *g:quickfixsigns#vcsdiff#vcs*
g:quickfixsigns#vcsdiff#vcs    (default: {...})
    Show signs for new (+), changed (=), or deleted (-) lines.

    The signs for deleted lines are shown on the line before the 
    deleted one. I.e. if line 20 was deleted, the "-" sign will be put 
    on line 19.

    A dictionary of supported VCS names. Its values are dictionaries 
    with the following keys:
        cmd ... command templates that generate a unified diff file. 
        "%s" is replaced with the filename.
        dir ... the directory name
    Currently supported vcs: git, hg, svn, bzr

                                                    *g:quickfixsigns_class_vcsdiff*
g:quickfixsigns_class_vcsdiff  (default: {'sign': '*quickfixsigns#vcsdiff#Signs', 'get': 'quickfixsigns#vcsdiff#GetList(%s)', 'event': ['BufEnter', 'BufWritePost'], 'level': 6})

                                                    *g:quickfixsigns#vcsdiff#cd*
g:quickfixsigns#vcsdiff#cd     (default: 'cd')

                                                    *g:quickfixsigns#vcsdiff#cmd_separator*
g:quickfixsigns#vcsdiff#cmd_separator (default: '&&')
    Command to join two shell commands.

                                                    *g:quickfixsigns#vcsdiff#guess_type*
g:quickfixsigns#vcsdiff#guess_type (default: 1)
    If true, guess the vcs type by searching for the repo directory on 
    the hard disk (i.e., this will result in disk accesses for new 
    buffers).
    Can also be buffer-local.

                                                    *g:quickfixsigns#vcsdiff#highlight*
g:quickfixsigns#vcsdiff#highlight (default: {'DEL': 'DiffDelete', 'ADD': 'DiffAdd', 'CHANGE': 'DiffChange'})
    The highlighting of deleted lines can sometimes be confusing. In 
    order to disable the display of signs for DEL changes, save the 
    following line as after/autoload/quickfixsigns/vcsdiff.vim: >

      call remove(g:quickfixsigns#vcsdiff#highlight, 'DEL')
<

                                                    *quickfixsigns#vcsdiff#GuessType()*
quickfixsigns#vcsdiff#GuessType()
    Return the name of a VCS system based on the values of the following 
    variables:

      - b:git_dir
      - b:vcs_type
      - b:VCSCommandVCSType

    If none of these variables is defined, try to guess the vcs type.

                                                    *quickfixsigns#vcsdiff#GetList()*
quickfixsigns#vcsdiff#GetList(filename)
    quickfixsigns#vcsdiff#GuessType() must return the name of a supported 
    VCS (see |g:quickfixsigns#vcsdiff#vcs|).


========================================================================
autoload/quickfixsigns/breakpoints.vim~

                                                    *g:quickfixsigns#breakpoints#filetypes*
g:quickfixsigns#breakpoints#filetypes (default: {...})

                                                    *g:quickfixsigns_class_breakpoints*
g:quickfixsigns_class_breakpoints (default: {...})

                                                    *quickfixsigns#breakpoints#GetList()*
quickfixsigns#breakpoints#GetList(filename)

                                                    *quickfixsigns#breakpoints#Vim()*
quickfixsigns#breakpoints#Vim()


========================================================================
autoload/tinykeymap/map/quickfixsigns.vim~

                                                    *g:tinykeymap#map#quickfixsigns#map*
g:tinykeymap#map#quickfixsigns#map (default: g:tinykeymap#mapleader .'s')

                                                    *g:tinykeymap#map#quickfixsigns#options*
g:tinykeymap#map#quickfixsigns#options (default: {...})



vim:tw=78:fo=tcq2:isk=!-~,^*,^|,^":ts=8:ft=help:norl:
plugin/quickfixsigns.vim	[[[1
794
" Mark quickfix & location list items with signs
" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @GIT:         http://github.com/tomtom/quickfixsigns_vim/
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2009-03-14.
" @Last Change: 2013-03-04.
" @Revision:    1167
" GetLatestVimScripts: 2584 1 :AutoInstall: quickfixsigns.vim

if &cp || exists("loaded_quickfixsigns") || !has('signs')
    finish
endif
let loaded_quickfixsigns = 101

let s:save_cpo = &cpo
set cpo&vim

" Reset the signs in the current buffer.
command! QuickfixsignsSet call QuickfixsignsSet("")

" Disable quickfixsign.
command! QuickfixsignsDisable call s:ClearSigns(keys(g:quickfixsigns_register)) | call QuickfixsignsSelect([])

" Enable quickfixsign.
command! QuickfixsignsEnable call QuickfixsignsSelect(g:quickfixsigns_classes) | QuickfixsignsSet

" Toggle quickfixsign.
command! QuickfixsignsToggle call QuickfixsignsToggle()

" Select the sign classes that should be displayed and reset the signs 
" in the current buffer.
command! -nargs=+ -complete=customlist,quickfixsigns#CompleteSelect QuickfixsignsSelect call QuickfixsignsSelect([<f-args>]) | call QuickfixsignsUpdate()


if !exists('g:quickfixsigns_debug')
    let g:quickfixsigns_debug = 0
endif


if !exists('g:quickfixsigns_classes')
    " A list of sign classes that should be displayed.
    " Can be one of:
    "
    "   rel     ... relative line numbers
    "   cursor  ... current line
    "   qfl     ... |quickfix| list
    "   loc     ... |location| list
    "   vcsdiff ... mark changed lines (see |quickfixsigns#vcsdiff#GetList()|)
    "   marks   ... marks |'a|-zA-Z (see also " |g:quickfixsigns_marks|)
    "
    " The sign classes are defined in g:quickfixsigns_class_{NAME}.
    "
    " A sign class definition is a |Dictionary| with the following fields:
    "
    "   sign:  The name of the sign, which has to be defined. If the 
    "          value begins with "*", the value is interpreted as 
    "          function name that is called with a qfl item as its 
    "          single argument.
    "   get:   A vim script expression as string that returns a list 
    "          compatible with |getqflist()|.
    "   event: A list of events on which signs of this type should be set
    "   level: Precedence of signs (if there are more signs at a line, 
    "          the one with the higher level will be displayed)
    "   timeout: Update the sign at most every X seconds
    "   test:  Update the sign only if the expression is true.
    let g:quickfixsigns_classes = ['qfl', 'loc', 'marks', 'vcsdiff', 'breakpoints']   "{{{2
    " let g:quickfixsigns_classes = ['rel', 'qfl', 'loc', 'marks']   "{{{2
endif


if !exists('g:quickfixsigns_events')
    " List of events for signs that should be frequently updated.
    let g:quickfixsigns_events = ['BufEnter', 'CursorHold', 'CursorHoldI', 'InsertLeave', 'InsertEnter', 'InsertChange']   "{{{2
endif


if !exists('g:quickfixsigns_class_rel')
    " Signs for number of lines relative to the current line.
    " Since 7.3, vim provides the 'relativenumber' option that provides 
    " a similar functionality.
    " See also |quickfixsigns#RelNumbersOnce()|.
    let g:quickfixsigns_class_rel = {'sign': '*s:RelSign', 'get': 's:GetRelList(%s, "rel")', 'event': g:quickfixsigns_events, 'max': 9, 'level': 9}  "{{{2
endif


if !exists('g:quickfixsigns_class_rel2')
    let g:quickfixsigns_class_rel2 = copy(g:quickfixsigns_class_rel)
    let g:quickfixsigns_class_rel2.get = 's:GetRelList(%s, "rel2")'
    let g:quickfixsigns_class_rel2.max = 99
endif


if !exists('g:quickfixsigns_class_qfl')
    " Signs for |quickfix| lists.
    let g:quickfixsigns_class_qfl = {'sign': 'QFS_QFL', 'get': 's:GetQFList(%s)', 'event': ['BufEnter', 'CursorHold', 'CursorHoldI', 'QuickFixCmdPost'], 'level': 7, 'scope': 'vim'}   "{{{2
endif


if !exists('g:quickfixsigns_class_loc')
    " Signs for |location| lists.
    let g:quickfixsigns_class_loc = {'sign': 'QFS_LOC', 'get': 's:GetLocList(%s)', 'event': ['BufEnter', 'CursorHold', 'CursorHoldI', 'QuickFixCmdPost'], 'level': 8}   "{{{2
endif


if !exists('g:quickfixsigns_class_cursor')
    " Sign for the current cursor position. The cursor position is 
    " lazily updated. If you want something more precise, consider 
    " setting 'cursorline'.
    let g:quickfixsigns_class_cursor = {'sign': 'QFS_CURSOR', 'get': 's:GetCursor(%s)', 'event': ['BufEnter', 'CursorHold', 'CursorHoldI', 'CursorMoved', 'CursorMovedI'], 'timeout': 1, 'level': 3}   "{{{2
endif


if !exists('g:quickfixsigns_balloon')
    " If non-null, display a balloon when hovering with the mouse over 
    " the sign.
    " buffer-local or global
    let g:quickfixsigns_balloon = 1   "{{{2
endif


if !exists('g:quickfixsigns_max')
    " Don't display signs if the list is longer than n items.
    let g:quickfixsigns_max = 500   "{{{2
endif


if !exists('g:quickfixsigns_blacklist_buffer')
    " Don't show signs in buffers matching this |regexp|.
    let g:quickfixsigns_blacklist_buffer = '^\(__.*__\|NERD_tree_.*\|-MiniBufExplorer-\)$'   "{{{2
endif


if !exists('g:quickfixsigns_icons')
    if has("gui_running")
        if !has('win16') && !has('win32') && !has('win64')
            let s:icons_dir = expand('<sfile>:p:h:h:') .'/bitmaps/open_icon_library/16x16/'
            if isdirectory(s:icons_dir)
                let g:quickfixsigns_icons = {
                            \ 'qfl': s:icons_dir .'status/dialog-error-5.png',
                            \ 'loc': s:icons_dir .'status/dialog-warning-4.png',
                            \ 'cursor': s:icons_dir .'actions/go-next-4.png',
                            \ 'breakpoint': s:icons_dir .'actions/media-playback-pause-3.png'
                            \ }
            endif
            unlet s:icons_dir
        endif
    endif
    if !exists('g:quickfixsigns_icons')
        " A dictionary {TYPE => IMAGE_FILENAME} that is used to select 
        " icons that should be displayed as signs.
        " Defaults to empty on windows and non-gui versions.
        let g:quickfixsigns_icons = {}   "{{{2
    endif
endif



" ----------------------------------------------------------------------
let s:quickfixsigns_base = 5272
let g:quickfixsigns_register = {}


function! s:PurgeRegister() "{{{3
    let bufnums = {}
    for [ikey, def] in items(g:quickfixsigns_register)
        let bufnr = def.bufnr
        if !bufloaded(bufnr)
            if g:quickfixsigns_debug && !has_key(bufnums, bufnr)
                echom "QuickFixSigns DEBUG PurgeRegister: Obsolete buffer:" bufnr
                let bufnums[bufnr] = 1
            endif
            call remove(g:quickfixsigns_register, ikey)
        endif
    endfor
endf


function! s:Redir(cmd) "{{{3
    let verbose = &verbose
    let &verbose = 0
    try
        redir => rv
        exec 'silent' a:cmd
        redir END
        return exists('rv')? rv : ''
    finally
        let &verbose = verbose
    endtry
endf


let s:signss = s:Redir('silent sign list')
let g:quickfixsigns_signs = split(s:signss, '\n')
call filter(g:quickfixsigns_signs, 'v:val =~ ''^sign QFS_''')
call map(g:quickfixsigns_signs, 'matchstr(v:val, ''^sign \zsQFS_\w\+'')')

if index(g:quickfixsigns_signs, 'QFS_QFL') == -1
    if exists('g:quickfixsigns_icons.qfl')
        exec 'sign define QFS_QFL text=* texthl=WarningMsg icon='. escape(g:quickfixsigns_icons.qfl, ' \')
    else
        sign define QFS_QFL text=* texthl=WarningMsg
    endif
endif

if index(g:quickfixsigns_signs, 'QFS_LOC') == -1
    if exists('g:quickfixsigns_icons.loc')
        exec 'sign define QFS_LOC text=> texthl=Special icon='. escape(g:quickfixsigns_icons.loc, ' \')
    else
        sign define QFS_LOC text=> texthl=Special
    endif
endif

if index(g:quickfixsigns_signs, 'QFS_CURSOR') == -1
    if exists('g:quickfixsigns_icons.cursor')
        exec 'sign define QFS_CURSOR text=- texthl=Question icon='. escape(g:quickfixsigns_icons.cursor, ' \')
    else
        sign define QFS_CURSOR text=- texthl=Question
    endif
endif

sign define QFS_DUMMY text=. texthl=NonText

let s:relmax = -1
function! s:GenRel(num) "{{{3
    " TLogVAR a:num
    " echom "DBG ". s:relmax
    if a:num > s:relmax && a:num < 100
        for n in range(s:relmax + 1, a:num)
            exec 'sign define QFS_REL_'. n .' text='. n .' texthl=LineNr'
        endfor
        let s:relmax = a:num
    endif
endf


function! QuickfixsignsSelect(list) "{{{3
    let classes = exists('g:quickfixsigns_lists') ? keys(g:quickfixsigns_lists) : []
    let g:quickfixsigns_lists = {}
	for what in a:list
        if exists('g:quickfixsigns_class_'. what)
            let g:quickfixsigns_lists[what] = g:quickfixsigns_class_{what}
            let iwhat = index(classes, what)
            if iwhat != -1
                call remove(classes, iwhat)
            endif
        endif
	endfor
    for class in classes
        call QuickfixsignsClear(class)
    endfor
endf


" :display: QuickfixsignsUpdate(?class="")
function! QuickfixsignsUpdate(...) "{{{3
    let what = a:0 >= 1 ? a:1 : ""
    call QuickfixsignsClear(what)
    call QuickfixsignsSet("")
endf


" :display: QuickfixsignsSet(event, ?classes=[])
" (Re-)Set the signs that should be updated at a certain event. If event 
" is empty, update all signs.
"
" Normally, the end-user doesn't need to call this function.
"
" If the buffer-local variable b:quickfixsigns_ignore (a list of 
" strings) exists, sign classes in that list won't be displayed for the 
" current buffer.
function! QuickfixsignsSet(event, ...) "{{{3
    " TLogVAR a:event, a:000
    if exists("b:noquickfixsigns") && b:noquickfixsigns
        return
    endif
    let bufsignclasses = s:ListValues()
    " TLogVAR bufsignclasses
    if empty(bufsignclasses)
        return
    endif
    " TLogVAR a:event, a:000
    let filename = a:0 >= 2 ? a:2 : expand('%:p')
    " TLogVAR a:event, filename, bufname('%')
    if fnamemodify(filename, ':t') =~ g:quickfixsigns_blacklist_buffer
        return
    endif
    if !exists('b:quickfixsigns_last_line')
        let b:quickfixsigns_last_line = 0
    endif
    let bufnr = bufnr(filename)
    let anyway = empty(a:event)
    " TLogVAR bufnr, anyway, a:event
    call s:UpdateLineNumbers()
    for [class, def] in bufsignclasses
        " TLogVAR class, def
        if anyway
            let set = 1
        elseif index(get(def, 'event', ['BufEnter']), a:event) != -1
            let set = !has_key(def, 'test') || eval(def.test)
        else
            let set = 0
        endif
        if a:0 >= 1 && !empty(a:1)
            let select = index(a:1, class) != -1
        else
            let select = 1
        endif
        if set && select
            " TLogVAR class, set, select
            let t_d = get(def, 'timeout', 0)
            let t_l = localtime()
            let t_s = string(def)
            if !exists('b:quickfixsigns_last_run')
                let b:quickfixsigns_last_run = {}
            endif
            " TLogVAR t_s, t_d, t_l
            if anyway || (t_d == 0) || (t_l - get(b:quickfixsigns_last_run, t_s, 0) >= t_d)
                if g:quickfixsigns_debug
                    call quickfixsigns#AssertNoObsoleteBuffers(g:quickfixsigns_register)
                endif
                let b:quickfixsigns_last_run[t_s] = t_l
                let list = s:GetList(def, filename)
                " TLogVAR len(list)
                " TLogVAR list
                " TLogVAR class, 'scope == buffer'
                let scope_test = s:GetScopeTest(class, bufnr, '')
                if !empty(scope_test)
                    " echom "DBG" scope_test
                    " echom "DBG" string(list)
                    call filter(list, scope_test)
                endif
                " TLogVAR list
                if !empty(list) && len(list) < g:quickfixsigns_max
                    call s:UpdateSigns(class, def, bufnr, list)
                    if has('balloon_eval') && g:quickfixsigns_balloon
                        if exists('g:loaded_tlib') && g:loaded_tlib >= 39  " ignore dependency
                            call tlib#balloon#Register('QuickfixsignsBalloon()')
                        elseif !exists('b:quickfixsigns_balloon') && empty(&balloonexpr)
                            let b:quickfixsigns_ballooneval = &ballooneval
                            let b:quickfixsigns_balloonexpr = &balloonexpr
                            setlocal ballooneval balloonexpr=QuickfixsignsBalloon()
                            let b:quickfixsigns_balloon = 1
                        endif
                    endif
                else
                    call s:ClearBuffer(class, def.sign, bufnr, [])
                endif
            endif
        endif
    endfor
    let b:quickfixsigns_last_line = line('.')
endf


function! s:UpdateSigns(class, def, bufnr, list) "{{{3
    let new_ikeys = s:PlaceSign(a:class, a:def.sign, a:list)
    " if g:quickfixsigns_debug " DBG
        " let sign_ids = map(copy(new_ikeys), 'g:quickfixsigns_register[v:val].id') " DBG
        " TLogVAR sign_ids
    " endif " DBG
    call s:ClearBuffer(a:class, a:def.sign, a:bufnr, new_ikeys)
    if g:quickfixsigns_debug
        call quickfixsigns#AssertUniqueSigns(a:bufnr, QuickfixsignsListBufferSigns(a:bufnr))
    endif
endf


function! s:UpdateLineNumbers() "{{{3
    let buffersigns = {}
    let clear_ikeys = []
    for [ikey, item] in items(g:quickfixsigns_register)
        let bufnr = item.bufnr
        " if bufnr(bufnr) == -1
        if !bufloaded(bufnr) || bufnr <= 0
            if g:quickfixsigns_debug
                echom "QuickFixSigns DEBUG UpdateLineNumbers: Invalid bufnr:" string(bufnr)
            endif
        else
            let lnum = item.lnum
            let id = item.id
            if !has_key(buffersigns, bufnr)
                let bsigns = QuickfixsignsListBufferSigns(bufnr)
                let bufnrsigns = {}
                for sign in bsigns
                    let bufnrsigns[sign.id] = sign.lnum
                endfor
                let buffersigns[bufnr] = bufnrsigns
            else
                let bufnrsigns = buffersigns[bufnr]
            endif
            if has_key(bufnrsigns, id)
                let slnum = bufnrsigns[id]
                if slnum != lnum
                    " TLogVAR ikey, lnum, slnum
                    let item.lnum = slnum
                    let new_ikey = s:GetIKey(item)
                    if has_key(g:quickfixsigns_register, new_ikey)
                        " TLogVAR slnum, lnum
                        call add(clear_ikeys, ikey)
                    else
                        call remove(g:quickfixsigns_register, ikey)
                        let item.ikey = new_ikey
                        let g:quickfixsigns_register[new_ikey] = item
                        " TLogVAR ikey, new_ikey
                    endif
                endif
            elseif g:quickfixsigns_debug
                echom "QuickFixSigns UpdateLineNumbers: id not found:" bufnr id
            endif
        endif
    endfor
    if !empty(clear_ikeys)
        call s:ClearSigns(clear_ikeys)
    endif
endf


function! s:GetList(def, filename) "{{{3
    " TLogVAR a:def, a:filename
    let getter = printf(a:def.get, string(a:filename))
    " TLogVAR getter
    let list = copy(eval(getter))
    return list
endf


function! QuickfixsignsUnique(list) "{{{3
    let items = {}
    for item in a:list
        let id = printf('%d*%d', get(item, 'bufnr', get(item, 'filename', '')), get(item, 'lnum', 0))
        if has_key(items, id)
            let oitem = items[id]
            let oitem.text = join([get(oitem, 'text', ''), get(item, 'text', '')], "\n")
            let items[id] = oitem
        else
            let items[id] = item
        endif
    endfor
    return values(items)
endf


function! QuickfixsignsBalloon() "{{{3
    " TLogVAR v:beval_lnum, v:beval_col
    if v:beval_col <= 1
        let lnum = v:beval_lnum
        let bufnr = bufnr('%')
        " TLogVAR bufnr, lnum
        let bufname = bufname(bufnr)
        let acc = []
        for [class, def] in s:ListValues()
            let list = s:GetList(def, bufname)
            call filter(list, 'v:val.bufnr == bufnr && v:val.lnum == lnum')
            " TLogVAR list
            if !empty(list) && len(list) < g:quickfixsigns_max
                let acc += list
            endif
        endfor
        " TLogVAR acc
        return join(map(acc, 'v:val.text'), "\n")
    endif
    if exists('b:quickfixsigns_balloonexpr') && !empty(b:quickfixsigns_balloonexpr)
        let text = eval(b:quickfixsigns_balloonexpr)
        if !has('balloon_multiline')
            let text = substitute(text, '\n', ' ', 'g')
        endif
        return text
    else
        return ''
    endif
endf


function! QuickfixsignsToggle()
    if exists('g:quickfixsigns_register') && len(g:quickfixsigns_register) > 0
        exec 'QuickfixsignsDisable'
    else
        exec 'QuickfixsignsEnable'
    end
endfunction


function! s:GetCursor(bufname) "{{{3
    let pos = getpos('.')
    return [{'bufnr': bufnr('%'), 'lnum': pos[1], 'col': pos[2], 'text': 'Current line'}]
endf


function! s:ListValues() "{{{3
    let signs_lists = g:quickfixsigns_lists
    if exists('b:quickfixsigns_ignore')
        let signs_lists = filter(copy(signs_lists), 'index(b:quickfixsigns_ignore, v:key) == -1')
    endif
    return sort(items(signs_lists), 's:CompareClasses')
endf


function! s:CompareClasses(a, b) "{{{3
    let i1 = str2nr(get(a:a[1], 'level', 5))
    let i2 = str2nr(get(a:b[1], 'level', 5))
    return i1 == i2 ? 0 : i1 < i2 ? 1 : -1
endf


function! s:RelSign(item) "{{{3
    return 'QFS_'. a:item.text
endf


function! s:GetRelList(bufname, class) "{{{3
	let lnum = line('.')
	let col = col('.')
	let bufnr = bufnr('%')
    let top = line('w0') - lnum
    let bot = line('w$') - lnum
    let max = g:quickfixsigns_class_{a:class}.max
    if max >= 0
        let top = max([top, -max])
        let bot = min([bot, max])
    endif
    " TLogVAR top, bot
    call s:GenRel(max([abs(top), abs(bot)]))
    return map(range(top, bot), '{"bufnr": bufnr, "lnum": lnum + v:val, "col": col, "text": "REL_". abs(v:val)}')
endf


" Clear all signs with name SIGN.
function! QuickfixsignsClear(class) "{{{3
    " TLogVAR a:sign_rx
    let ikeys = keys(g:quickfixsigns_register)
    if !empty(a:class)
        call filter(ikeys, 'g:quickfixsigns_register[v:val].class ==# a:class')
    endif
    " TLogVAR ikeys
    call s:ClearSigns(ikeys)
endf


function! s:RemoveBuffer(bufnr) "{{{3
    " TLogVAR a:bufnr
    let old_ikeys = keys(filter(copy(g:quickfixsigns_register), s:GetScopeTest('', str2nr(a:bufnr), '')))
    " TLogVAR old_ikeys
    call s:ClearSigns(old_ikeys)
endf


" Clear all signs with name SIGN in buffer BUFNR.
function! s:ClearBuffer(class, sign, bufnr, keep_ikeys) "{{{3
    " TLogVAR a:class, a:sign, a:bufnr, a:keep_ikeys
    let old_ikeys = keys(filter(copy(g:quickfixsigns_register), s:GetScopeTest(a:class, a:bufnr, 'v:val.class ==# a:class && index(a:keep_ikeys, v:key) == -1')))
    " TLogVAR old_ikeys
    " if g:quickfixsigns_debug " DBG
        " let sign_ids = map(copy(old_ikeys), 'g:quickfixsigns_register[v:val].id') " DBG
        " TLogVAR sign_ids
    " endif " DBG
    call s:ClearSigns(old_ikeys)
endf


function! s:ClearSigns(ikeys) "{{{3
    for ikey in a:ikeys
        let def   = g:quickfixsigns_register[ikey]
        let bufnr = def.bufnr
        if bufloaded(bufnr)
            " TLogVAR bufnr, ikey
            exec 'sign unplace '. def.id .' buffer='. bufnr
        elseif g:quickfixsigns_debug
            echom "Quickfixsigns DEBUG: bufnr not loaded:" bufnr ikey string(def)
        endif
        call remove(g:quickfixsigns_register, ikey)
    endfor
endf


function! s:GetScopeTest(class, bufnr, tests) "{{{3
    let scope = empty(a:class) ? 'buffer' : get(g:quickfixsigns_class_{a:class}, 'scope', 'buffer')
    if scope == "vim"
        let rv = a:tests
    else
        let test = '(get(v:val, "scope", "buffer") == "vim" || v:val.bufnr == '. a:bufnr .')'
        if empty(a:tests)
            let rv = test
        else
            let rv = a:tests .' && '. test
        endif
    endif
    " TLogVAR rv
    return rv
endf


function! s:CreateBufferSignsCache() "{{{3
    if exists('s:buffer_signs')
        return 0
    else
        let s:buffer_signs = {}
        return 1
    endif
endf


function! s:RemoveBufferSignsCache(cbs) "{{{3
    if a:cbs
        unlet s:buffer_signs
    endif
endf


function! s:SignExistsAt(bufnr, lnum, sign) "{{{3
    " TLogVAR a:bufnr, a:lnum, a:sign
    if !has_key(s:buffer_signs, a:bufnr)
        let s:buffer_signs[a:bufnr] = QuickfixsignsListBufferSigns(a:bufnr)
    endif
    let bsigns = copy(s:buffer_signs[a:bufnr])
    " TLogVAR bsigns
    if empty(a:sign)
        call filter(bsigns, 'v:val.lnum == a:lnum')
    else
        call filter(bsigns, 'v:val.lnum == a:lnum && v:val.name == a:sign')
    endif
    return len(bsigns) > 0
endf


function! QuickfixsignsListBufferSigns(bufnr) "{{{3
    if a:bufnr == -1
        return []
    endif
    let signss = s:Redir('sign place buffer='. a:bufnr)
    if exists('signss')
        let signs = split(signss, '\n')
        let signs = map(signs, 's:ProcessSign(v:val)')
        let signs = filter(signs, '!empty(v:val)')
        " if len(signs) > 2
        "     call remove(signs, 0, 1)
        " else
        "     let signs = []
        " endif
    else
        if g:quickfixsigns_debug
            echohl WarningMsg
            echom "DEBUG quickfixsigns: BufferSigns:" a:bufnr
            echohl NONE
        endif
        let signs = []
    endif
    return signs
endf


function! s:ProcessSign(sign) "{{{3
    let m = matchlist(a:sign, '^\s\+\S\+=\(\d\+\)\s\+\S\+=\(\d\+\)\s\+\S\+=\(\S\+\)\s*$')
    " TLogVAR a:sign, m
    if empty(m)
        return {}
    else
        return {
                    \ 'sign': a:sign,
                    \ 'lnum': str2nr(m[1]),
                    \ 'id': str2nr(m[2]),
                    \ 'name': m[3],
                    \ }
    endif
endf


" Add signs for all locations in LIST. LIST must confirm with the 
" quickfix list format (see |getqflist()|; only the fields lnum and 
" bufnr are required).
"
" list:: a quickfix or location list
" sign:: a sign defined with |:sign-define|
function! s:PlaceSign(class, sign, list) "{{{3
    " TAssertType a:sign, 'string'
    " TAssertType a:list, 'list'
    " TLogVAR a:sign, a:list
    let keep_ikeys = []
    let cbs = s:CreateBufferSignsCache()
    try
        for item in a:list
            " TLogVAR item
            if item.lnum > 0
                let sign = s:GetSign(a:sign, item)
                let item = extend(item, {'class': a:class, 'sign': sign})
                let item = s:SetItemId(item)
                " TLogVAR item
                if !empty(item) && bufloaded(item.bufnr)
                    let ikey = item.ikey
                    " TLogVAR ikey, item
                    call add(keep_ikeys, ikey)
                    if item.new
                        " TLogVAR item.bufnr, item.ikey
                        let cmd = ':sign place '. item.id .' line='. item.lnum .' name='. sign .' buffer='. item.bufnr
                        " TLogDBG cmd
                        exec cmd
                        let g:quickfixsigns_register[ikey] = item
                    endif
                endif
            endif
        endfor
    finally
        call s:RemoveBufferSignsCache(cbs)
    endtry
    return keep_ikeys
endf


function! s:GetSign(sign, item) "{{{3
    if a:sign[0] == '*'
        let sign = call(a:sign[1 : -1], [a:item])
        " TLogVAR sign
    else
        let sign = a:sign
    endif
    return sign
endf


function! s:SetItemId(item) "{{{3
    " TLogVAR a:item
    let bufnr = get(a:item, 'bufnr', -1)
    if bufnr == -1
        return  {}
    else
        if !has_key(a:item, 'ikey')
            let a:item.ikey = s:GetIKey(a:item)
        endif
        let a:item.new = !has_key(g:quickfixsigns_register, a:item.ikey)
        if a:item.new
            let item = a:item
            let item.id = s:quickfixsigns_base
            let s:quickfixsigns_base += 1
        else
            let item = extend(copy(g:quickfixsigns_register[a:item.ikey]), a:item)
            if !has_key(item, 'id')
                echohl WarningMsg
                echom "Quickfixsigns: Internal error: No ID:" string(item)
            endif
        endif
        return item
    endif
endf


function! s:GetIKey(item) "{{{3
    let subitems = map(['lnum', 'bufnr', 'sign', 'class', 'text'], 'get(a:item, v:val, "")')
    return join(subitems, '*')
endf


function! s:GetQFList(bufname) "{{{3
    return QuickfixsignsUnique(getqflist())
endf


function! s:GetLocList(bufname) "{{{3
    let loclist = getloclist(bufwinnr(a:bufname))
    " TLogVAR a:bufname, bufnr(a:bufname), loclist
    return QuickfixsignsUnique(loclist)
endf


runtime! autoload/quickfixsigns/*.vim
call QuickfixsignsSelect(g:quickfixsigns_classes)
unlet! s:signss


augroup QuickFixSigns
    autocmd!
    let s:ev_set = []
    for [s:class, s:def] in s:ListValues()
        for s:ev in get(s:def, 'event', ['BufEnter'])
            if index(s:ev_set, s:ev) == -1
                exec 'autocmd '. s:ev .' * call QuickfixsignsSet("'. s:ev .'", [], expand("<afile>:p"))'
                call add(s:ev_set, s:ev)
            endif
        endfor
    endfor
    unlet s:ev_set
    if exists('s:class')
        unlet s:ev s:class s:def
    endif
    let s:will_purge_register = 1
    autocmd VimLeavePre * let s:will_purge_register = 0
    autocmd BufUnload * call s:RemoveBuffer(expand("<abuf>"))
    autocmd BufLeave * if s:will_purge_register | call s:PurgeRegister() | endif
    " autocmd BufRead,BufNewFile * exec 'sign place '. (s:quickfixsigns_base - 1) .' name=QFS_DUMMY line=1 buffer='. bufnr('%')
    autocmd User WokmarksChange if index(g:quickfixsigns_classes, 'marks') != -1 | call QuickfixsignsUpdate("marks") | endif
augroup END


let &cpo = s:save_cpo
unlet s:save_cpo
autoload/quickfixsigns.vim	[[[1
165
" quickfixsigns.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2010-03-19.
" @Last Change: 2012-10-02.
" @Revision:    0.0.141


if !exists('g:quickfixsigns#use_relativenumber')
    " VIM 7.3 and later: If non-zero, |quickfixsigns#RelNumbersOnce()| 
    " uses 'relativenumber' instead of signs. This avoids clashes with 
    " other signs and is faster, but it could cause the visible text area 
    " to be temporarily moved to the right.
    let g:quickfixsigns#use_relativenumber = v:version >= 703   "{{{2
endif


function! quickfixsigns#CompleteSelect(ArgLead, CmdLine, CursorPos) "{{{3
    " TLogVAR a:ArgLead, a:CmdLine, a:CursorPos
    let start = len('quickfixsigns_class_')
    let vars = filter(keys(g:), 'v:val =~ ''^quickfixsigns_class_''. a:ArgLead')
    call map(vars, 'strpart(v:val, start)')
    let selected = split(a:CmdLine, '\s\+')
    call filter(vars, 'index(selected, v:val) == -1')
    if a:CmdLine =~ '\<QuickfixsignsSelect\s\+$'
        call insert(vars, join(g:quickfixsigns_classes))
    endif
    return vars
endf


" Display relative line numbers. Remove the signs when the cursor moves.
" From vim 7.3 on, this uses the 'relativenumber' option.
function! quickfixsigns#RelNumbersOnce() "{{{3
    if !has_key(g:quickfixsigns_lists, 'rel2')
        if g:quickfixsigns#use_relativenumber
            if !&relativenumber
                augroup QuickFixSignsRelNumbersOnce
                    autocmd!
                    autocmd CursorMoved,CursorMovedI,TabLeave,WinLeave * setlocal norelativenumber
                    if ! &cul
                        autocmd CursorMoved,CursorMovedI,TabLeave,WinLeave * setlocal nocul
                    endif
                    if ! &cuc
                        autocmd CursorMoved,CursorMovedI,TabLeave,WinLeave * setlocal nocuc
                    endif
                    autocmd CursorMoved,CursorMovedI,TabLeave,WinLeave * autocmd! QuickFixSignsRelNumbersOnce
                augroup END
                setlocal relativenumber cul cuc
            endif
        else
            let s:list = keys(g:quickfixsigns_lists)
            call QuickfixsignsSelect(s:list + ['rel2'])
            call QuickfixsignsUpdate("rel2")
            augroup QuickFixSignsRelNumbersOnce
                autocmd!
                autocmd CursorMoved,CursorMovedI,TabLeave,WinLeave * call QuickfixsignsSelect(s:list) | call QuickfixsignsClear('rel2') | autocmd! QuickFixSignsRelNumbersOnce
            augroup END
        endif
    endif
endf


function! quickfixsigns#AssertUniqueSigns(bufnr, bufsigns) "{{{3
    let dict = {}
    echohl WarningMsg
    try
        for bsign in a:bufsigns
            let key = printf("%s|%s", bsign.lnum, bsign.name)
            if has_key(dict, key)
                echom ("QuickFixSigns AssertUniqueSigns: duplicate bufnr=". a:bufnr .":") bsign.sign
            else
                let dict[key] = 1
            endif
        endfor
    finally
        echohl NONE
    endtry
endf


function! quickfixsigns#AssertNoObsoleteBuffers(register) "{{{3
    let buffers = {}
    for val in values(a:register)
        if !bufloaded(val.bufnr)
            let buffers[val.bufnr] = 1
        endif
    endfor
    if !empty(buffers)
        echom "QuickFixSigns: Marks for obsolete buffers:" join(sort(keys(buffers)), ', ')
    endif
endf


" :display: quickfixsigns#MoveSigns(n, ?pattern="", ?blockwise=0) "{{{3
function! quickfixsigns#MoveSigns(n, ...) "{{{3
    let pattern = a:0 >= 1 ? a:1 : ''
    let blockwise = a:0 >= 2 ? a:2 : 0
    let reverse = a:n < 0
    let unique_lnums = {}
    let lnum = line('.')
    " TLogVAR a:n, lnum
    for bsign in QuickfixsignsListBufferSigns(bufnr('%'))
        " TLogVAR bsign
        if (reverse && bsign.lnum < lnum) || (!reverse && bsign.lnum > lnum)
            if empty(pattern) || bsign.name =~ pattern
                let unique_lnums[bsign.lnum] = 1
            endif
        endif
    endfor
    let lnums = keys(unique_lnums)
    if empty(lnums)
        let rv = lnum
    else
        let lnums = sort(map(lnums, 'str2nr(v:val)'), 's:NumericSort')
        if blockwise
            " TLogVAR blockwise, len(lnums), lnums
            let lnums1 = []
            let last_lnum1 = -1
            for lnum1 in (reverse ? lnums : reverse(lnums))
                let lnum2 = reverse ? last_lnum1 + 1 : last_lnum1 - 1
                if lnum1 != lnum2
                    call add(lnums1, lnum1)
                endif
                let last_lnum1 = lnum1
            endfor
            let lnums = reverse ? lnums1 : reverse(lnums1)
            " TLogVAR len(lnums), lnums
        endif
        if reverse
            if -a:n > len(lnums)
                let rv = lnums[0]
            else
                let rv = lnums[a:n]
            endif
        else
            if a:n >= len(lnums)
                let rv = lnums[-1]
            else
                let rv = lnums[a:n - 1]
            endif
        endif
    endif
    " TLogVAR rv
    exec rv
endf


function! s:NumericSort(i1, i2)
    let i1 = str2nr(a:i1)
    let i2 = str2nr(a:i2)
    return i1 == i2 ? 0 : i1 > i2 ? 1 : -1
endf


" :nodoc:
function! quickfixsigns#CompleteSigns(ArgLead, CmdLine, CursorPos) "{{{3
    let unique_names = {}
    for bsign in QuickfixsignsListBufferSigns(bufnr('%'))
        let unique_names[bsign.name] = 1
    endfor
    return join(sort(keys(unique_names)), "\n")
endf

autoload/quickfixsigns/marks.vim	[[[1
106
" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @GIT:         http://github.com/tomtom/quickfixsigns_vim/
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2010-05-08.
" @Last Change: 2011-12-25.
" @Revision:    43

if index(g:quickfixsigns_classes, 'marks') == -1
    finish
endif


if !exists('g:quickfixsigns_class_marks')
    " The definition of signs for marks.
    " :read: let g:quickfixsigns_class_marks = {...} "{{{2
    let g:quickfixsigns_class_marks = {
                \ 'sign': '*quickfixsigns#marks#GetSign',
                \ 'get': 'quickfixsigns#marks#GetList(%s)',
                \ 'event': g:quickfixsigns_events,
                \ 'level': 4,
                \ 'timeout': 2
                \ }
endif
if !&lazyredraw && !empty(g:quickfixsigns_class_marks)
    let s:cmn = index(g:quickfixsigns_class_marks.event, 'CursorMoved')
    let s:cmi = index(g:quickfixsigns_class_marks.event, 'CursorMovedI')
    if s:cmn >= 0 || s:cmi >= 0
        echohl Error
        echom "quickfixsigns: Support for CursorMoved(I) events requires 'lazyredraw' to be set"
        echohl NONE
        if s:cmn >= 0
            call remove(g:quickfixsigns_class_marks.event, s:cmn)
        endif
        if s:cmi >= 0
            call remove(g:quickfixsigns_class_marks.event, s:cmi)
        endif
    endif
    unlet s:cmn s:cmi
endif


if !exists('g:quickfixsigns#marks#buffer')
    " A list of buffer-local marks that should be displayed as signs. If 
    " empty, disable the display of marks.
    let g:quickfixsigns#marks#buffer = split('abcdefghijklmnopqrstuvwxyz''.', '\zs') "{{{2
endif


if !exists('g:quickfixsigns#marks#global')
    " A list of global marks that should be displayed as signs. If 
    " empty, disable the display of marks.
    let g:quickfixsigns#marks#global = split('ABCDEFGHIJKLMNOPQRSTUVWXYZ<>^', '\zs') "{{{2
endif


if !exists('g:quickfixsigns#marks#texthl')
    " Highlight group for mark signs.
    let g:quickfixsigns#marks#texthl = 'Identifier'   "{{{2
endif


for s:i in (g:quickfixsigns#marks#buffer + g:quickfixsigns#marks#global)
	if index(g:quickfixsigns_signs, 'QFS_Mark_'. s:i) == -1
		exec 'sign define QFS_Mark_'. s:i .' text='. s:i .' texthl='. g:quickfixsigns#marks#texthl
	endif
endfor
unlet s:i

function! quickfixsigns#marks#GetList(filename) "{{{3
    let acc = []
    let bufnr  = bufnr(a:filename)
    let ignore = exists('b:quickfixsigns_ignore_marks') ? b:quickfixsigns_ignore_marks : []
    " TLogVAR a:filename, bufnr, ignore
    for mark in g:quickfixsigns#marks#buffer
        let acc = s:CheckMark(acc, bufnr, ignore, mark, "buffer")
    endfor
    for mark in g:quickfixsigns#marks#global
        let acc = s:CheckMark(acc, bufnr, ignore, mark, "vim")
    endfor
    return acc
endf


function! s:CheckMark(acc, bufnr, ignore, mark, scope) "{{{3
    let pos = getpos("'". a:mark)
    if pos[1] != 0 && index(a:ignore, a:mark) == -1 && (pos[0] == (a:scope == 'vim' ? a:bufnr : 0))
        let item = {
                    \ 'bufnr': pos[0] == 0 ? a:bufnr : pos[0],
                    \ 'lnum': pos[1],
                    \ 'col': pos[2],
                    \ 'text': 'Mark_'. a:mark,
                    \ 'scope': a:scope
                    \ }
        " TLogVAR a:mark, item.scope
        call add(a:acc, item)
    endif
    return a:acc
endf


function! quickfixsigns#marks#GetSign(item) "{{{3
    return 'QFS_'. a:item.text
endf


autoload/quickfixsigns/vcsdiff.vim	[[[1
263
" @Author:      Tom Link (micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @vcs:         http://vcshub.com/tomtom/quickfixsigns_vim/
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2010-05-08.
" @Last Change: 2012-10-02.
" @Revision:    401

if exists('g:quickfixsigns#vcsdiff#loaded')
    finish
endif
let g:quickfixsigns#vcsdiff#loaded = 1


if index(g:quickfixsigns_classes, 'vcsdiff') == -1
    finish
endif


if !exists('g:quickfixsigns#vcsdiff#vcs')
    " Show signs for new (+), changed (=), or deleted (-) lines.
    "
    " The signs for deleted lines are shown on the line before the 
    " deleted one. I.e. if line 20 was deleted, the "-" sign will be put 
    " on line 19.
    "
    " A dictionary of supported VCS names. Its values are dictionaries 
    " with the following keys:
    "     cmd ... command templates that generate a unified diff file. 
    "     "%s" is replaced with the filename.
    "     dir ... the directory name
    " Currently supported vcs: git, hg, svn, bzr
    " :read: let g:quickfixsigns#vcsdiff#vcs = {...}  "{{{2
    let g:quickfixsigns#vcsdiff#vcs = {
                \ 'git': {'cmd': 'git diff --no-ext-diff -U0 %s', 'dir': '.git'}
                \ , 'hg': {'cmd': 'hg diff -U0 %s', 'dir': '.hg'}
                \ , 'svn': {'cmd': 'svn diff --diff-cmd diff --extensions -U0 %s', 'dir': '.svn'}
                \ , 'bzr': {'cmd': 'bzr diff --diff-options=-U0 %s', 'dir': '.bzr'}
                \ }
endif


if !exists('g:quickfixsigns_class_vcsdiff')
    let g:quickfixsigns_class_vcsdiff = {'sign': '*quickfixsigns#vcsdiff#Signs', 'get': 'quickfixsigns#vcsdiff#GetList(%s)', 'event': ['BufEnter', 'BufWritePost'], 'level': 6}   "{{{2
endif


if !exists('g:quickfixsigns#vcsdiff#cd')
    let g:quickfixsigns#vcsdiff#cd = 'cd'   "{{{2
endif


if !exists('g:quickfixsigns#vcsdiff#cmd_separator')
    " Command to join two shell commands.
    let g:quickfixsigns#vcsdiff#cmd_separator = '&&'  "{{{2
endif


if !exists('g:quickfixsigns#vcsdiff#guess_type')
    " If true, guess the vcs type by searching for the repo directory on 
    " the hard disk (i.e., this will result in disk accesses for new 
    " buffers).
    " Can also be buffer-local.
    let g:quickfixsigns#vcsdiff#guess_type = 1   "{{{2
endif


if !exists('g:quickfixsigns#vcsdiff#highlight')
    " The highlighting of deleted lines can sometimes be confusing. In 
    " order to disable the display of signs for DEL changes, save the 
    " following line as after/autoload/quickfixsigns/vcsdiff.vim: >
    "
    "   call remove(g:quickfixsigns#vcsdiff#highlight, 'DEL')
    let g:quickfixsigns#vcsdiff#highlight = {'DEL': 'DiffDelete', 'ADD': 'DiffAdd', 'CHANGE': 'DiffChange'}   "{{{2
endif


if index(g:quickfixsigns_signs, 'QFS_VCS_ADD') == -1
    exec 'sign define QFS_VCS_ADD text=+ texthl='. g:quickfixsigns#vcsdiff#highlight.ADD
endif
if index(g:quickfixsigns_signs, 'QFS_VCS_DEL') == -1
    exec 'sign define QFS_VCS_DEL text=- texthl='. g:quickfixsigns#vcsdiff#highlight.DEL
endif
if index(g:quickfixsigns_signs, 'QFS_VCS_CHANGE') == -1
    exec 'sign define QFS_VCS_CHANGE text== texthl='. g:quickfixsigns#vcsdiff#highlight.CHANGE
endif


" :nodoc:
function! quickfixsigns#vcsdiff#Signs(item) "{{{3
    return 'QFS_VCS_'. a:item.change
endf


" Return the name of a VCS system based on the values of the following 
" variables:
"
"   - b:git_dir
"   - b:vcs_type
"   - b:VCSCommandVCSType
"
" If none of these variables is defined, try to guess the vcs type.
function! quickfixsigns#vcsdiff#GuessType() "{{{3
    if exists('b:vcs_type')
        let type = b:vcs_type
    else
        if exists('b:VCSCommandVCSType')
            " vcscommand
            let type = tolower(b:VCSCommandVCSType)
        elseif exists('b:git_dir')
            " fugitive
            let type = 'git'
        else
            let type = ''
        endif
        " TLogVAR type
        if (exists('b:quickfixsigns#vcsdiff#guess_type') ? b:quickfixsigns#vcsdiff#guess_type : g:quickfixsigns#vcsdiff#guess_type) && empty(type)
            let path = escape(expand('%:p:h'), ',') .';'
            let depth = -1
            for vcs in keys(g:quickfixsigns#vcsdiff#vcs)
                let dir = g:quickfixsigns#vcsdiff#vcs[vcs].dir
                " TLogVAR dir
                let vcsdir = finddir(dir, path)
                if !empty(vcsdir)
                    let vcsdir_depth = len(split(fnamemodify(vcsdir, ':p'), '\/'))
                    if vcsdir_depth > depth
                        let depth = vcsdir_depth
                        let type = vcs
                        " TLogVAR type, depth
                    endif
                endif
            endfor
        endif
        let b:vcs_type = type
    endif
    " TLogVAR type
    if has_key(g:quickfixsigns#vcsdiff#vcs, type)
        return type
    else
        return ''
    endif
endf


" quickfixsigns#vcsdiff#GuessType() must return the name of a supported 
" VCS (see |g:quickfixsigns#vcsdiff#vcs|).
function! quickfixsigns#vcsdiff#GetList(filename) "{{{3
    if &buftype =~ '\<\(nofile\|quickfix\|help\)\>' || &previewwindow || exists('b:fugitive_type')
        return []
    endif
    let vcs_type = quickfixsigns#vcsdiff#GuessType()
    " TLogVAR a:filename, vcs_type
    " Ignore files that are not readable
    if has_key(g:quickfixsigns#vcsdiff#vcs, vcs_type) && filereadable(a:filename)
        let cmdt = g:quickfixsigns#vcsdiff#vcs[vcs_type].cmd
        let dir  = fnamemodify(a:filename, ':h')
        let file = fnamemodify(a:filename, ':t')
        let cmds = join([
                    \ printf("%s %s", g:quickfixsigns#vcsdiff#cd, shellescape(dir)),
                    \ printf(cmdt, shellescape(file))
                    \ ], g:quickfixsigns#vcsdiff#cmd_separator)
        " TLogVAR cmds
        let diff = system(cmds)
        " TLogVAR diff
        if !empty(diff)
            let bufnr = bufnr('%')
            if g:quickfixsigns_debug && bufnr != bufnr(a:filename)
                echom "QuickFixSigns DEBUG: bufnr mismatch:" a:filename bufnr bufnr(a:filename)
            endif
            let lastlnum = line('$')
            let lines = split(diff, '\n')
            let change_defs = {}
            let from = -1
            let to = -1
            let last_change_lnum = 0
            let last_del = 0
            for line in lines
                " TLogVAR from, line
                if line =~ '^@@\s'
                    let m = matchlist(line, '^@@ -\(\d\+\)\(,\d\+\)\? +\(\d\+\)\(,\d\+\)\? @@')
                    " TLogVAR line, m
                    let to = str2nr(m[3])
                    " TLogVAR "@@", to
                    " let change_lnum = m[1]
                    let from = to
                elseif line =~ '^@@@\s'
                    let m = matchlist(line, '^@@@ -\(\d\+\)\(,\d\+\)\? -\(\d\+\)\(,\d\+\)\? +\(\d\+\)\(,\d\+\)\? @@@')
                    " TLogVAR line, m
                    let to = str2nr(m[5])
                    " TLogVAR "@@@", to
                    " let change_lnum = m[1]
                    let from = to
                elseif from < 0
                    continue
                else
                    if line[0] == '-'
                        let change = 'DEL'
                        let text = line
                        let change_lnum = from
                        let from += 1
                    elseif line[0] == '+'
                        let change = 'ADD'
                        let text = line
                        let change_lnum = to
                        let to += 1
                    else
                        let from += 1
                        let to += 1
                        let change = ''
                        continue
                    endif
                    " TLogVAR change_lnum, change
                    if change_lnum < 1
                        let change_lnum = 1
                    elseif change_lnum > lastlnum
                        let change_lnum = lastlnum
                    endif
                    if !empty(change) && has_key(change_defs, change_lnum)
                        if change_defs[change_lnum].change == 'CHANGE' || change_defs[change_lnum].change != change
                            let change = 'CHANGE'
                        endif
                        let text = s:BalloonJoin(change_defs[change_lnum].text, line)
                    endif
                    if last_change_lnum > 0 && last_del > 0 && change_lnum == last_del + 1 && change == 'DEL' && change_defs[last_change_lnum].change == 'DEL'
                        let change_defs[last_change_lnum].text = s:BalloonJoin(change_defs[last_change_lnum].text, text)
                    else
                        let change_defs[change_lnum] = {'change': change, 'text': text}
                        let last_change_lnum = change_lnum
                    endif
                    if change == 'DEL' || change == 'CHANGE'
                        let last_del = change_lnum
                    endif
                endif
            endfor
            let signs = []
            for [lnum, change_def] in items(change_defs)
                if !has_key(g:quickfixsigns#vcsdiff#highlight, change_def.change)
                    continue
                endif
                " if change_def.change == 'DEL' && lnum < line('$') && !has_key(change_defs, lnum + 1)
                "     let lnum += 1
                " endif
                let text = s:BalloonJoin(change_def.change .":", change_def.text)
                " TLogVAR bufnr, lnum, change_def.change, text
                call add(signs, {"bufnr": bufnr, "lnum": lnum,
                            \ "change": change_def.change, "text": text})
            endfor
            " TLogVAR signs
            return signs
        endif
    endif
    return []
endf


function! s:BalloonJoin(...) "{{{3
    if has('balloon_multiline')
        return join(a:000, "\n")
    else
        return join(a:000, " ")
    endif
endf

autoload/quickfixsigns/breakpoints.vim	[[[1
81
" breakpoints.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2010-11-26.
" @Last Change: 2011-12-25.
" @Revision:    28


if exists('g:quickfixsigns#breakpoints#loaded')
    finish
endif
let g:quickfixsigns#breakpoints#loaded = 1


if index(g:quickfixsigns_classes, 'breakpoints') == -1
    finish
endif


if !exists('g:quickfixsigns#breakpoints#filetypes')
    " :read: let g:quickfixsigns#breakpoints#filetypes = {...}   "{{{2
    let g:quickfixsigns#breakpoints#filetypes = {
                \ 'vim': 'quickfixsigns#breakpoints#Vim'
                \ }
endif


if !exists('g:quickfixsigns_class_breakpoints')
    " :read: let g:quickfixsigns_class_breakpoints = {...}   "{{{2
    let g:quickfixsigns_class_breakpoints = {
                \ 'sign': 'QFS_BREAKPOINT',
                \ 'get': 'quickfixsigns#breakpoints#GetList(%s)',
                \ 'event': g:quickfixsigns_events,
                \ 'level': 8,
                \ 'test': 'has_key(g:quickfixsigns#breakpoints#filetypes, &ft)',
                \ 'timeout': 5
                \ }
                " \ 'event': ['BufEnter,BufWritePost']
endif


if g:quickfixsigns_class_breakpoints.sign == 'QFS_BREAKPOINT'
    if exists('g:quickfixsigns_icons.breakpoint')
        exec 'sign define QFS_BREAKPOINT text=# texthl=Special icon='. escape(g:quickfixsigns_icons.breakpoint, ' \')
    else
        sign define QFS_BREAKPOINT text=# texthl=Special
    endif
endif


function! quickfixsigns#breakpoints#GetList(filename) "{{{3
    " TLogVAR &filetype
    if has_key(g:quickfixsigns#breakpoints#filetypes, &filetype)
        return call(g:quickfixsigns#breakpoints#filetypes[&filetype], [])
    else
        return []
    endif
endf


function! quickfixsigns#breakpoints#Vim() "{{{3
    redir => bps
    silent breaklist
    redir END
    let acc = []
    for line in split(bps, '\n')
        let ml = matchlist(line, '^\s*\(\d\+\)\s\+\w\+\s\+\(.\{-}\)\s\+\w\+\s\+\(\d\+\)$')
        " TLogVAR line, ml
        if !empty(ml)
            let bufnr = bufnr(ml[2])
            let item = {
                        \ 'bufnr': bufnr,
                        \ 'lnum': ml[3],
                        \ 'text': 'Breakpoint_'. ml[1]
                        \ }
            call add(acc, item)
        endif
    endfor
    return acc
endf

autoload/tinykeymap/map/quickfixsigns.vim	[[[1
51
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Revision:    0.0.21

if !exists('g:tinykeymap#map#quickfixsigns#map')
    let g:tinykeymap#map#quickfixsigns#map = g:tinykeymap#mapleader .'s'   "{{{2
endif

if !exists('g:tinykeymap#map#quickfixsigns#options')
    " :read: let g:tinykeymap#map#quickfixsigns#options = {...}   "{{{2
    let g:tinykeymap#map#quickfixsigns#options = {
                \ 'name': 'Go to sign',
                \ 'start': 'let g:tinykeymap#map#quickfixsigns#pattern = ""',
                \ 'stop': 'unlet! g:tinykeymap#map#quickfixsigns#pattern',
                \ }
    if exists('g:loaded_tlib')
        let g:tinykeymap#map#quickfixsigns#options.after = 'call tlib#buffer#ViewLine(line("."))'
        let g:tinykeymap#map#quickfixsigns#options.start .= '|call tlib#buffer#ViewLine(line("."))'
    else
        let g:tinykeymap#map#quickfixsigns#options.after = 'norm! zz'
    endif
endif

call tinykeymap#EnterMap("quickfixsigns", g:tinykeymap#map#quickfixsigns#map, g:tinykeymap#map#quickfixsigns#options)
call tinykeymap#Map("quickfixsigns", "j", "call quickfixsigns#MoveSigns(<count1>, g:tinykeymap#map#quickfixsigns#pattern)",
            \ {'desc': 'Move to the next sign'})
call tinykeymap#Map("quickfixsigns", "k",
            \ "call quickfixsigns#MoveSigns(-<count1>, g:tinykeymap#map#quickfixsigns#pattern)",
            \ {'desc': 'Move to the previous sign'})
call tinykeymap#Map("quickfixsigns", "l",
            \ "call quickfixsigns#MoveSigns(<count1>, g:tinykeymap#map#quickfixsigns#pattern, 1)",
            \ {'desc': 'Move to the next group of signs'})
call tinykeymap#Map("quickfixsigns", "h",
            \ "call quickfixsigns#MoveSigns(-<count1>, g:tinykeymap#map#quickfixsigns#pattern, 1)",
            \ {'desc': 'Move to the previous group of signs'})
call tinykeymap#Map("quickfixsigns", "<Down>",
            \ "call quickfixsigns#MoveSigns(<count1>, g:tinykeymap#map#quickfixsigns#pattern)",
            \ {'desc': 'Move to the next sign'})
call tinykeymap#Map("quickfixsigns", "<Up>",
            \ "call quickfixsigns#MoveSigns(-<count1>, g:tinykeymap#map#quickfixsigns#pattern)",
            \ {'desc': 'Move to the previous sign'})
call tinykeymap#Map("quickfixsigns", "<Right>",
            \ "call quickfixsigns#MoveSigns(<count1>, g:tinykeymap#map#quickfixsigns#pattern, 1)",
            \ {'desc': 'Move to the next group of signs'})
call tinykeymap#Map("quickfixsigns", "<Left>",
            \ "call quickfixsigns#MoveSigns(-<count1>, g:tinykeymap#map#quickfixsigns#pattern, 1)",
            \ {'desc': 'Move to the previous group of signs'})
call tinykeymap#Map("quickfixsigns", "<Space>",
            \ "let g:tinykeymap#map#quickfixsigns#pattern = input('Sign Regexp: ', g:tinykeymap#map#quickfixsigns#pattern, 'custom,quickfixsigns#CompleteSigns')",
            \ {'desc': 'Edit the sign regexp filter'})

