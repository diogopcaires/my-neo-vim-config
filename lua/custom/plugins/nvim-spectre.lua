return 
{ "nvim-pack/nvim-spectre",
dependencies = {
    "nvim-lua/plenary.nvim"
   },
   config = function()
    require('spectre').setup()
    vim.keymap.set('n', '<leader>rt', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre"
    })
    vim.keymap.set('n', '<leader>rw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word"
    })

    vim.keymap.set('n', '<leader>rf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search on current file"
    })
   end
}
