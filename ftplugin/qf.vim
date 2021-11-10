" Add the :Cfilter/:Lfilter commands
packadd cfilter

" Resize the window to be bigger/smaller
nnoremap <buffer> + <C-w>+
nnoremap <buffer> - <C-w>-

" Filter to (delete | keep) from the (location | quickfix) list based on the current match
nnoremap <buffer> <Leader>lfk :Lfilter ''<CR>
nnoremap <buffer> <Leader>lfd :Lfilter! ''<CR>
nnoremap <buffer> <Leader>cfk :Cfilter ''<CR>
nnoremap <buffer> <Leader>cfd :Cfilter! ''<CR>

" Convenience mappings
nmap <buffer> F <Leader>lfk
nmap <buffer> D <Leader>lfd
nmap <buffer> u :lolder<CR>
nmap <buffer> <C-r> :lnewer<CR>

call developer#register_plugin(expand("<sfile>:h:h"))
