local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = false,
  virtual_text = {
    prefix = "●",
    spacing = 1
  },
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
  },
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.keymap.set("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
    vim.keymap.set("n", "?", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    vim.keymap.set("n", "<leader>]d", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
    vim.keymap.set("n", "<leader>[d", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  end
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()

local servers = {
  ansiblels = {},
  bashls = {},
  bufls = {},
  clangd = {},
  cssls = {},
  gopls = {},
  html = {},
  jdtls = {},
  jsonls = {},
  lua_ls = {},
  marksman = {},
  pyright = {},
  rust_analyzer = {},
  texlab = {},
  tsserver = {},
  yamlls = {},
}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers),
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup {
        capabilities = default_capabilities
      }
    end,
    ["rust_analyzer"] = function()
      require("rust-tools").setup({
        server = {
          on_attach = function(_, bufnr)
            vim.keymap.set("n", "K", function()
              require("rust-tools").hover_actions.hover_actions()
            end, { buffer = bufnr })
          end,
        },
      })
    end,
    ["lua_ls"] = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } }
          }
        }
      }
    end,
  }
})

return {}
