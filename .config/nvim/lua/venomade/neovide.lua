if vim.g.neovide then
  vim.opt.guifont = { "FantasqueSansM Nerd Font", ":h12" }

  vim.g.neovide_scale_factor = 1.0

  --Transparency
  -- Helper function for transparency formatting
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end

  vim.g.neovide_transparency = 0.92
  vim.g.transparency = 0.92
  -- vim.g.neovide_background_color = "#1e1e2e" .. alpha()

  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

end
