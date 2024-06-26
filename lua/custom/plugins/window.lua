return 
{ "anuvyklack/windows.nvim",
dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim"
   },
   config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require('windows').setup()

    vim.keymap.set('n', '<leader>wm', '<cmd>:WindowsMaximizeVertically<CR>')
    vim.keymap.set('n', '<leader>we', '<cmd>:WindowsEqualize<CR>')
   end
}