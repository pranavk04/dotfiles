
" Same as standard C-s maps, but also format current paragraph.
" noremap <silent> <buffer> <C-s> <Esc>mzgqip:write<CR>`z
" noremap! <silent> <buffer> <C-s> <Esc>mzgqip:write<CR>`z

" So can write `@tag` in markdown files and search for this with `*`.
setlocal iskeyword+=@-@

" Override Vimrc setting so can open URLs containing `#` with `gx`.
setlocal isfname+=#

nmap <buffer> <leader>3 ysip3

" Convert a regular markdown bullet to a checkbox. Note:
"
" - Use `>>0f-<<2h` to find first `-` in line and position cursor on this;
"   can't just `0f` as this won't work if the first char is `-`.
"
" - Use `4l` to negate the `a [ ]`, so cursor moved back to same original
"   position.
Repeatable nnoremap <buffer> <leader>ctc mz>>0f-<<2ha [ ]<esc>`z4l

" Convert from a checkbox to a regular markdown bullet. Use `x` multiple times
" with `f` to try to ensure deleting only correct thing, rather than
" potentially deleting lots of unnecessary stuff if `d2W` or similar was used.
Repeatable nnoremap <buffer> <leader>cfc mz>>0f-<<2hf[xf]xhxx<esc>`z4h

" Format and renumber a list (so long as all in one paragraph).
Repeatable nnoremap <buffer> <leader>F mzgqipvip:RenumberSelection<CR>`z

" Uncheck all checked checkboxes (`[x]`) in a checklist.
command! -buffer -nargs=0 ClearChecklist %s/\[x\]/\[ \]/g

" Iterate through all checked/unchecked checboxes respectively.
command! -buffer -nargs=0 Checked /\[x]
command! -buffer -nargs=0 Unchecked /\[ ]

" Easily allow inserting checkbox in insert mode (without `auto-pairs` messing
" this up).
inoremap <buffer> -<space>[ <C-v>- <C-v>[ ]<space>

" Indent/dedent in insert mode.
inoremap <buffer> >> <C-o>>><C-o>$
inoremap <buffer> << <C-o><<<C-o>$
