return {
  {
    'junegunn/vim-easy-align',
    config = function()
      -- Start interactive EasyAlign in visual mode (e.g. vipga)
      vim.keymap.set('x', '<leader>ea', '<Plug>(EasyAlign)', {})

      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      vim.keymap.set('n', '<leader>ea', '<Plug>(EasyAlign)', {})

      vim.keymap.set('x', 'ga', '<Plug>(EasyAlign)', {})

      -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
      vim.keymap.set('n', 'ga', '<Plug>(EasyAlign)', {})

      -- Align maps {:key value}
      vim.keymap.set('n', '={', 'vi{<C-v>$:EasyAlign\\ g/^\\S/<cr>', {})

      -- Align vectors [a b c]
      vim.keymap.set('n', '=[', 'vi[<C-v>$:EasyAlign\\ g/^\\S/<cr>', {})

      -- Align parentheses (a b c)
      vim.keymap.set('n', '=(', 'vi(<C-v>$:EasyAlign\\ g/^\\S/<cr>', {})
    end,
  },
  {
    'godlygeek/tabular',
    config = function() end,
  },
}
