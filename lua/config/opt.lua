vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"

-- Enable autoread
vim.o.autoread = true

-- Create an autocommand group to prevent stacking
local group = vim.api.nvim_create_augroup("AutoReadGroup", { clear = true })

-- Add the autocommand
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "CursorHold" }, {
  group = group,
  pattern = "*", -- Apply to all files
  command = 'if &buftype == "" | checktime | endif',
  desc = "Check for file changes on disk and reload if needed",
})

