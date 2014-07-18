" Note about control characters
" In order to add a control character to your .vimrc you must type Ctrl-v
" first. For example,  is done by Ctrl-v Ctrl-t.


" self help
" :help <topic>
" e.g.
" :help linebreak




" =============================================================
" General
" =============================================================

" enable filetype plugin
" ----------------------
filetype plugin on
filetype indent on

let mapleader=','

set ffs=unix,dos,mac           " Default file types
set history=1024               " how many lines of history to remember
set nocompatible               " use Vim settings, rather then Vi settings (much better!).
set autoread                   " Set to auto read when a file is changed from the outside
set showmatch                  " when a bracket is inserted, briefly jump to the matching one
set hidden                     " :help hidden, related to buffers
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set selectmode=mouse           " select when using the mouse
set laststatus=2               " Always display a status line at the bottom of the window
set shortmess=a                " alwasy show 'short messages'
set so=7                       " set 7 lines to the curors - when moving vertical
" TODO: figure out the long name of 'so'

" dont want no Ex mode
nmap Q <Nop>

" default encoding and language
" -----------------------------
set encoding=utf8
try
    lang en_US
catch
endtry

" layout
" ------
set number              " show line numbers
set ruler               " always show current position
set wildmenu
set cmdheight=2         " commandbar height

" code folding
" ------------
set foldmethod=indent   " fold based on indentation
"set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=99

" backup files
" ------------
set nobackup            " do not keep a backup files
set nowritebackup

" search
" ------
set hlsearch            " highlight search
set ignorecase          " ignore case when searching
set smartcase           " :help smartcase
set incsearch           " do incremental searches (annoying but handy)

" soft wrap
" ---------
set wrap linebreak nolist   " list disables linebreak
"set wrap linebreak textwidth=0

"set autoindent " always  set auto indenting on
"set verbose=9 " turn on the verboseness to see everything vim is doing.
"set gdefault     " g flag always on

" command to unset autoindent
":setlocal noautoindent nocindent nosmartindent indentexpr=
":setl noai nocin nosi inde=

" Show tab characters. Visual Whitespace.
" ---------------------------------------
"set list
"set listchars=tab:>.




" =============================================================
" Vim Plugins
" =============================================================
"
" colorscheme
" ------------
" https://code.google.com/p/vimcolorschemetest/
syntax on
set background=dark
"colorscheme xoria256
"colorscheme BusyBee
colorscheme molokai
"colorscheme crt
"colorscheme cthulhian
"colorscheme desert256
"
" pathogen
" --------
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
"
" Airline
" -------
" https://github.com/bling/vim-airline
" :help airline
" Automatically displays all buffers when there's only one tab open
"let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='laederon'
"let g:airline_theme='lucius'
"
" minibufexpl
" -----------
" http://fholgado.com/minibufexpl
" https://github.com/fholgado/minibufexpl.vim
noremap <leader>b  <Esc>:MBEToggle<CR>
"noremap <leader>bn <Esc>:MBEbn<CR>
"noremap <leader>bp <Esc>:MBEbp<CR>
noremap <leader>bf <Esc>:MBEbn<CR>
noremap <leader>bb <Esc>:MBEbp<CR>
noremap <leader>bd <Esc>:MBEbd<CR>
"
" ctrlp.vim
" ---------
" https://kien.github.io/ctrlp.vim/
" https://github.com/kien/ctrlp.vim.git
" :help ctrlp-commands
" :help ctrlp-extensions
"
" > In popup windown:
" <F5>                       | purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" <c-f> and <c-b>            | cycle between modes.
" <c-d>                      | switch to filename only search instead of full path.
" <c-r>                      | switch to regexp mode.
" <c-j>, <c-k> or arrow keys | navigate the result list.
" <c-t> or <c-v>, <c-x>      | open the selected entry in a new tab or in a new split.
" <c-n>, <c-p>               | select the next/previous string in the prompt's history.
" <c-y>                      | create a new file and its parent directories.
" <c-z>                      | mark/unmark multiple files and <c-o> to open them.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"
" Gundo
" -----
" http://sjl.bitbucket.org/gundo.vim/
" https://github.com/vim-scripts/Gundo
" http://www.bestofvim.com/plugin/gundo/
" related   :help undo-tree
"           :help undo-branches
nnoremap <leader>u <Esc>:GundoToggle<CR>
"
" taglist
" -------
" NOTE: install this plugin from arch repo (vim-taglist), this will
"       also  install Exuberant Ctags, which is required by vim-easytags
" https://github.com/vim-scripts/taglist.vim
nnoremap <leader>q <Esc>:TlistToggle<CR>
"
" vim-easytags
" ------------
" https://github.com/xolox/vim-easytags
"
" > :UpdateTags
" > -----------
" > This command executes Exuberant Ctags from inside Vim to update the global
" > tags file defined by g:easytags_file. When no arguments are given the tags
" > for the current file are updated, otherwise the arguments are passed on to
" > ctags. For example when you execute the Vim command :UpdateTags -R ~/.vim
" > (or :UpdateTags -R ~\vimfiles on Windows) the plug-in will execute ctags -R
" > ~/.vim for you (with some additional arguments, see the troubleshooting
" > section “:HighlightTags only works for the tags file created by
" > :UpdateTags” for more information).
"
" > When you execute this command like :UpdateTags! (including the bang!) then
" > all tags whose files are missing will be filtered from the global tags
" > file.
"
" > Note that this command will be executed automatically every once in a
" > while, assuming you haven’t changed g:easytags_on_cursorhold.
"
" > :HighlightTags
" > --------------
" > When you execute this command while editing one of the supported file types
" > (see above) the relevant tags in the current file are highlighted. The tags
" > to highlight are gathered from all tags files known to Vim (through the
" > ‘tags’ option).
"
" > Note that this command will be executed automatically every once in a
" > while, assuming you haven’t changed g:easytags_on_cursorhold.
"
" nerdtree
" --------
" https://github.com/scrooloose/nerdtree
" http://www.bestofvim.com/plugin/nerdtree/
nnoremap <leader>B <Esc>:NERDTreeToggle<CR>
"
" Align
" -----
" https://github.com/vim-scripts/Align
noremap <leader>l <Esc>:Align<Space>
"
" ack.vim
" -------
" https://github.com/mileszs/ack.vim
" https://github.com/vim-scripts/ack.vim
" > In the quickfix window, you can use:
" o  | open (same as enter)
" O  | open and close quickfix window
" go | preview file (open but maintain focus on ack.vim results)
" t  | open in new tab
" T  | open in new tab silently
" h  | open in horizontal split
" H  | open in horizontal split silently
" v  | open in vertical split
" gv | open in vertical split silently
" q  | close the quickfix window
noremap <leader>a <Esc>:Ack!<Space>
"
" supertab
" https://github.com/ervandew/supertab
"
" syntastic
" ---------
" https://github.com/scrooloose/syntastic
"
" TaskList
" --------
" https://github.com/vim-scripts/TaskList.vim
" NOTE: TaskList mapped to <leader>t
"
" vim-markdown
" ------------
" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1
"
" jedi-vim (Python)
" -----------------
" https://github.com/davidhalter/jedi-vim




" =============================================================
" Potential Plugins
" =============================================================
"
" netrw
" -----
" https://github.com/vim-scripts/netrw.vim
"
" ShowMarks
" ---------
" https://github.com/vim-scripts/ShowMarks
" NOTE: too bad, i really want this one to work!
"
" snipMate
" --------
"
" Surround
" --------
"
" fugitive
" --------
"




" =============================================================
" Auto commands
" Automatically remove all trailing whitespace upon :write (:w)
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
" =============================================================
autocmd BufWritePre * :%s/\s\+$//e




" =============================================================
" Persistent Undo
" :help persistent-undo
" :help undo-persistence
" =============================================================
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos (default 1000 for Unix)
set undoreload=10000        " number of lines to save for undo (default 10000)




" =============================================================
" Spell check and highlight
" http://vimdoc.sourceforge.net/htmldoc/spell.html
" =============================================================
" use aspell as spellchecker
" keymap to Ctrl-T
"map  :w!<CR>:!aspell check %<CR>:e! %<CR>

"set spell spelllang=en
nnoremap <F12> :setlocal spell! spelllang=en<CR>
" zg to add word to word list
" zw to reverse
" zug to remove word from word list
" z= to get list of possibilities
set spellfile=~/.vim/spellfile.add

highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline




" =============================================================
" modeline magic
" http://vim.wikia.com/wiki/Modeline_magic
" :help auto-setting
" :help modeline
" :help modelines
" =============================================================
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d %set :",
          \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
call append(line("$"), l:modeline)
endfunction
" nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
nnoremap <leader><F12> :call AppendModeline()<CR>




" =============================================================
" tabs and indentation mess
" http://tedlogan.com/techblog3.htmlA
" =============================================================
" NOTE: turned these off, defer the job to supertab
" >> tabstop
" Set tabstop to tell vim how many columns a tab counts for.
"
" >> expandtab
" When expandtab is set, hitting Tab in insert mode will produce the
" appropriate number of spaces.
"
" >> shiftwidth
" Set shiftwidth to control how many columns text is indented with the
" reindent operations (<< and >>) and automatic C-style indentation.
"
" >> softtabstop
" Set softtabstop to control how many columns vim uses when you hit Tab in insert mode.
" If softtabstop is less than tabstop and expandtab is not set, vim will use a combination
" of tabs and spaces to make up the desired spacing. If softtabstop equals tabstop and
" expandtab is not set, vim will always use tabs. When expandtab is set, vim will always
" use the appropriate number of spaces.
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set expandtab




" =============================================================
" Status line (DEPRECATED by vim-airline)
" =============================================================
" NOTE: currently turned off, delegated to Airline
""set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
"let s  = ""
"let s .= "%<"                                 | " truncate at the start
"let s .= "%f%8* "                             | " file name
"let s .= "%r"                                 | " readonly flag
"let s .= '%{&bomb?"!":""} '                   | " byte-order mark flag
"let s .= "%*%="                               | " right-justify after here
"let s .= "%9*%m%* "                           | " modified flag
"let s .= "0x%02B "                            | " hex value of current byte
"let s .= "%l"                                 | " current line
"let s .= ":%c%V"                              | " column number, virtual column (if different)
"let s .= " %P"                                | " percentage
"let s .= "/%LL"                               | " number of lines
"set statusline=%!s




" =============================================================
" Key Mappings
"
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_1%29
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_2%29
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_3%29
"
" :map  | show all maps for the current buffer
" :map! | same as above, except showing output in a mini-window
" :nmap | only show normal mode maps
" :imap | only show insert mode maps
" :vmap | only show visual and select mode maps
" :smap | only show select mode maps
" :xmap | only show visual mode maps
" :cmap | only show command-line mode maps
" :omap | only show operator pending mode maps
"
" :verbose maps      | show all mapped keys
" :verbose map <key> | show all mapped keys begin with <key>
" example :verbose map ,
"
" Special characters:
" <BS>           backspace
" <Tab>          tab
" <CR>           enter
" <Enter>        enter
" <Return>       enter
" <Esc>          escape
" <Space>        space
" <Up>           up arrow
" <Down>         down arrow
" <Left>         left arrow
" <Right>        right arrow
" <F1> - <F12>   function keys 1 to 12
" #1, #2..#9,#0  function keys f1 to f9, f10
" <Insert>       insert
" <Del>          delete
" <Home>         home
" <End>          end
" <PageUp>       page-up
" <PageDown>     page-down
" <bar>          the '|' character, which otherwise needs to be escaped '\|'
" =============================================================
" map function keys F2, F3, F4 to tab operations
nnoremap <F2> :tabnew
nnoremap <F3> :tabprevious<CR>
nnoremap <F4> :tabnext<CR>

" window splits
" (ctrl) F5, F6, F7, F8 to split and resize windows
" also see
" :help opening-window
" :help window-resize
nnoremap <F5> :vsplit<CR>
nnoremap <F6> <
nnoremap <F7> >
"nnoremap [15^ :split<CR>
"nnoremap [17^ -
"nnoremap [18^ +
nnoremap <leader><F5> :split<CR>
" TODO: need to hit <leader> key everytime, no continuous motion =(
nnoremap <leader><F6> 5-
nnoremap <leader><F7> 5+
nnoremap <F8> =

" :help window-move-cursor
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
" :help window-moving
" TODO: shortcut keys for moving windows around?

" <ctrl>-p      | ctrlp
" <leader>u     | GundoToggle
" <leader>b     | minibufexpl
" <leader>B     | NERDTreeToggle
" <leader>a     | Ack!
" <leader>l     | Align
" <leader>t     | TaskList
" <F12>         | spellcheck
" <leader><F12> | AppendModeline()




" =============================================================
" Tips reminder
" =============================================================
" cheatsheet
" http://bullium.com/support/vim_print.html

" run from shell
" $ vimtutor

" vimtips
" http://www-tips.org/tips


" * reverse lines
" {Visual-Line}!tac
"
" * toggle case
" {Visual}~
"
" * sort lines
" :%sort   | sort
" :%sort!  | sort in reverse
" :%sort u | sort, and remove duplicates
" :%sort n | numeric sort
"
" * power of g
" http://vim.wikia.com/wiki/Power_of_g
" :g/^\s*$/d        | delete empty lines in file
" :g!/\S/d          | delete empty lines in file
" :v/\S/d           | delete empty lines in file
" :g/^/pu =\"\n\"   | double psace the file
" :g/^/pu _         | double space the file
" qaq:g/pattern/y A | copy all lines matching a pattern to register 'a'
"                   | explanation: qaq is a trick to clear register a (qa starts recording a
"                   | macro to register a, then q stops recording, leaving a empty). y A is an
"                   | Ex command (:help :y). It yanks the current line into register A (append
"                   | to register a).
" :g/pattern/d_     | FAST delete of all lines matching a pattern
"
" :2,8co15  | copy lines 2 through 8 after line 15
" :4,15t$   | copy lines 4 through 15 to end of document (t == co)
" :-t$      | copy previous line to end of document
" :m0       | move current line to line 0 (i.e. the top of the document)
" :.,+3m$-1 | current line through current+3 are moved to the lastLine-1 (i.e. next to last)


" http://vimregex.com/
"
" escaped characters
" ------------------
" .   any character except new line
" \s  whitespace character
" \S  non-whitespace character
" \d  digit
" \D  non-digit
" \x  hex digit
" \X  non-hex digit
" \o  octal digit
" \O  non-octal digit
" \h  head of word character (a,b,c...z,A,B,C...Z and _)
" \H  non-head of word character
" \p  printable character
" \P  like \p, but excluding digits
" \w  word character
" \W  non-word character
" \a  alphabetic character
" \A  non-alphabetic character
" \l  lowercase character
" \L  non-lowercase character

" \u  uppercase character
" \U  non-uppercase character


" :E[xplore]        opens the file explorer window
" :Ack              ack (like grep)
" :Align            align selected area with delimiter
" :nohl             no highlight
" :noh              ditto
" :set nonumber     unset line numbers
" Ctrl-I            trace changes forward
" Ctrl-O            trace changes backward


" :marks        | show marks
" :reg[gisters] | show registers
" :di[splay]    | ditto
" :buffers      | show buffers
" :bn           | next buffer
" :bp           | prev buffer
" :b #          | jump to buffer #
" :ls           | ditto
" :tab sball    | put all open buffers in tabs


" gq magic
" http://vimdoc.sourceforge.net/htmldoc/change.html#gq
" gqap or {Visual}gq
" gwap or {Visual}gw


" Text objects
" :help text-objects
" http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
"
" prefix | action
" ------ | ------
" d      | delete
" c      | change
" y      | yank
" v      | visual
"
" suffix         | meaning
" ------         | -------
" aw/iw          | Word by punctuation
" aW/iW          | Word by whitespace (:help WORD)
" as/is          | Sentence
" ap/ip          | Paragraph
" a'/i' or a"/i" | Quotes
" a)/i)          | Parentheses
" a]/i]          | Brackets
" a}/i}          | Braces
" a>/i>          | Angle Brackets
" at/it          | Tags (e.g. <html>inner</html>)
"
" Simple Examples
" ---------------
" dl  | delete character (alias: x)
" diw | delete inner word
" daw | delete a word
" diW | delete inner WORD
" daW | delete a WORD
" dgn | delete the next search pattern match
" dd  | delete one line
" dis | delete inner sentence
" das | delete a sentence
" dib | delete inner '(' ')' block
" dab | delete a '(' ')' block
" dip | delete inner paragraph
" dap | delete a paragraph
" diB | delete inner '{' '}' block
" daB | delete a '{' '}' block

" More Examples
" -------------
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
"
" Copy a word and paste it over other words:
" yiw     yank inner word (copy word under cursor, say "first").
" ...     Move the cursor to another word (say "second").
" viwp    select "second", then replace it with "first".
" ...     Move the cursor to another word (say "third").
" viw"0p  select "third", then replace it with "first".
"
" Copy a line and paste it over other lines:
" yy      yank current line (say "first line").
" ...     Move the cursor to another line (say "second line").
" Vp      select "second line", then replace it with "first line".
" ...     Move the cursor to another line (say "third line").
" V"0p    select "third line", then replace it with "first line".


" https://wiki.archlinux.org/index.php/Vimrc
"
" VIM TIPS / HELP / TRICKS   {{{1
" ---------------------------------

" BEST TRICKS {{{2

" TERMCAP HELP {{{3
" :help termcap

" :g/^\s*$/;//-1sort to sort each block of lines in a file.


" VIEW DIFF OF EDITS AGAINST BUFFER VS ORIGINAL FILE {{{3
" :w !colordiff -u % -


" INSERT CURRENT FILENAME {{{3
" :r! echo %

" DELETE TRAILING WHITESPACE {{{3
" :%s/\s\+$//

" Changing Case
" gUw                             : uppercase word
" guw                             : lowercase word
" guu                             : lowercase line
" gUU                             : uppercase line
" Vu                              : lowercase line
" VU                              : uppercase line
" g~~                             : flip case line
" vEU                             : Upper Case Word ???
" vE~                             : Flip Case Word
" ggguG                           : lowercase entire file
" " Titlise Visually Selected Text (map for .vimrc)
" vmap ,c :s/\<\(.\)\(\k*\)\>/\u\1\L\2/g<CR>
" " Title Case A Line Or Selection (better)
" vnoremap <F6> :s/\%V\<\(\w\)\(\w*\)\>/\u\1\L\2/ge<cr> [N]
" " titlise a line
" nmap ,t :s/.*/\L&/<bar>:s/\<./\u&/g<cr>  [N]
" " Uppercase first letter of sentences
" :%s/[.!?]\_s\+\a/\U&\E/g


" :r file " read text from file and insert below current line

" :so $VIMRUNTIME/syntax/hitest.vim     " view highlight options

"}}}2


" HELP HELP {{{3
" ---------------------------------
" :helpg pattern                    search grep!! ---  JUMP TO OTHER MATCHES WITH: >
" :help holy-grail
" :help all
" :help termcap
" :help user-toc.txt          Table of contents of the User Manual. >
" :help :subject              Ex-command "subject", for instance the following: >
" :help :help                 Help on getting help. >
" :help CTRL-B                Control key <C-B> in Normal mode. >
" :help 'subject'             Option 'subject'. >
" :help EventName             Autocommand event "EventName"
" :help pattern<Tab>          Find a help tag starting with "pattern". Repeat <Tab> for others. >
" :help pattern<Ctrl-D>       See all possible help tag matches "pattern" at once. >
" :cn                         next match >
" :cprev, :cN                 previous match >
" :cfirst, :clast             first or last match >
" :copen,  :cclose            open/close the quickfix window; press <Enter> to jump to the item under the cursor



" SET HELP {{{3
" ---------------------------------
" :verbose set opt? - show where opt was set
" set opt!       | invert
" set invopt     | invert
" set opt&       | reset to default
" set all&       | set all to def
" :se[t]         | Show all options that differ from their default value.
" :se[t] all     | Show all but terminal options.
" :se[t] termcap | Show all terminal options.  Note that in the GUI the



" TAB HELP   {{{3
" ---------------------------------
" tc | create a new tab
" td | close a tab
" tn | next tab
" tp | previous tab



" UPPERCASE, LOWERCASE, INDENTS {{{3
" ---------------------------------
" '.  | last modification in file!
" gf  | open file under cursor
" guu | lowercase line
" gUU | uppercase line
" =   | reindent text



" FOLDS {{{3
" ---------------------------------
" F  | create a fold from matching parenthesis
" fm | (zm)  more folds
" fl | (zr) less/reduce folds
" fo | open all folds (zR)
" fc | close all folds (zM)
" ff |  (zf) - create a fold
" fd | (zd)  - delete fold at cursor
" zF | create a fold N lines
" zi | invert foldenable



" KEYSEQS HELP {{{3
" ---------------------------------
" CTRL-I     | forward trace of changes
" CTRL-O     | backward trace of changes!
" C-W W      | Switch to other split window
" CTRL-U     | DELETE FROM CURSOR TO START OF LINE
" CTRL-^     | SWITCH BETWEEN FILES
" CTRL-W-TAB | CREATE DUPLICATE WINDOW
" CTRL-N     | Find keyword for word in front of cursor
" CTRL-P     | Find PREV ditto


" SEARCH / REPLACE {{{3
" ---------------------------------
" :%s/^\s\+//                   | delete leading whitespaces
" :%s/\s\+$//                   | delete trailing whitespaces
" :%s/a\|b/xxx\0xxx/g           | modifies a b      to xxxaxxxbxxx
" :%s/\([abc]\)\([efg]\)/\2\1/g | modifies af fa bg to fa fa gb
" :%s/abcde/abc^Mde/            | modifies abcde    to abc, de (two lines)
" :%s/$/\^M/                    | modifies abcde    to abcde^M
" :%s/\w\+/\u\0/g               | modifies bla bla  to Bla Bla


"  COMMANDS {{{3
" ---------------------------------
" :runtime! plugin/**/*.vim  - load plugins
" :so $VIMRUNTIME/syntax/hitest.vim     " view highlight options
" :so $VIMRUNTIME/syntax/colortest.vim

" :!!date - insert date
" :%!sort -u  - only show uniq (and sort)

" :r file " read text from file and insert below current line
" :v/./.,/./-1join  - join empty lines

" :e! return to unmodified file
" :tabm n  - move tab to pos n
" :jumps
" :history
" :reg   -  list registers

" delete empty lines
" global /^ *$/ delete
