-- Setup Lazy Plugin Manager
require("config.lazy")

-- Setup Config
vim.cmd.colorscheme("rose-pine")
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12

vim.opt.updatetime = 50

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.encoding = "utf-8"

vim.opt.shell = "fish"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.cursorline = true

vim.opt.title = true

vim.opt.clipboard = "unnamedplus"

vim.opt.colorcolumn = "80"

vim.cmd "set showtabline=0 | set laststatus=0"

vim.wo.fillchars='eob: '

vim.g.codeium_enabled = false

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>bk", vim.cmd.bdelete, 
  { desc = "Kill Buffer" })
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, 
  { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", vim.cmd.bprev, 
  { desc = "Previous Buffer" })

vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "ge", vim.diagnostic.goto_next)

vim.keymap.set("n", "<leader>wh", vim.cmd.split,
  { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit,
  { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>wc", "<C-w>q", 
  { desc = "Close Window" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", 
  { desc = "Next Window" })


local tscope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', tscope.find_files, 
  { desc = "Find File" })
vim.keymap.set('n', '<leader>fb', tscope.buffers, 
  { desc = "Find Buffer" })
vim.keymap.set('n', '<leader>fh', tscope.help_tags, 
  { desc = "Find Help" })
vim.keymap.set('n', '<leader>fg', function()
  tscope.grep_string(
    { search = vim.fn.input("Grep > "), 
    desc = "Find by Grep" });
end)

-- Setup Plugins
require("telescope").setup({})
require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt" , "vim" }
})
require("nvim-highlight-colors").setup({})
require("statuscol").setup({relculright = true})
require("lualine").setup({
  options = {
    icons_enabled = false,
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {"mode","filename"},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {"diagnostics"},
    lualine_y = {},
    lualine_z = {}
  }
})
require('leap').create_default_mappings()
require('leap').opts.equivalence_classes = {
  ' \t\r\n', '([{', ')]}', '\'"`' }
require("nvim-treesitter.configs").setup({
  ensure_installed = {"c", "vimdoc", "markdown", "jsonc"},
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})
-- require("config.cmp")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").clangd.setup({capabilities = capabilities})
require("lspconfig").rust_analyzer.setup({})

-- Use Colemak Bindings
require("config.colemak")
