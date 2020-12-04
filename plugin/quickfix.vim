" Thanks, unimpaired.vim
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>
nnoremap [L :lfirst<CR>
nnoremap ]L :llast<CR>

nnoremap <Leader>ll :call LocationListToggle()<CR>
nnoremap <Leader>lc :lclose<CR>

nnoremap <Leader>qq :call QuickfixToggle()<CR>
nnoremap <Leader>qc :cclose<CR>

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
