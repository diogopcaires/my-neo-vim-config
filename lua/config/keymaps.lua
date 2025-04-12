-- Which-key groups
local wk = require("which-key")

wk.add({
  { "<leader>b", group = "Buffers" , mode = { "n", "v" }},
  { "<leader>e", group = "Explorer" , mode = { "n", "v" }},
  { "<leader>f", group = "Find" , mode = { "n", "v" }},
  { "<leader>g", group = "Git" , mode = { "n", "v" }},
  { "<leader>l", group = "LSP" , mode = { "n", "v" }},
  { "<leader>n", group = "New File" , mode = { "n", "v" }},
  { "<leader>q", group = "Quit" , mode = { "n", "v" }},
  { "<leader>r", group = "Reload" , mode = { "n", "v" }},
  { "<leader>t", group = "Terminal" , mode = { "n", "v" }},
  { "<leader>u", group = "UI" , mode = { "n", "v" }},
  { "<leader>w", group = "Window" , mode = { "n", "v" }},
})

-- Keymaps configuration file
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- FIND / TELESCOPE / FZF
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = "Find Files" })
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = "Live Grep" })
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = "Find Buffers" })
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = "Help Tags" })
map('n', '<leader>fo', '<cmd>Telescope oldfiles<cr>', { desc = "Recent Files" })
map('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { desc = "Fuzzy Find in Buffer" })
map('n', '<leader>ft', '<cmd>Telescope treesitter<cr>', { desc = "Treesitter Symbols" })
map('n', '<leader>fm', '<cmd>Telescope marks<cr>', { desc = "Marks" })
map('n', '<leader>fc', '<cmd>Telescope commands<cr>', { desc = "Commands" })
map('n', '<leader>fk', '<cmd>Telescope keymaps<cr>', { desc = "Keymaps" })
map('n', '<leader>fr', '<cmd>Telescope resume<cr>', { desc = "Resume Last Telescope" })
map('n', '<leader>fj', '<cmd>Telescope jumplist<cr>', { desc = "Jump List" })

-- NEOTREE
map('n', '<leader>e', '<cmd>Neotree toggle<cr>', { desc = "Toggle File Explorer" })
map('n', '<leader>ef', '<cmd>Neotree focus<cr>', { desc = "Focus File Explorer" })
map('n', '<leader>ec', '<cmd>Neotree close<cr>', { desc = "Close File Explorer" })

-- LSP / Clojure-LSP
map('n', '<leader>ld', vim.lsp.buf.definition, { desc = "Go to Definition" })
map('n', '<leader>lD', vim.lsp.buf.declaration, { desc = "Go to Declaration" })
map('n', '<leader>li', vim.lsp.buf.implementation, { desc = "Go to Implementation" })
map('n', '<leader>lr', vim.lsp.buf.rename, { desc = "Rename Symbol" })
map('n', '<leader>la', vim.lsp.buf.code_action, { desc = "Code Action" })
map('n', '<leader>lt', vim.lsp.buf.type_definition, { desc = "Type Definition" })
map('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, { desc = "Format Buffer" })
map('n', '<leader>lh', vim.lsp.buf.hover, { desc = "Hover Info" })
map('n', '<leader>ls', vim.lsp.buf.signature_help, { desc = "Signature Help" })
map('n', '<leader>lR', '<cmd>Telescope lsp_references<cr>', { desc = "Find References" })
map('n', '<leader>lw', '<cmd>Telescope diagnostics<cr>', { desc = "Workspace Diagnostics" })
map('n', '<leader>ll', vim.diagnostic.open_float, { desc = "Show Line Diagnostics" })
map('n', '<leader>ln', vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map('n', '<leader>lp', vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })

-- Buffers
map('n', '<leader>bd', '<cmd>bd<cr>', { desc = "Delete Buffer" })
map('n', '<leader>bn', '<cmd>bnext<cr>', { desc = "Next Buffer" })
map('n', '<leader>bp', '<cmd>bprevious<cr>', { desc = "Previous Buffer" })
map('n', '<leader>bb', '<cmd>ls<cr>', { desc = "List Buffers" })
map('n', '<leader>bl', '<cmd>e #<cr>', { desc = "Switch to Last Buffer" })
map('n', '<leader>bw', '<cmd>wa<cr>', { desc = "Write All Buffers" })
map('n', 'gb', '<cmd>:b#<CR>', {silent = true, desc = "Previous Buffer"})

-- Windows
map('n', '<leader>ws', '<cmd>split<cr>', { desc = "Horizontal Split" })
map('n', '<leader>wv', '<cmd>vsplit<cr>', { desc = "Vertical Split" })
map('n', '<leader>wh', '<C-w>h', { desc = "Move Left" })
map('n', '<leader>wj', '<C-w>j', { desc = "Move Down" })
map('n', '<leader>wk', '<C-w>k', { desc = "Move Up" })
map('n', '<leader>wl', '<C-w>l', { desc = "Move Right" })
map('n', '<leader>ww', '<C-w>w', { desc = "Switch Window" })
map('n', '<leader>wq', '<cmd>q<cr>', { desc = "Close Window" })
map('n', '<leader>wc', '<cmd>close<cr>', { desc = "Close Current Window" })
map('n', '<leader>wo', '<cmd>only<cr>', { desc = "Keep Only This Window" })
map('n', '<leader>wr', '<C-w>r', { desc = "Rotate Windows" })
map('n', '<leader>w=', '<C-w>=', { desc = "Equalize Splits" })

-- Terminal
map('n', '<leader>tt', '<cmd>terminal<cr>', { desc = "Open Terminal" })
map('n', '<leader>tv', '<cmd>vsplit | terminal<cr>', { desc = "Vertical Terminal" })
map('n', '<leader>ts', '<cmd>split | terminal<cr>', { desc = "Horizontal Terminal" })
map('t', '<Esc>', [[<C-\><C-n>]], { desc = "Escape Terminal Mode" })

-- Git
map('n', '<leader>ggs', '<cmd>Telescope git_status<cr>', { desc = "Git Status" })
map('n', '<leader>ggc', '<cmd>Telescope git_commits<cr>', { desc = "Git Commits" })
map('n', '<leader>ggb', '<cmd>Git blame<cr>', { desc = "Git Blame" })

-- General
map('n', '<leader>w', '<cmd>w<cr>', { desc = "Write File" })
map('n', '<leader>q', '<cmd>q<cr>', { desc = "Quit" })
map('n', '<leader>Q', '<cmd>qa!<cr>', { desc = "Force Quit All" })
map('n', '<leader>r', '<cmd>source %<cr>', { desc = "Reload File" })
map('n', '<leader>n', '<cmd>enew<cr>', { desc = "New File" })

-- go to definition in a new window
vim.keymap.set('n', 'gv', '<cmd>lua require"telescope.builtin".lsp_definitions({jump_type="vsplit"})<CR>', {noremap=true, silent=true})


-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

