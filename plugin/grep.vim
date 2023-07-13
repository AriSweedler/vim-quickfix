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
  " Create a new tab so we don't move from the current one
  :tabnew %
  :set hlsearch
  :call feedkeys("/\\c".a:pattern."\<CR>")
  try
    :silent execute "lgrep '".a:pattern."'"
  catch
    :close
    return
  endtry
  :call toggle_open#locationlist()
  :call feedkeys("\<CR>")
endfunction
" Easily invoke lgrep
nnoremap <Leader>L :call <SID>ari_lgrep('')<Left><Left>

" Have 'g*' automatically load search results into the quickfix list. And have
" it work in visual mode, too
nnoremap <silent> g* g*:call <SID>ari_lgrep('<C-r>/')<CR>
vnoremap <silent> g* "0y:call <SID>ari_lgrep('<C-r>0')<CR>

" TODO implement this
"https://vi.stackexchange.com/questions/38363/how-to-get-command-line-mode-typing-to-interact-with-incsearch/38376#38376
""" command -nargs=+ Test echo <q-args>
"""
""" augroup hl-Test
"""     au!
"""     au CmdlineChanged *
"""                 \  if getcmdtype() == ':' && getcmdline()[: 3] == 'Test'
"""                 \|   let @/ = getcmdline()[4 :]->trim()
"""                 \|   setl hlsearch
"""                 \|   redraw
"""                 \| endif
""" augroup end
