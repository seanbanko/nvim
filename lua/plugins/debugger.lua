return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "leoluz/nvim-dap-go",
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
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = { "n", "v" } },
    },
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
    opts = {},
  },
  {
    "leoluz/nvim-dap-go",
    opts = {},
    keys = {
      { "<leader>dt", function() require("dap-go").debug_test() end, mode = "n", silent = true },
    },
  },
}
