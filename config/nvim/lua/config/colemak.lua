local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map("", "n", "j")
map("", "e", "k")
map("", "i", "l")
map("", "j", "n")
map("", "k", "e")
map("", "l", "i")
map("", "K", "E")
map("", "N", "J")
map("", "E", "K") -- As in 'Explore' documentation
map("", "L", "I")
map("", "I", "L")
map("", "J", "N")

map("n", "<c-w>h", "<c-w>h")
map("n", "<c-w>n", "<c-w>j")
map("n", "<c-w>e", "<c-w>k")
map("n", "<C-w>i", "<c-w>l")

-- Kakoune Holdover
map ("n", "gh", "0")
map ("n", "gi", "$")
