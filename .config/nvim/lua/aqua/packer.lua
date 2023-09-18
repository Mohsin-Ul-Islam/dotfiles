-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use 'f-person/git-blame.nvim'
    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-jdtls'
    -- use { 'sourcegraph/sg.nvim', requires = { { 'nvim-lua/plenary.nvim' } }, run = 'nvim -l build/init.lua' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- Color schemes
    use 'navarasu/onedark.nvim'
    use { "ellisonleao/gruvbox.nvim" }

    use 'ThePrimeagen/harpoon'
    use { 'nvim-treesitter/nvim-treesitter', run = { ':TSUpdate' } }
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
end)
