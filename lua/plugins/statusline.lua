return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = " ", warn = " " },
      colored = true,
      update_in_insert = false,
      always_visible = true,
    }
    local filetype = {
      "filetype",
      icons_enabled = false,
      icon = nil,
    }
    local spaces = function()
      return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
    end
    require("lualine").setup({
      options = {
        component_separators = '|',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { "mode" }, },
        lualine_b = { { "filename", path = 3 }, "branch" },
        lualine_c = { diagnostics },
        lualine_x = {},
        lualine_y = { filetype, spaces, },
        lualine_z = { { "location" } },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end
}
