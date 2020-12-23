" Add the :Cfilter/:Lfilter commands
packadd cfilter

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
