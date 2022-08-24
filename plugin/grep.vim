call system("which rg")
if ! v:shell_error
  " Make the grepprg rg. This is pretty much as good at git grep but it's cooler
  let &grepprg="rg --vimgrep --smart-case"
  let &grepformat="%f:%l:%c:%m"
else
  " Make the grepprg git grep. This always searches from the root of the repo
  " and ignores files that .gitignore specifies. It's a lil nicer.
  let &grepprg="git grep --line-number"
endif

" Wrapper around 'lgrep' to open results in a new tab, also highlight what we
" searched for, and automatically open the locationlist
function! s:ari_lgrep(pattern)
  :tabnew
  :call feedkeys("/".a:pattern."\<CR>")
  :execute "lgrep ".a:pattern
  :call toggle_open#locationlist()
  :call feedkeys("\<CR>")
endfunction
" Easily invoke lgrep
nnoremap <Leader>L :call <SID>ari_lgrep('')<Left><Left>
