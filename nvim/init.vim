" init file for neovim.

" stuff for filetree
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" sensible defaults
set nu
set rnu
syntax on
set shellslash
set ignorecase 
let mapleader = " "

" lsp windows
set cmdheight=1
set laststatus=2
set scrolloff=10

" tabs!
set tabstop=2
set shiftwidth=2
set smarttab
set ai 
set si
" color!
set t_Co=256

" kitty stuff
runtime ./kitty.vim

" initialize packages
runtime ./plug.vim
lua require('plug')

" initialize language servers
lua require('lsp')

" keybinds

" trouble config
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" vimtex 
filetype plugin indent on
let g:vimtex_view_method = 'sioyek'

let g:vimtex_compiler_latexmk = {
    \ 'options': [
		\   '-xelatex' ,
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
    \}


" glow
nnoremap <leader>p :Glow<cr>

" dashboard
let g:dashboard_default_executive = 'telescope'

"filetree 
nnoremap <leader>ff <cmd>NvimTreeToggle<cr>
nnoremap <leader>fs <cmd>NvimTreeFindFile<cr>

" comments
vmap gc <Plug>ToggleCommaround

" nvim-window config
map <silent> <leader>w :lua require('nvim-window').pick()<cr>

" bufferline 
nnoremap <silent>[b :BufferLineCycleNext<cr>
nnoremap <silent>b] :BufferLineCyclePrev<cr>

"zen
nnoremap <leader>zn <cmd>TZNarrow<cr>
nnoremap <leader>zf <cmd>TZFocus<cr>
nnoremap <leader>zm <cmd>TZMinimalist<cr>
nnoremap <leader>za <cmd>TZAtaraxis<cr>

" git
nnoremap <leader>gg <cmd>LazyGit<cr>

"terminal 
nnoremap <leader>tt <cmd>ToggleTerm direction=horizontal<cr>
nnoremap <leader>tv <cmd>ToggleTerm direction=vertical size=70<cr>

set textwidth=60

autocmd BufRead,BufNewFile notes/**/*.md setlocal backupcopy=yes
