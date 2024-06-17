return {
    --       -- Parinfer parens management for Clojure
    -- {
    --   "gpanders/nvim-parinfer",
    --   ft = { "clojure" },
    --   init = function()
    --     vim.g.parinfer_force_balance = true
    --     vim.g.parinfer_comment_chars = ";;"
    --   end,
    -- },
  
    -- Clojure Language Server
    -- Clojure parser
    {
      "Olical/conjure",
      -- load plugin on filetypes
      ft = { "clojure" },
      init = function()
        vim.g["conjure#log#hud#width"] = 1
        vim.g["conjure#log#hud#enabled"] = false
        vim.g["conjure#log#hud#anchor"] = "SE"
        vim.g["conjure#log#botright"] = true
        vim.g["conjure#extract#context_header_lines"] = 100
        vim.g["conjure#eval#comment_prefix"] = ";; "
        vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
        vim.g["conjure#client#clojure#nrepl#connection#auto_repl#hidden"] = true
        vim.g["conjure#client#clojure#nrepl#connection#auto_repl#cmd"] = nil
        vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false
        vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojure"
        vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = { "deftest", "defflow" }
  
        vim.api.nvim_create_autocmd("BufNewFile", {
          group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
          pattern = { "conjure-log-*" },
          callback = function() vim.diagnostic.disable(0) end,
          desc = "Conjure Log disable LSP diagnostics",
        })
  
        vim.api.nvim_create_autocmd("FileType", {
          group = vim.api.nvim_create_augroup("comment_config", { clear = true }),
          pattern = { "clojure" },
          callback = function() vim.bo.commentstring = ";; %s" end,
          desc = "Lisp style line comment",
        })
      end,
    },
    {"tpope/vim-dispatch"},
    { "clojure-vim/vim-jack-in"},
    {"radenling/vim-dispatch-neovim"},
    {
        "neovim/nvim-lspconfig",
        cmd = "LspInfo",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
        },
    },
    --  {
    --   "tpope/vim-unimpaired",
    --    dependencies = {
    --      {},
    --    },
    --    opts = {},
    --  },
    --  {
    --   "tpope/vim-repeat",
    --    dependencies = {
    --      {},
    --    },
    --    opts = {},
    -- },
    -- {
    --  "guns/vim-sexp",
    --   dependencies = {
    --     {},
    --   },
    --   opts = {},
    -- },
    -- {
    --   "tpope/vim-sexp-mappings-for-regular-people",
    --    dependencies = {
    --      { "guns/vim-sexp" },
    --    },
    --    opts = {},
    --  },
    {"vim-surround"},
    {"tpope/vim-surround"},
    {
      "altermo/ultimate-autopair.nvim",
      event = { "InsertEnter", "CmdlineEnter" },
      branch = "v0.6", --recommended as each new version will have breaking changes
      opts = {
        --Config goes here
      },
    },
    {
      "julienvincent/nvim-paredit",
      config = function()
        require("nvim-paredit").setup {
          filetypes = { "clojure" },
          use_default_keys = true,
          cursor_behaviour = "follow",
        }
      end,
    },
  }