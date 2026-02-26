return {
  "editor-code-assistant/eca-nvim",
  dependencies = {
    "MunifTanjim/nui.nvim", -- Required: UI framework
    "nvim-lua/plenary.nvim", -- Optional: Enhanced async operations
  },
  config = function(opts, _)
    -- wrap setup in vim.schedule to avoid fast-event notifications
    vim.schedule(function()
      require("eca").setup({
        -- server_path = vim.fn.expand("~/.config/nvim/eca"),
        -- Extra arguments for ECA server
        debug = true,
        server_args = "--log-level debug",

        defaultModel = "nubank/gpt-5-high",
        -- === BEHAVIOR ===
        behaviour = {
          auto_focus_sidebar = true,
          show_status_updates = false,
          -- Set keymaps automatically
          auto_set_keymaps = true,
          -- Start server automatically
          auto_start_server = true,
          -- Download server automatically if not found
          auto_download = true,
        },
        windows = {
          width = 50,
          wrap = true,
          sidebar_header = { enabled = true, rounded = true },
          input = { prefix = "- ", height = 10 },
        },
      })
    end)
  end,
}
