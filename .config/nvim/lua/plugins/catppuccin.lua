require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    term_colors = true,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = {},
        operators = {},
    },
    integrations = {
        treesitter = true,
    },
})

vim.cmd.colorscheme "catppuccin"
