return {
    { "neo-tree.nvim", enabled = false },
    {
      "echasnovski/mini.files",
      config = function()
        require("telescope").load_extension "file_browser"
        vim.keymap.set("n", "<leader>e",  function()
                                            if not require("mini.files").close() then require("mini.files").open() end
                                          end)
      end,
      opts = {},
    },
    {
      "catppuccin",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  }