" Add the :Cfilter/:Lfilter commands
packadd cfilter

" Give access to undo'ing and redo'ing changes to the quickfix list
nnoremap <buffer> u :lolder<CR>
nnoremap <buffer> <C-r> :lnewer<CR>

" Resize the window to be bigger/smaller
nnoremap <buffer> + <C-w>+
nnoremap <buffer> - <C-w>-

" {{{ Give access to the quickfix filtering commands.
" Delete or FilterIn quickfix/locationlist entries based on currently highlighted patterns
"
" Grammar: <Leader><QF_LL><FILTER>
"
" QF_LL :=
" q (quickfix list)
" l (localtion list)
"
" FILTER :=
" k (keep - filter IN)
" d (delete - filter OUT)
"
" Highlight a pattern (with '*' or '/') and use one of these commands.
let s:qf = #{
\   l: 'Lfilter',
\   q: 'Cfilter',
\ }
let s:bang = #{
\   k: '',
\   d: '!',
\ }
for [key_cmd, cmd] in items(s:qf)
  for [key_bang, bang] in items(s:bang)
    execute printf("nnoremap <buffer> <Leader>%s%s :%s%s ''<CR>", key_cmd, key_bang, cmd, bang)
  endfor
endfor
" }}}

" Convenience mappings (Keep in, Delete out)
nmap <buffer> F <Leader>lk
nmap <buffer> D <Leader>ld

" Delete the current line from locationlist
nnoremap <buffer> <silent> X ma$vF<Bar>w"0y/\V<C-r>0<CR>:Lfilter! ''<CR>`a
" TODO if we delete the last line from the qf/ll, then we will fail to go to
" the mark

call developer#register_plugin(expand("<sfile>:h:h"))
