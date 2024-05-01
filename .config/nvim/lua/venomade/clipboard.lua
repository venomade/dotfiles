vim.cmd('set clipboard+=unnamedplus')

function CopyToClipboard()
    local selected_text = vim.fn.getline("'<,'>")
    vim.fn.setreg("+", selected_text)
end

function PasteFromClipboard()
    local clipboard_text = vim.fn.getreg("+")
    vim.fn.setline('.', clipboard_text)
end

vim.api.nvim_set_keymap('x', '<Leader>y', [[:lua CopyToClipboard()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>p', [[:lua PasteFromClipboard()<CR>]], { noremap = true, silent = true })
