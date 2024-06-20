vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set('n', 'gb', '<cmd>:b#<CR>', {silent = true, desc = "Previous Buffer"})
vim.keymap.set('n', 'A-h', '<cmd>:bprev<CR>', {silent = true, desc = "Previous Buffer"})
vim.keymap.set('n', 'A-l', '<cmd>:bnext<CR>', {silent = true, desc = "Next Buffer"})
vim.keymap.set('n', '<leader>bb', '<cmd>:Telescope buffers<CR>', {silent = true, desc = "Buffer list"})

vim.keymap.set('n', '<LEADER>jv', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', {noremap=true, silent=true})
vim.keymap.set('n', 'gv', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', {noremap=true, silent=true})

-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})