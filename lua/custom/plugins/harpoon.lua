return {
    {
      "ThePrimeagen/harpoon",
      branch = "harpoon2",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function() 
        require("harpoon").setup()
        vim.keymap.set('n', '<leader>aa', ':lua require("harpoon"):list():add()<cr>', { desc = 'Harpoon add' })
        vim.keymap.set('n', '<leader>al', ':lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<cr>', { desc = 'Harpoon quick menu' })    
      end,
    },
  }