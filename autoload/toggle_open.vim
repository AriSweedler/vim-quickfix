function! toggle_open#quickfix()
  if (&buftype == "quickfix")
    cclose
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen 15
  endif
endfunction

function! toggle_open#locationlist()
  " buftype of the location list is quickfix
  if (&buftype == "quickfix")
    lclose
    execute g:locationlist_return_to_window . "wincmd w"
    " call quickfix#signs#clear(winnr())
  else
    let g:locationlist_return_to_window = winnr()
    " call quickfix#signs#place(winnr())
    lopen 15
  endif
endfunction
