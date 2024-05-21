local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')

local header = {
    type = 'text',
    val = 'Neovim',
    opts = {
        position = 'center',
    }
}

local buttons = {
    type = 'group',
    val = {
        {
            type = 'text',
            val = 'Quick actions',
            opts = { position = 'center' }
        },
        {
            type = 'padding',
            val = 1,
        },
        dashboard.button('<leader>n', '󰝒  New File',
                         ':enew <CR>',
                         { desc = 'New file' }),
        dashboard.button('<leader>o', '󰈢  Recent Files',
                         ':Telescope oldfiles<CR>',
                         { desc = 'Recent files' }),
        dashboard.button('<leader>ff', '󰈞  Find File',
                         ':Telescope find_files<CR>'),
        dashboard.button('<leader>fg', '󰮗  Find in files')
    }
}

alpha.setup {
    layout = {
        {
            type = 'padding',
            val = 2,
        },
        header,
        {
            type = 'padding',
            val = 2,
        },
        buttons,
        {
            type = 'padding',
            val = 2,
        },
    },
}

--	vim.api.nvim_create_autocmd("User", {
--	    pattern = "AlphaReady",
--	    command = "set showtabline=0 | set laststatus=0",
--	})
