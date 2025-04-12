return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = { 'CodeCompanionChat' },
  keys = {
    { '<leader>cc', '<cmd>CodeCompanionChat toggle<cr>', desc = 'Toggle CodeCompanionChat' },
    { '<leader>cp', '<cmd>CodeCompanionChat<cr>', desc = 'Open CodeCompanionChat' },
  },
  opts = {
    strategies = {
      chat = {
        adapter = 'copilot',
        slash_commands = {
          ['buffer'] = {
            opts = {
              provider = 'telescope',
              contains_code = true,
            },
          },
          ['file'] = {
            opts = {
              provider = 'telescope',
              contains_code = true,
            },
          },
        },
      },
      inline = { adapter = 'copilot' },
    },
    adapters = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          schema = {
            model = {
              default = 'claude-3.5-sonnet',
            },
          },
        })
      end,
    },
  },
}
