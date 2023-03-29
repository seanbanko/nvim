require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

local servers = {
  "bashls",
  "clangd",
  "cssls",
  "gopls",
  "hls",
  "html",
  "jdtls",
  "jsonls",
  "lua_ls",
  "marksman",
  "pyright",
  "rust_analyzer",
  "texlab",
  "tsserver",
  "yamlls",
}

require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
  return
end

for _, server in pairs(servers) do
  local opts = {
    on_attach = require("seanbanko.lsp.handlers").on_attach,
    capabilities = require("seanbanko.lsp.handlers").capabilities,
  }
  server = vim.split(server, "@")[1]
  if server == "gopls" then
    local go_opts = {
      settings = {
        gopls = {
          gofumpt = true,
        },
      },
    }
    opts = vim.tbl_deep_extend("force", go_opts, opts)
  end
  if server == "lua_ls" then
    local lua_opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' }
          }
        }
      }
    }
    opts = vim.tbl_deep_extend("force", lua_opts, opts)
  end
  lspconfig[server].setup(opts)
end

