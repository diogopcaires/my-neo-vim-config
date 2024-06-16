return {
    {
      'akinsho/toggleterm.nvim',
      config = function()
        require("toggleterm").setup()
        vim.keymap.set("n", "<leader>tf",'<cmd>:ToggleTerm direction=float name=float<CR>')
      end
    }
}