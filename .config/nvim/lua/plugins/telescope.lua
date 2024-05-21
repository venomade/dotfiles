local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find File" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffer" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help" })
vim.keymap.set('n', '<leader>fg', function()
	builtin.grep_string({ search = vim.fn.input("Grep > "), desc = "Find by Grep" });
end)
