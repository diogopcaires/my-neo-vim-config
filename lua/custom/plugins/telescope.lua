return {
    { "nvim-telescope/telescope.nvim" },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
      config = function()
        require("telescope").load_extension "file_browser"
        vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
      end
    },
    { "nvim-telescope/telescope-fzf-native.nvim", enabled = false },
    { "stevearc/dressing.nvim", optional = true, opts = { select = { backend = { "fzf_lua" } } } },
  }