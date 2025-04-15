-- install zprint https://luals.github.io/#neovim-install
-- install styLua https://github.com/JohnnyMorganz/StyLua?tab=readme-ov-file#homebrew

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({
          async = true,
          lsp_format = "fallback",
        })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    notify_on_error = false,

    -- Formatação automática ao salvar
    format_on_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype

      -- Linguagens com estilos não padronizados ou formatadores problemáticos
      local disable_format_on_save = {
        c = true,
        cpp = true,
        -- clojure = true, -- evite formatação automática aqui
      }

      if disable_format_on_save[ft] then
        return nil
      end

      return {
        timeout_ms = 500,
        lsp_format = "fallback",
      }
    end,

    formatters_by_ft = {
      lua = { "stylua" },
      -- clojure = { "zprint" }, -- Adiciona suporte a zprint, se instalado
      -- Exemplo com múltiplos formatadores:
      -- python = { "isort", "black" },
      -- javascript = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
