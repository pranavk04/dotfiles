local actions = require('telescope.actions')
local trouble = require('trouble.providers.telescope')
local telescope = require('telescope')

require('monokai-pro').setup({
	filter = "ristretto",
})
vim.cmd.colorscheme("monokai-pro")

require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}

require('nvim-treesitter').install { 'rust' }

telescope.setup {}

require('trouble').setup {
	defaults = {
		mappings = {
			i = { ["<c-t>"] = trouble.open_with_trouble }, 
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
}

require('alpha').setup(require('alpha.themes.dashboard').config)

require('noice').setup {}

vim.opt.termguicolors = true

require('Comment').setup {}

vim.o.timeout = true
vim.o.timeoutlen = 300
require('which-key').setup {}

-- require('bufferline').setup {}
require('lualine').setup {
	options = {
		theme = 'monokai-pro',
	},
	tabline = {
			lualine_a = { 'buffers' },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { 'tabs' }
	},
}

require('scope').setup {}

require('nvim-autopairs').setup {}

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require('ibl').setup {}

require('toggleterm').setup {}

require('nvim-window').setup({})

require('neoclip').setup()

require('nvim-tree').setup() 

require('true-zen').setup {}

require("everforest").setup {}

require('twilight').setup {}

require('neoscroll').setup {}

require('journal').setup {}

require('render-markdown').setup {}

require("peek").setup {}

vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

