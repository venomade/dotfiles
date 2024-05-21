vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Explorer" })

-- Buffers
vim.keymap.set("n", "<leader>bk", vim.cmd.bdelete, { desc = "Kill Buffer" })
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext, { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bp", vim.cmd.bprev, { desc = "Previous Buffer" })

-- Windows
vim.keymap.set("n", "<leader>wh", vim.cmd.split, { desc = "Split Window Horizontally" })
vim.keymap.set("n", "<leader>wv", vim.cmd.vsplit, { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>wc", "<C-w>q", { desc = "Close Window" })
vim.keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Next Window" })
