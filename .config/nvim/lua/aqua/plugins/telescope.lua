return {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    keys = {
        { "<leader>gf", "<cmd>Telescope git_files<CR>" },
        { "<leader>lg", "<cmd>Telescope live_grep<CR>" },
        { "<leader>pf", "<cmd>Telescope find_files<CR>" },
        { "<leader>lr", "<cmd>Telescope lsp_references<CR>" },
    },
}
