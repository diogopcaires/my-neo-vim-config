return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          --"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            vim.keymap.set("n", "<leader>e",'<cmd>:Neotree toggle<CR>')
        end,
    },
    {
      "echasnovski/mini.files",
      config = function()
        require("telescope").load_extension "file_browser"
        vim.keymap.set("n", "<leader>m",  function()
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