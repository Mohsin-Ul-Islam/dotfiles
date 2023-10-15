return {
    'ThePrimeagen/harpoon',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    keys = {
        { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>" },
        { "<C-e>",     "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>" },
    },
}
