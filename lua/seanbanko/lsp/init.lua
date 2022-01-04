local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("seanbanko.lsp.lsp-installer")
require("seanbanko.lsp.handlers").setup()
require("seanbanko.lsp.null-ls")
