
" Open the ShellCheck wiki page for the error detected on the current line, as
" reported by ALE.
function! ShowShellcheckWikiPage()
  let l:issue = s:LineHasShellcheckIssue()

  if l:issue != -1
    execute '!xdg-open https://github.com/koalaman/shellcheck/wiki/' . l:issue
  endif
endfunction
Repeatable nnoremap <buffer> <silent> <leader>sc :call ShowShellcheckWikiPage()<CR>

" Add a line above the current line to disable the current Shellcheck issue,
" if any.
function! DisableShellcheckIssue()
  let l:issue = s:LineHasShellcheckIssue()

  if l:issue != -1
    execute 'normal! mzO# shellcheck disable=' . l:issue . "\<esc>`z"
  endif
endfunction
Repeatable nnoremap <buffer> <silent> <leader>sd :call DisableShellcheckIssue()<CR>

" Return the Shellcheck error code (SCxxxx) if the current line has a
" Shellcheck issue, otherwise return -1.
function! s:LineHasShellcheckIssue()
  let l:error_regex = line('.') . ' col'

  lopen
  let l:has_issue = search(l:error_regex)
  normal! 0f:B"zyt:
  let l:issue = execute('echon @z')
  lclose

  if (!l:has_issue)
    echom 'No ShellCheck issue on current line.'
    return -1
  else
    return l:issue
  endif
endfunction
