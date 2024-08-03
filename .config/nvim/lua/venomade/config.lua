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
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 12

vim.opt.updatetime = 50

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.encoding = "utf-8"

vim.opt.shell = "bash"

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.title = true

vim.cmd "set showtabline=0 | set laststatus=0"

vim.api.nvim_create_autocmd("ExitPre", {
	group = vim.api.nvim_create_augroup("Exit", { clear = true }),
	command = "set guicursor=a:ver90",
	desc = "Set cursor back to beam when leaving Neovim."
}) 
