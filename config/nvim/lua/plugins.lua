return {
	{"rose-pine/neovim", as = "rose-pine"},
	{"brenoprata10/nvim-highlight-colors"},
  {"windwp/nvim-autopairs"},
  {"nvim-treesitter/nvim-treesitter"},
  {"nvim-telescope/telescope.nvim",
  dependencies = {"nvim-lua/plenary.nvim"}},
  {"hrsh7th/nvim-cmp"},
  {"hrsh7th/cmp-buffer"},
  {"hrsh7th/cmp-path"},
  {"hrsh7th/cmp-nvim-lsp"},
  {"L3MON4D3/LuaSnip"},
  {"saadparwaiz1/cmp_luasnip"},
  {"ggandor/leap.nvim",
  dependencies = {"tpope/vim-repeat"}},
  {"nvim-lualine/lualine.nvim"},
  {"luukvbaal/statuscol.nvim"},
  {"Exafunction/codeium.vim", event = 'BufEnter'},
  {"neovim/nvim-lspconfig", lazy = false,
  dependencies = {
      { "ms-jpq/coq_nvim", branch = "coq" },
      { "ms-jpq/coq.artifacts", branch = "artifacts" },
      { 'ms-jpq/coq.thirdparty', branch = "3p" }
    },
    init = function()
      vim.g.coq_settings = {
          auto_start = true, -- if you want to start COQ at startup
          -- Your COQ settings here
      }
    end,
  }
}
