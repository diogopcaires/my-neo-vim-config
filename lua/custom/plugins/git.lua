return {
    {
        'ruifm/gitlinker.nvim',
        dependencies = {
          "nvim-lua/plenary.nvim",
          --"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        config = function()
            require("gitlinker").setup()
            vim.keymap.set('n', '<leader>glp', '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true, desc = "open permalink url"})
            vim.keymap.set('n', '<leader>glr', '<cmd>lua require"gitlinker".get_repo_url({action_callback = require"gitlinker.actions".open_in_browser})<cr>', {silent = true, desc = "open repo url"})
        end,
    },
}