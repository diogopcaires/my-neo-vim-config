return {
  {
    'junegunn/vim-easy-align',
    config = function()
      vim.keymap.set('n', 'gx', '<Plug>(EasyAlign)', { desc = 'Trigger EasyAlign in normal mode' })
      vim.keymap.set('x', 'gx', '<Plug>(EasyAlign)', { desc = 'Trigger EasyAlign in visual mode' })
      vim.keymap.set('n', '<C-a>', 'vi{ga-<SPACE><CR>', {
        desc = 'Toggle Spectre',
      })

      vim.keymap.set('n', '<C-A>', 'vi[ga-<SPACE><CR>', {
        desc = 'Toggle Spectre',
      })
    end,
  },
  {
    'godlygeek/tabular',
    config = function() end,
  },
}
