local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    diagnostics.commitlint,
    diagnostics.flake8,
    diagnostics.golangci_lint,
    formatting.black.with { extra_args = { "--fast" } },
    formatting.clang_format,
    formatting.gofmt,
    formatting.google_java_format,
    formatting.prettier.with {
      extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      extra_filetypes = { "toml" },
    },
    formatting.rustfmt,
    formatting.stylish_haskell,
    formatting.stylua,
  },
}
