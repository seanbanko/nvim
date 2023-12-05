local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Neovim Lua API
  "folke/neodev.nvim",
  -- LSP
  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        }
      }
    },
  },
  "williamboman/mason-lspconfig.nvim",
  -- LSP Misc
  "mfussenegger/nvim-ansible",
  "lervag/vimtex",
  -- Autocompletion (from LazyVim)
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local defaults = require("cmp.config.default")()
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<c-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<c-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<c-b>"] = cmp.mapping.scroll_docs(-4),
          ["<c-f>"] = cmp.mapping.scroll_docs(4),
          ["<c-space>"] = cmp.mapping.complete(),
          ["<c-e>"] = cmp.mapping.abort(),
          ["<cr>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<s-cr>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<c-cr>"] = function(fallback)
            cmp.abort()
            fallback()
          end,
          -- Uncomment these for SuperTab (trying without for now)
          -- ["<tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          --     cmp.select_next_item()
          --     -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          --     -- this way you will only jump inside the snippet region
          --   elseif luasnip.expand_or_jumpable() then
          --     luasnip.expand_or_jump()
          --   elseif has_words_before() then
          --     cmp.complete()
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
          -- ["<S-Tab>"] = cmp.mapping(function(fallback)
          --   if cmp.visible() then
          --     cmp.select_prev_item()
          --   elseif luasnip.jumpable(-1) then
          --     luasnip.jump(-1)
          --   else
          --     fallback()
          --   end
          -- end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
        formatting = {
          format = require("lspkind").cmp_format({
            mode = 'symbol',
            maxwidth = 50,
            ellipsis_char = '...'
          })
        },
        -- format = function(_, item)
        --   local icons = require("seanbanko.cmp").kinds
        --   if icons[item.kind] then
        --     item.kind = icons[item.kind] .. item.kind
        --   end
        --   return item
        -- end,
        experimental = {
          ghost_text = {
            hl_group = "CmpGhostText",
          },
        },
        sorting = defaults.sorting,
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      }
    end,
    config = function(_, opts)
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end
      require("cmp").setup(opts)
    end,
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  -- Snippets (from LazyVim)
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    opts = {
      history = true,
      delete_check_events = "TextChanged",
    },
    keys = {
      { "<tab>",   function() return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>" end, expr = true,        silent = true, mode = "i", },
      { "<tab>",   function() require("luasnip").jump(1) end,                                                     mode = "s" },
      { "<s-tab>", function() require("luasnip").jump(-1) end,                                                    mode = { "i", "s" } },
    },
  },
  -- Linting
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        go = { "golangcilint" },
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
        json = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    },
  },
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
          -- When in diff mode, we want to use the default
          -- vim text objects c & C instead of the treesitter ones.
          local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
          local configs = require("nvim-treesitter.configs")
          for name, fn in pairs(move) do
            if name:find("goto") == 1 then
              move[name] = function(q, ...)
                if vim.wo.diff then
                  local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
                  for key, query in pairs(config or {}) do
                    if q == query and key:find("[%]%[][cC]") then
                      vim.cmd("normal! " .. key)
                      return
                    end
                  end
                end
                return fn(q, ...)
              end
            end
          end
        end,
      },
    },
    opts = {
      highlight = { enable = true, },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "go",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "toml",
        "python",
        "rust",
        "yaml",
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  -- Debugger
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "rcarriga/nvim-dap-ui",
        keys = {
          { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "v" } },
        },
        opts = {},
        config = function(_, opts)
          local dap = require("dap")
          local dapui = require("dapui")
          dapui.setup(opts)
          dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open({})
            vim.opt.mouse = "a"
          end
          dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close({})
            vim.opt.mouse = ""
          end
          dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close({})
            vim.opt.mouse = ""
          end
        end,
      },
      {
        "theHamsta/nvim-dap-virtual-text",
        config = true,
      },
      {
        "leoluz/nvim-dap-go",
        config = true,
        keys = {
          { "<leader>dt", function() require("dap-go").debug_test() end, mode = "n", silent = true },
        },
      },
    },
    keys = {
      { "<leader>tb", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dc", function() require("dap").continue() end,          desc = "Continue" },
      { "<leader>dT", function() require("dap").terminate() end,         desc = "Terminate" },
    },
    config = function()
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
      vim.fn.sign_define('DapBreakpoint', { text = '⬤', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '→', texthl = 'DapStopped', linehl = '', numhl = '' })
    end,
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    keys = {
      { "<leader>fo", "<cmd>Telescope find_files<cr>",                                           mode = "n", silent = true, },
      { "<leader>lg", "<cmd>Telescope live_grep<cr>",                                            mode = "n", silent = true, },
      { "<leader>di", "<cmd>Telescope diagnostics<cr>",                                          mode = "n", silent = true, },
      { "<leader>cs", "<cmd>Telescope colorscheme<cr>",                                          mode = "n", silent = true, },
      { "<leader>/",  "<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending<cr>", mode = "n", silent = true, },
    },
  },
  -- Git
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
    keys = {
      { "<leader>tgb", function() require("gitsigns").toggle_current_line_blame() end, mode = "n", silent = true },
      { "<leader>gb",  function() require("gitsigns").blame_line() end,                mode = "n", silent = true },
    },
  },
  -- Misc
  {
    "numToStr/Comment.nvim",
    config = true,
  },
  "RRethy/vim-illuminate",
  "ellisonleao/glow.nvim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = true,
  },
  -- UI
  {
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
          component_separators = "|",
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 }, },
          lualine_b = { { "filename", path = 2 } },
          lualine_c = { "branch" },
          lualine_x = { diagnostics },
          lualine_y = { filetype, spaces, "progress" },
          lualine_z = { { "location", separator = { right = "" }, left_padding = 2 }, },
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
  },
  "folke/twilight.nvim",
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 1,
        width = 0.5,
        height = 1,
      },
    },
    keys = { { "<leader>z", function() require("zen-mode").toggle() end, mode = "n", silent = true } },
  },
  "lukas-reineke/indent-blankline.nvim",
  "tpope/vim-surround",
  "sindrets/diffview.nvim",
  {
    "simrat39/symbols-outline.nvim",
    config = true,
    keys = { { "<leader>so", "<cmd>SymbolsOutline<cr>", mode = "n", silent = true } },
  },
  {
    "https://codeberg.org/esensar/nvim-dev-container",
    dependencies = "nvim-treesitter/nvim-treesitter",
    opts = {
      attach_mounts = {
        neovim_config = {
          enabled = true,
          options = { "readonly" },
        },
      },
    }
  },
  -- Colorschemes
  { "catppuccin/nvim", name = "catppuccin" },
  {
    "sainnhe/everforest",
    config = function()
      vim.cmd [[ let g:everforest_background='soft' ]]
    end
  },
  "folke/tokyonight.nvim",
  "projekt0n/github-nvim-theme",
  "rose-pine/neovim",
  "shaunsingh/nord.nvim",
})
