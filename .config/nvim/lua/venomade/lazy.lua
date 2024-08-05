local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
	-- Telescope Fuzzy Finder
	{'nvim-telescope/telescope.nvim', tag = '0.1.3', dependencies = {'nvim-lua/plenary.nvim'}},
	-- Catppuccin color scheme
	{'catppuccin/nvim', name = 'catppuccin', priority = 1000},
	-- Treesitter syntax highlighting
	{'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},
	-- Harpoon bookmarking
	{'theprimeagen/harpoon'},
	-- LSP ZERO
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig', dependencies = {'hrsh7th/cmp-nvim-lsp'}},
	{'hrsh7th/nvim-cmp', dependencies = {'L3MON4D3/LuaSnip'}},
	-- Codeium AI Completion
	{'Exafunction/codeium.nvim', dependencies = {'nvim-lua/plenary.nvim', 'hrsh7th/nvim-cmp'}},
	-- Dashboard
	{'goolord/alpha-nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},
  -- LSP Icons
  {'onsails/lspkind.nvim'},
  -- Bufferline
  {'nvim-lualine/lualine.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},
  -- Autoparis
  {'windwp/nvim-autopairs'},
  -- Color Highlighting
  {'norcalli/nvim-colorizer.lua'},
  -- Return to last edit position
  {'ethanholz/nvim-lastplace'},
  -- Shortcut helper
  {'folke/which-key.nvim', event = 'VeryLazy'},
  -- Easy Motions for jumping to exact positions
  {'easymotion/vim-easymotion'},
  -- Smooth, Kinetic scrolling
  {'yuttie/comfortable-motion.vim'},
  -- OrgMode support
  {'nvim-orgmode/orgmode', event = 'VeryLazy', ft = {'org'}},
  -- Filemanager like Coconut Oil
  {'stevearc/oil.nvim', dependencies = {'nvim-tree/nvim-web-devicons'}},
  -- Highlight TODO, FIX, HACK, e.t.c.
  {'folke/todo-comments.nvim', dependencies = {'nvim-lua/plenary.nvim'}},
  -- Rainbow Brackets and other Delimeters
  {'HiPhish/rainbow-delimiters.nvim'},
  -- Magit for Neovim
  { 'NeogitOrg/neogit', dependencies = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim', 'nvim-telescope/telescope.nvim'}, config = true},
})
