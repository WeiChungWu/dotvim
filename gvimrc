" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1

" set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  " Set line number
  set nu

  " Set the window height to {width} by {height} characters.
  winsize 100 40
  if has("gui_running")
      if has("gui_gtk2")
          "set guifont=Courier\ New\ 16
          "set guifont=Monospace\ 14
          "if system("echo $SGE_O_HOST") =~ 'eod2ea'
          "    set guifont=DejaVu\ Sans\ Mono\ 11
          "elseif system("echo $SGE_O_HOST") =~ 'eodea'
          "    set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
          "else
              "set guifont=Bitstream\ Vera\ Sans\ Mono\ 14
              "set guifont=DejaVu\ Sans\ Mono\ 14
              set guifont=Inconsolata\ Medium\ 14
          "endif
      elseif has("gui_photon")
          set guifont=Courier\ New:s16
      elseif has("gui_kde")
          set guifont=Courier\ New/16/-1/5/50/0/0/0/1/0
      elseif has("x11")
          set guifont=-*-courier-medium-r-normal-*-8-180-*-*-m-*-*
      else
          set guifont=Courier_New:h16:cDEFAULT
      endif
  endif
  "set guifont=-adobe-courier-medium-r-normal--17-160-75-75-m-100-iso8859-1
  "set guifont=-monotype-courier\ new-regular-r---17-160-75-75-m-100-iso8859-1

  " Switch off Paren highlighting.
    NoMatchParen
  " let loaded_matchparen = 1
  " DoMatchParen


   " Vim color file
   " Maintainer:	Bohdan Vlasyuk <bohdan@vstu.edu.ua>
   " Last Change:	2006 Apr 30
   
   " darkblue -- for those who prefer dark background
   " [note: looks bit uglier with come terminal palettes,
   " but is fine on default linux console palette.]
   
   set bg=dark
   "hi clear
   "if exists("syntax_on")
   "	syntax reset
   "endif
   
   "colorscheme darkblue
   "colorscheme gruvbox
   colorscheme molokai

endif
