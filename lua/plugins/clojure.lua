return {
  -- Clojure Language Server
  -- Clojure parser
  {
    'Olical/conjure',
    -- load plugin on filetypes
    ft = { 'clojure' },
    init = function()
      vim.g['conjure#log#hud#width'] = 1
      vim.g['conjure#log#hud#enabled'] = false
      vim.g['conjure#log#hud#anchor'] = 'SE'
      vim.g['conjure#log#botright'] = true
      vim.g['conjure#extract#context_header_lines'] = 100
      vim.g['conjure#eval#comment_prefix'] = ';; '
      vim.g['conjure#client#clojure#nrepl#connection#auto_repl#enabled'] = false
      vim.g['conjure#client#clojure#nrepl#connection#auto_repl#hidden'] = true
      vim.g['conjure#client#clojure#nrepl#connection#auto_repl#cmd'] = nil
      vim.g['conjure#client#clojure#nrepl#eval#auto_require'] = false
      vim.g['conjure#client#clojure#nrepl#test#runner'] = 'clojure'
      vim.g['conjure#client#clojure#nrepl#test#current_form_names'] = { 'deftest', 'defflow' }

      vim.api.nvim_create_autocmd('BufNewFile', {
        group = vim.api.nvim_create_augroup('conjure_log_disable_lsp', { clear = true }),
        pattern = { 'conjure-log-*' },
        callback = function()
          vim.diagnostic.disable(0)
        end,
        desc = 'Conjure Log disable LSP diagnostics',
      })

      vim.api.nvim_create_autocmd('FileType', {
        group = vim.api.nvim_create_augroup('comment_config', { clear = true }),
        pattern = { 'clojure' },
        callback = function()
          vim.bo.commentstring = ';; %s'
        end,
        desc = 'Lisp style line comment',
      })
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'clojure', 'typescript', 'javascript', 'json', 'go' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
      
      require('nvim-treesitter.install').compilers = { 'clang' }
      -- Prefer git instead of curl in order to improve connectivity in some environments
      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  { 'tpope/vim-dispatch' },
  { 'clojure-vim/vim-jack-in' },
  { 'radenling/vim-dispatch-neovim' },
  {
    'neovim/nvim-lspconfig',
    cmd = 'LspInfo',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    },
  },
  {
    'm00qek/baleia.nvim',
    version = '*',
    config = function()
      vim.g.baleia = require('baleia').setup {}

      -- Command to colorize the current buffer
      vim.api.nvim_create_user_command('BaleiaColorize', function()
        vim.g.baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })

      -- Command to show logs
      vim.api.nvim_create_user_command('BaleiaLogs', vim.g.baleia.logger.show, { bang = true })
    end,
  },
  {
    "guns/vim-sexp",
    ft = { "clojure" },
    dependencies = {
      "tpope/vim-sexp-mappings-for-regular-people",
    },
  },
}

