return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    keys = {
        { "<leader>gf", "<cmd>Telescope git_files<CR>" },
        { "<leader>lg", "<cmd>Telescope live_grep<CR>" },
        { "<leader>pf", "<cmd>Telescope find_files<CR>" },
        { "<leader>lr", "<cmd>Telescope lsp_references<CR>" },
        { "<leader>li", "<cmd>Telescope lsp_implementations<CR>" },
    },
}
