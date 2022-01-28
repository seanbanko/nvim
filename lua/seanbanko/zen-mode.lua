local present, zm_config = pcall(require, 'zen-mode')
if not present then
  return
end

zm_config.setup {
  window = {
      backdrop = 1,
      width = 90,
      height = 1,
  },
  plugins = {
      twilight = { enabled = false },
  }
}
