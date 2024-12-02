return {
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup()
      vim.keymap.set('n', '<leader>tf', '<cmd>:ToggleTerm direction=float name=float<CR>')
      vim.keymap.set('n', '<leader>tv', '<cmd>:ToggleTerm direction=vertical name=vertical<CR>')
    end,
  },
}
