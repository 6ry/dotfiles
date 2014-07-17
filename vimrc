" Note about control characters
" In order to add a control character to your .vimrc you must type Ctrl-v
" first. For example,  is done by Ctrl-v Ctrl-t.


" self help
" :help <topic>
" e.g.
" :help linebreak



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1024

" Enable filetype plugin
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread




" Vim Plugins
" ===========
" * colorscheme
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
" * pathogen
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()
"
" * Gundo
" http://sjl.bitbucket.org/gundo.vim/
" https://github.com/vim-scripts/Gundo
" http://www.bestofvim.com/plugin/gundo/
" related   :help undo-tree
"           :help undo-branches
nnoremap <F9> :GundoToggle<CR>
"
" * Airline
" https://github.com/bling/vim-airline
" :help airline
let g:airline_theme='laederon'
"let g:airline_theme='lucius'
"
" ctrlp.vim
" https://kien.github.io/ctrlp.vim/
" https://github.com/kien/ctrlp.vim.git
" :help ctrlp-commands
" :help ctrlp-extensions
" # Basic Usage #
" Press <F5> to purge the cache for the current directory to get new files, remove deleted files and apply new ignore options.
" Press <c-f> and <c-b> to cycle between modes.
" Press <c-d> to switch to filename only search instead of full path.
" Press <c-r> to switch to regexp mode.
" Use <c-j>, <c-k> or the arrow keys to navigate the result list.
" Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
" Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
" Use <c-y> to create a new file and its parent directories.
" Use <c-z> to mark/unmark multiple files and <c-o> to open them.
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"
" * vim-markdown
" https://github.com/plasticboy/vim-markdown
let g:vim_markdown_folding_disabled=1
"
" * taglist
" https://github.com/vim-scripts/taglist.vim
"
" * Align
" https://github.com/vim-scripts/Align
"
" * nerdtree
" https://github.com/scrooloose/nerdtree
" http://www.bestofvim.com/plugin/nerdtree/
"
" * netrw
" https://github.com/vim-scripts/netrw.vim
"
" * ack
" https://github.com/vim-scripts/ack.vim
"
" * vim-flake8 (Python)
" https://github.com/nvie/vim-flake8
"
" * jedi-vim (Python)
" https://github.com/davidhalter/jedi-vim




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python set omnifunc=pythoncomplete#Complete
"set runtimepath=~/.vim,/vimfiles,


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Auto commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatically remove all trailing whitespace upon :write (:w)
" http://vim.wikia.com/wiki/Remove_unwanted_spaces#Automatically_removing_all_trailing_whitespace
autocmd BufWritePre * :%s/\s\+$//e


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistent Undo
" :help persistent-undo
" :help undo-persistence
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos (default 1000 for Unix)
set undoreload=10000        " number of lines to save for undo (default 10000)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell check and highlight
" http://vimdoc.sourceforge.net/htmldoc/spell.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use aspell as spellchecker
" keymap to Ctrl-T
"map  :w!<CR>:!aspell check %<CR>:e! %<CR>

"set spell spelllang=en
nnoremap F11> :setlocal spell! spelllang=en<CR>
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




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

set ruler "Always show current position

set cmdheight=2 "The commandbar height

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set wildmenu

" soft wrap
set wrap linebreak nolist   " list disables linebreak
"set wrap linebreak textwidth=0

" dont want no Ex mode
nmap Q <Nop>






"set nonu

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types

" Use Vim settings, rather then Vi settings (much better!).
set nocompatible

" line numbers
set number


" code folding
set foldmethod=indent   " fold based on indentation
"set foldnestmax=10      " deepest fold is 10 levels
set nofoldenable        " dont fold by default
set foldlevel=99

" Turn on the verboseness to see everything vim is doing.
" set verbose=9

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" modeline magic
" http://vim.wikia.com/wiki/Modeline_magic
"
" :help auto-setting
" :help modeline
" :help modelines
"
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
nnoremap <F12> :call AppendModeline()<CR>


" tabs and indentation mess
" http://tedlogan.com/techblog3.htmlA
"
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

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab



" Always  set auto indenting on
"set autoindent

" command to unset autoindent
":setlocal noautoindent nocindent nosmartindent indentexpr=
":setl noai nocin nosi inde=

" select when using the mouse
set selectmode=mouse

" set the commandheight
set cmdheight=2

" do not keep a backup files
set nobackup
set nowritebackup

" show the cursor position all the time
set ruler

" show (partial) commands
set showcmd

" do incremental searches (annoying but handy);
set incsearch

" Show  tab characters. Visual Whitespace.
"set list
"set listchars=tab:>.

" Set ignorecase on
set ignorecase

" smart search (override 'ic' when pattern has uppers)
set scs

" Set 'g' substitute flag on
" set gdefault

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line (DEPRECATED by vim-airline)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Set status line
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


" Always display a status line at the bottom of the window
set laststatus=2

" Set vim to use 'short messages'.
set shortmess=a

" showmatch: Show the matching bracket for the last ')'?
set showmatch

" window min height
set wmh=0




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key bindings (re)map
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
nnoremap [15^ :split<CR>
nnoremap [17^ -
nnoremap [18^ +
nnoremap <F8> =

" :help window-move-cursor
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
" :help window-moving
" TODO shortcut keys for moving windows around?

" <F9> mapped to Gundo
" <F11> mapped to spellcheck
" <F12> mapped to AppendModeline()


"map <leader>a <Esc>:Ack!





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tips reminder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimtips
" http://www-tips.org/tips


" http://vimregex.com/


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
" :tab sball    | put all open buffers in tabs

" key mappings
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_1%29
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_2%29
" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_%28Part_3%29
"
" :map  | show all key mappings
" :nmap | only show normal mode maps
" :imap | only show insert mode maps
" :vmap | only show visual and select mode maps
" :smap | only show select mode maps
" :xmap | only show visual mode maps
" :cmap | only show command-line mode maps
" :omap | only show operator pending mode maps


" gq magic
" http://vimdoc.sourceforge.net/htmldoc/change.html#gq
" gqap or {Visual}gq
" gwap or {Visual}gw


" Text objects
" :help text-objects
" http://blog.carbonfive.com/2011/10/17/vim-text-objects-the-definitive-guide/
" ciw
" caw
" diw
" daw
" caW


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
" set opt!        - invert
" set invopt      - invert
" set opt&        - reset to default
" set all&        - set all to def
" :se[t]          Show all options that differ from their default value.
" :se[t] all      Show all but terminal options.
" :se[t] termcap      Show all terminal options.  Note that in the GUI the



" TAB HELP   {{{3
" ---------------------------------
" tc  - create a new tab
" td  - close a tab
" tn  - next tab
" tp  - previous tab



" UPPERCASE, LOWERCASE, INDENTS {{{3
" ---------------------------------
" '.  - last modification in file!
" gf  - open file under cursor
" guu - lowercase line
" gUU - uppercase line
" =   - reindent text



" FOLDS {{{3
" ---------------------------------
" F   - create a fold from matching parenthesis
" fm  - (zm)  more folds
" fl  - (zr) less/reduce folds
" fo  - open all folds (zR)
" fc  - close all folds (zM)
" ff  -  (zf) - create a fold
" fd  - (zd)  - delete fold at cursor
" zF  - create a fold N lines
" zi  - invert foldenable



" KEYSEQS HELP {{{3
" ---------------------------------
" CTRL-I - forward trace of changes
" CTRL-O - backward trace of changes!
" C-W W    - Switch to other split window
" CTRL-U        - DELETE FROM CURSOR TO START OF LINE
" CTRL-^        - SWITCH BETWEEN FILES
" CTRL-W-TAB  - CREATE DUPLICATE WINDOW
" CTRL-N        - Find keyword for word in front of cursor
" CTRL-P        - Find PREV ditto


" SEARCH / REPLACE {{{3
" ---------------------------------
" :%s/^\s\+//    - delete leading whitespaces
" :%s/\s\+$//    - delete trailing whitespaces
" :%s/a\|b/xxx\0xxx/g             modifies a b      to xxxaxxxbxxx
" :%s/\([abc]\)\([efg]\)/\2\1/g   modifies af fa bg to fa fa gb
" :%s/abcde/abc^Mde/              modifies abcde    to abc, de (two lines)
" :%s/$/\^M/                      modifies abcde    to abcde^M
" :%s/\w\+/\u\0/g                 modifies bla bla  to Bla Bla
" :g!/\S/d                delete empty lines in file


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
