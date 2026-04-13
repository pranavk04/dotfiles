-- importing lsp related modules
local lsp = require('lspconfig')
local cmp = require('cmp')
local null_ls = require('null-ls')

require('mason').setup {}
require('mason-lspconfig').setup {}

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end, 
    }, 
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), 
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'luasnip' }, -- For luasnip users.
    }, {
      { name = 'buffer' },
    })
  })

-- initializes all of the language servers
--
local on_attach = function(client, bufnr)
    -- this is for manual completion, not sure if needed
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration(), bufopts)
	buvim.keymap.set('n', 'gd', vim.lsp.buf.definition(), bufopts)
	buvim.keymap.set('n', 'K', vim.lsp.buf.hover(), bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp['ts_ls'].setup {
    capabilities = capabilities, 
    on_attach = on_attach,
}
lsp['pyright'].setup {
    capabilities = capabilities, 
    on_attach = on_attach,
}
lsp['clangd'].setup {
    capabilities = capabilities, 
    on_attach = on_attach,
}
lsp['cmake'].setup {
    capabilities = capabilities, 
    on_attach = on_attach,
}

lsp['texlab'].setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

null_ls.setup({
    null_ls.builtins.formatting.stylua, 
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.completion.spell, 
    null_ls.builtins.diagnostics.clang_check, 
    null_ls.builtins.diagnostics.chktex,
    null_ls.builtins.diagnostics.cmake_lint,
    null_ls.builtins.diagnostics.flake8,
})

return {
  {
    "nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
        signs = false,
      },
    },
  },
}
