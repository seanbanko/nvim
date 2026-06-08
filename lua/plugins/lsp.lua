vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = true,
  virtual_text = {
    prefix = "●",
    spacing = 1,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.HINT] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = true,
  },
})

vim.o.winborder = "rounded"

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
    end
    map("n", "K", vim.lsp.buf.hover, "Hover")
    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
    map("n", "gr", vim.lsp.buf.references, "References")
    map("n", "gi", vim.lsp.buf.implementation, "Implementation")
    map("n", "gt", vim.lsp.buf.type_definition, "Type definition")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    map("n", "?", vim.diagnostic.open_float, "Diagnostic float")
    map("n", "<leader>]d", function() vim.diagnostic.jump({ count = 1, float = false }) end, "Next diagnostic")
    map("n", "<leader>[d", function() vim.diagnostic.jump({ count = -1, float = false }) end, "Previous diagnostic")
    map("n", "<leader>lr", "<cmd>LspRestart<cr>", "LSP Restart")
  end,
})

local servers = {
  "ansiblels",
  "bashls",
  "buf_ls",
  "clangd",
  "cssls",
  "gopls",
  "html",
  "jdtls",
  "jsonls",
  "lua_ls",
  "marksman",
  "pyright",
  "terraformls",
  "texlab",
  "ts_ls",
}

vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.config("clangd", {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = false,
})

vim.lsp.enable(servers)

return {}
