return {
  {
    'echasnovski/mini.move',
    version = '*',
    opts = {
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<A-h>',
        right = '<A-l>',
        down = '<A-j>',
        up = '<A-k>',

        -- Move current line in Normal mode
        line_left = '<A-h>',
        line_right = '<A-l>',
        line_down = '<A-j>',
        line_up = '<A-k>',
      },
    },
  },
  {
    'echasnovski/mini.splitjoin',
    version = false,
    opts = {
      -- Detection options: where split/join should be done
      detect = {
        -- Array of Lua patterns to detect region with arguments.
        -- Default: { '%b()', '%b[]', '%b{}' }
        brackets = nil,

        -- String Lua pattern defining argument separator
        separator = ' ',

        -- Array of Lua patterns for sub-regions to exclude separators from.
        -- Enables correct detection in presence of nested brackets and quotes.
        -- Default: { '%b()', '%b[]', '%b{}', '%b""', "%b''" }
        exclude_regions = nil,
      },
    },
    config = function()
      require('mini.splitjoin').setup()
    end,
  },
  {
    'echasnovski/mini.align',
    version = '*',
    config = function()
      require('mini.align').setup()
    end,
  },
}
