
call plug#begin()
" Sensible defaults.
Plug 'tpope/vim-sensible'

" Handle surroundings (ys/cs/ds).
Plug 'tpope/vim-surround'

" Comment and uncomment (gc*)
Plug 'tpope/vim-commentary'

" Unix command helpers (e.g. SudoWrite).
Plug 'tpope/vim-eunuch'

" Git command helpers (:G*)
Plug 'tpope/vim-fugitive'

" Improved netrw.
Plug 'tpope/vim-vinegar'

" Various paired bracket mappings.
Plug 'tpope/vim-unimpaired'

" Sublime-like multiple cursors (C-n).
Plug 'terryma/vim-multiple-cursors'

" Show git changes (]c/[c to jump between).
Plug 'airblade/vim-gitgutter'

" Fuzzy file/buffer/mru etc. finder (C-p, obviously).
Plug 'kien/ctrlp.vim'

" Add :Bdelete command to close buffer without changing layout.
Plug 'moll/vim-bbye'

" Start screen and improved session management.
Plug 'mhinz/vim-startify'

" Syntax checking.
Plug 'scrooloose/syntastic'

" Single command for grabbing then swapping windows.
Plug 'wesQ3/vim-windowswap'

" Autocompletion.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Transition between single and multiline code (gS and gJ).
Plug 'AndrewRadev/splitjoin.vim'

" Switch text with pre-defined replacements e.g. || <-> && (gs).
Plug 'AndrewRadev/switch.vim'

" Look up documentation for word under cursor (gK).
Plug 'keith/investigate.vim'

" Motions through camel-case/underscore-case words (',b', ',w', ',e')
Plug 'bkad/CamelCaseMotion'

" Language-specific.
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'andreimaxim/vim-io'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'yaymukund/vim-rabl'
Plug 'tpope/vim-rails'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock' " Add Ruby text object (r).

" Passive features.
Plug 'tpope/vim-endwise' " Automatically end certain structures.
Plug 'tpope/vim-sleuth' " Automatic indent settings.
Plug 'tpope/vim-repeat' " Make '.' work with mappings.
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace.
Plug 'henrik/vim-indexed-search' " Show number of search results.
Plug 'bling/vim-airline' " Status line.
Plug 'Yggdroot/indentLine' " Indentation lines.
Plug 'valloric/MatchTagAlways' " Highlight enclosing HTML/XML tags.
Plug 'jiangmiao/auto-pairs' " Inserting and deleting brackets.

" Colorschemes.
Plug 'tomasr/molokai'
call plug#end()

colorscheme molokai

set hlsearch " Highlight search results.
set cursorline " Highlight current line.

" Highlight settings.
highlight Search ctermfg=black
highlight CurrentWord term=reverse ctermbg=236 guibg=#232526
highlight Visual ctermfg=233 ctermbg=67 guifg=#1b1d1e guibg=#465457

set relativenumber " Show line numbers relative to current line.
set number " Show current line number (would be all lines without above).
set numberwidth=8 " Spacing always given to these numbers.

set undofile " Maintain undo history between sessions.
set undodir=~/.vim/undodir " Dir for undo history.

" Add new splits on right/below existing.
set splitbelow
set splitright

set lazyredraw " Redraw only when needed.

set linebreak " Wrap lines at better places.

set hidden " Allow hidden buffers with unsaved content.

" Start scrolling when certain distance from edges of window.
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" Highlighting for Portal Sass and XHtml Haml templates (see lib/alces/action_view/templates.rb).
au BufReadPost *.pscss set syntax=scss
au BufReadPost *.xhaml set syntax=haml

" eslintrc is Json (TODO: why difference between this and above?)
au BufNewFile,BufRead .eslintrc set filetype=json

let g:jsx_ext_required = 0 " Let vim-jsx handle JSX in `.js` files.

let g:indentLine_char = '│' " indentLine character.

let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_show_hidden = 1

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}

let g:startify_bookmarks = ['~/.vimrc', '~/projects/alces/aviator', '~/projects/alces/exodus']
let g:startify_session_persistence = 1 " Save Session.vim on quit or new session load (if exists already).
let g:startify_session_autoload = 1 " Autoload Session.vim when start in dir.
let g:startify_change_to_vcs_root = 1 " Change to VCS root on file load.
let g:startify_list_order = [
    \ ['   MRU:'],
    \ 'files',
    \ ['   MRU (dir)'],
    \ 'dir',
    \ ['   Sessions:'],
    \ 'sessions',
    \ ['   Bookmarks:'],
    \ 'bookmarks',
    \ ]

let g:syntastic_javascript_checkers = ['eslint']

" TODO: Suggested Syntastic settings, read manual and adjust if needed.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:windowswap_map_keys = 0 " Prevent default bindings.
nnoremap <silent> ,ww :call WindowSwap#EasyWindowSwap()<CR>

" Move by visual line.
nnoremap j gj
nnoremap k gk

" shift-tab indents left in insert mode.
imap <S-Tab> <C-o><<

" tab/shift-tab to indent/unindent in visual mode.
vmap <Tab> >gv
vmap <S-Tab> <gv

" `//` in visual mode to search for current selection.
vnoremap // y/<C-R>"<CR>

" Search, delete, and list buffers.
map <C-b> :CtrlPBuffer<CR>
map <C-c> :Bdelete<CR>
map ,b :buffers<CR>

" `,e`, `,t`, `,s` opens file/in new tab/in new split screen window relative
" to current file.
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

" ,h/,v for horizontal/vertical splits.
noremap ,h :wincmd s<CR>
noremap ,v :wincmd v<CR>

" Arrow keys navigate split screens.
noremap <silent> <Up> :wincmd k<CR>
noremap <silent> <Down> :wincmd j<CR>
noremap <silent> <Left> :wincmd h<CR>
noremap <silent> <Right> :wincmd l<CR>

" C-arrow for resizing windows.
noremap <C-Up> :wincmd +<CR>
noremap <C-Down> :wincmd -<CR>
noremap <C-Left> :wincmd <<CR>
noremap <C-Right> :wincmd ><CR>

" C-s to save in different modes.
nnoremap <silent> <C-s> :update<CR>
inoremap <silent> <C-s> <Esc>:update<CR>
vnoremap <silent> <C-s> <Esc>:update<CR>gv

" Format Json and set filetype (adapted from
" coderwall.com/p/faceag/format-json-in-vim)
nmap <silent> =j :%!python -m json.tool<CR> :setfiletype json<CR>

" Automatically set/unset paste when pasting in insert mode
" (see http://superuser.com/a/904446 - will need changing if using vim within
" Tmux).
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" Highlight word under cursor (see stackoverflow.com/a/1552193/2620402).
autocmd CursorMoved * exe printf('match CurrentWord /\V\<%s\>/', escape(expand('<cword>'), '/\'))
