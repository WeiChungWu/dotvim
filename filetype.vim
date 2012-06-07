"
" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.vh		setfiletype verilog
  au! BufRead,BufNewFile *.f		setfiletype verilog
  au! BufRead,BufNewFile *.bv		setfiletype verilog
  au! BufRead,BufNewFile *.dv		setfiletype verilog
  au! BufRead,BufNewFile cfg*.log	setfiletype svtb_log
augroup END

