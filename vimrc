" For pathogen.vim: auto load all plugins in .vim/bundle
call pathogen#infect()

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=200		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
"set incsearch		" do incremental searching

set nowrap

" For indent
set shiftwidth=4
set expandtab
set smarttab

" Don't use Ex mode, use Q for formatting
" map Q gq
noremap Q @q

"map <F6> :syn off<CR>
"map <F7> :if exists("syntax_on") <Bar>
"	\   source ~chungwu/.vim/syntax/fusb3.vim<CR> <Bar>
"	\ else <Bar>
"	\   syntax off <Bar>
"	\ endif <CR>
map gy gT
map gb gT

if &t_Co > 2 || has("gui_running")
  " syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
	 	\ | wincmd p | diffthis

autocmd FileType make setlocal noexpandtab

" Taglist setting
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1
nnoremap <silent> <F8> :TlistToggle<CR>

" Quickfix Window
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
 
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction
nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <F7> :call ToggleList("Quickfix List", 'c')<CR>
"nnoremap <C-N> :cn<CR>
"nnoremap <C-P> :cp<CR>

" FuzzyFinder setting
"let g:fuf_modesDisable = []
"let g:fuf_mrufile_maxItem = 400
"let g:fuf_mrucmd_maxItem = 400
"nnoremap <silent> <F3>     :FufBuffer<CR>
"nnoremap <silent> <S-F3>   :FufFile<CR>

" EasyGrep setting
let g:EasyGrepMode = 2
let g:EasyGrepRecursive= 1

" bufexplorer setting
let g:bufExplorerSplitBelow = 1

" mark setting
nmap <Leader>M <Plug>MarkToggle
nmap <Leader>N <Plug>MarkAllClear

" Supertab setting
let g:SuperTabDefaultCompletionType = "context"

" SnipMate setting
let g:snippets_dir = "~/.vim/bundle/SystemVerilog/snippets, ~/.vim/bundle/snipmate.vim/snippets"

" For save fold information
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

command! -bang -nargs=+ Gr let @g=""|execute 'g/<args>/y G'|new|setlocal bt=nofile|put! g
nnoremap <silent> <Leader>nn :redir @g<CR>:g//<CR>:redir END<CR>:new<CR>:put! g<CR>

" Set Foldmethod=expr
function! MyFoldLevel(lnum)
  let m_fold = (getline(a:lnum)=~'^\x\+') ? 1 : 0
  return m_fold
endfunction

command! -bang -nargs=0 Fe set foldmethod=expr|set foldexpr=MyFoldLevel(v:lnum)
nmap <silent> <F9> :Fe<CR>
