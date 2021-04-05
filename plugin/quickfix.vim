" Thanks, unimpaired.vim

"""""""""""""""""""""""""""""""" Quickfix """""""""""""""""""""""""""""""" {{{
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

nnoremap <Leader>qq :call QuickfixToggle()<CR>
nnoremap <Leader>qQ :cclose<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
"""""""""""""""""""""""""""""" Locationlist """""""""""""""""""""""""""""" {{{
nnoremap <silent> [l :try <Bar> :lprevious <Bar> catch <Bar> :lfirst <Bar> endtry<CR>
nnoremap <silent> ]l :try <Bar> :lnext <Bar> catch <Bar> :llast <Bar> endtry<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

nnoremap <Leader>ll :call LocationListToggle()<CR>
nnoremap <Leader>lL :lclose<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
"""""""""""""""""""""""" Useful command 'abbrev's """""""""""""""""""""""" {{{
cabbrev lgerp lgrep
cabbrev grep lgrep
cabbrev gerp lgrep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
"""""""" Like '*', but load search results into the quickfix list """""""" {{{
" Use '<Leader>*' to do a project-wide search.
" Put results in the location list
nnoremap <silent> <Leader>* vgn"0y:lgrep! "<C-r>=escape(@0, '[]/\')<CR>"<CR>:lopen 15<CR><C-w>w
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
"""""""""""" Functions to toggle quickfix list / location list """"""""""" {{{
function! QuickfixToggle()
  if (&buftype == "quickfix")
    cclose
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen 15
  endif
endfunction

function! LocationListToggle()
  " buftype of the location list is quickfix
  if (&buftype == "quickfix")
    lclose
    execute g:locationlist_return_to_window . "wincmd w"
  else
    let g:locationlist_return_to_window = winnr()
    lopen 15
  endif
endfunction
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" }}}
