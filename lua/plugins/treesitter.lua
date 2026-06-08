local languages = {
  "bash",
  "c",
  "go",
  "json",
  "lua",
  "markdown",
  "markdown_inline",
  "python",
  "terraform",
  "toml",
  "rust",
  "yaml",
}

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install(languages)

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Start treesitter highlighting and indentation when a parser is available",
      callback = function(args)
        local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
        if not lang then
          return
        end
        if not pcall(vim.treesitter.start, args.buf, lang) then
          return
        end
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
