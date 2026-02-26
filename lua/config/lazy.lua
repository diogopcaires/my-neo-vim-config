-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup options
require("config.opt")

-- Patch global para evitar "nvim_echo must not be called in a fast event context"
do
  local orig_notify = vim.notify
  vim.notify = function(msg, level, opts)
    if vim.in_fast_event() then
      vim.schedule(function()
        orig_notify(msg, level, opts)
      end)
    else
      orig_notify(msg, level, opts)
    end
  end
end

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import plugins
    { import = "plugins" },
    { import = "colorschemes" },
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Setup keymaps
require("config.keymaps")

