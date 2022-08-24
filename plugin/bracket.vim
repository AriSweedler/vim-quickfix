" Bracket movements
nnoremap <silent> [q :call bracket#quickfix_left()<CR>
nnoremap <silent> ]q :call bracket#quickfix_right()<CR>
nnoremap <silent> [l :call bracket#locationlist_left()<CR>
nnoremap <silent> ]l :call bracket#locationlist_right()<CR>

" {{{ Special bracket movements
"
" Grammar: <Bang><Bracket><QF_LL>
"
" Bang :=
" absent - work per file
" present - work in absolute (per list)
"
" Bracket :=
" [ - backwards, up
" ] - forwards, down
"
" QF_LL :=
" q (quickfix list)
" l (localtion list)
"
" Traverse through a populated qflist or llist with these commands
let s:direction = {
\   '<Leader>[': 'first',
\   '<Leader>]': 'last',
\   '[': 'pfile',
\   ']': 'nfile',
\ }
let s:qf = #{
\   L: 'l',
\   Q: 'c',
\ }
for [key_qfll, qfll] in items(s:qf)
  for [key_direction, direction] in items(s:direction)
    execute printf("nnoremap <silent> %s%s :%s%s<CR>zv", key_direction, key_qfll, qfll, direction)
  endfor
endfor
" }}}
