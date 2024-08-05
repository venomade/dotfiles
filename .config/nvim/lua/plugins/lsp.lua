local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client,buffer)
	lsp_zero.default_keymaps({buffer = bufnr})
  lsp_zero.buffer_autoformat()
end)

require'lspconfig'.clangd.setup{}
require'lspconfig'.hls.setup{}
require'lspconfig'.nil_ls.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.zls.setup{}

local lspkind = require('lspkind')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  preselect = 'none',
	completion = {
		completeopt = 'menu,menuone,noinsert,noselect'
	},
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
      symbol_map = { Codeium = '' },
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({select = false}),
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "codeium" }
	}
})
