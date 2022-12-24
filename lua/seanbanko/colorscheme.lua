local colorscheme = "rose-pine"

if colorscheme == "catppuccin" then
  require("catppuccin").setup({
    flavour = "macchiato"
  })
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
