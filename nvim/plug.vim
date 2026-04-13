" vim plug for managing plugins. 
" sets the standard path:
let g:plug_home = stdpath('data') . './plugged'

call plug#begin()

" lua housekeeper
Plug 'nvim-lua/plenary.nvim'

" syntax highlighting 
Plug 'sheerun/vim-polyglot'

" indent lines for my poor pythonic eyes
Plug 'lukas-reineke/indent-blankline.nvim'

" autopairs because lazy
Plug 'windwp/nvim-autopairs'

" snippet engine 
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" colorscheme
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" lsps!
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'saadparwaiz1/cmp_luasnip'

" linting ?
Plug 'jose-elias-alvarez/null-ls.nvim'


"LATEX MY LOVE MY LIFE 
Plug 'lervag/vimtex'

" managing external lsp clients 
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim' 

" Plug 'glepnir/lspsaga.nvim'
" Plug 'nvim-lua/lsp_extensions.nvim'
" Plug 'RishabhRD/popfix'
" Plug 'RishabhRD/nvim-lsputils'
" Plug 'kosayoda/nvim-lightbulb'
" Plug 'onsails/lspkind-nvim'
" Plug 'rmagatti/goto-preview'

" cool error handling 
Plug 'MunifTanjim/nui.nvim'
" Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'

" pretty 
Plug 'prettier/vim-prettier', {'do': 'npm install'}

" prepare for trouble... 
Plug 'folke/trouble.nvim'

" op syntax highlighting plus rainbows!!!
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" which keybind does what: amazing
Plug 'folke/which-key.nvim'

" markdown preview
Plug 'ellisonleao/glow.nvim'

" persistent terminal sessions 
Plug 'akinsho/toggleterm.nvim'

" very op fuzzy finder, needs ripgrep
Plug 'nvim-telescope/telescope.nvim'

" iconsssss (this is the nvim fork)
Plug 'kyazdani42/nvim-web-devicons'

" cool tabs
Plug 'tiagovla/scope.nvim'

" lua powered statusline!
Plug 'nvim-lualine/lualine.nvim'

" evilll bad horrifying but i liked the opening page of doom e**** ngl
Plug 'goolord/alpha-nvim'

" filetree viewer
Plug 'nvim-tree/nvim-tree.lua'

" commenter because yes
Plug 'numToStr/Comment.nvim'


" easily jumping windows 
Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'

" clip manager 
Plug 'kkharji/sqlite.lua'
Plug 'AckslD/nvim-neoclip.lua'

" 善
Plug 'Pocco81/true-zen.nvim'
Plug 'folke/twilight.nvim'

" sooth scrolling 
Plug 'karb94/neoscroll.nvim'

" surround selections
Plug 'kylechui/nvim-surround'

" git spam 
Plug 'kdheepak/lazygit.nvim'

" better prose support 
Plug 'preservim/vim-pencil'

Plug 'neanias/everforest-nvim', { 'branch': 'main' }

" journal? since i like neovim interface better than obsidian tbh 
Plug 'jakobkhansen/journal.nvim'

Plug 'MeanderingProgrammer/render-markdown.nvim'

Plug 'toppair/peek.nvim'

Plug 'AlphaTechnolog/pywal.nvim'

Plug 'rktjmp/shipwright.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'oncomouse/lushwal'

Plug 'loctvl842/monokai-pro.nvim'

" rust language tools
Plug 'mrcjkb/rustaceanvim'

call plug#end()
