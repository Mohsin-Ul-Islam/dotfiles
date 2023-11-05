return {
    'lewis6991/gitsigns.nvim',
    opts = {},
    keys = {
        { "<leader>nh", "<cmd>lua require('gitsigns').next_hunk()<CR>" },
        { "<leader>ph", "<cmd>lua require('gitsigns').prev_hunk()<CR>" },
        { "<leader>rh", "<cmd>lua require('gitsigns').reset_hunk()<CR>" },
    },
}
