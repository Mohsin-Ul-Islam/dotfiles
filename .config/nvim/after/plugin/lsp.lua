local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(_, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)


require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').gopls.setup({
    settings = {
        gopls = {
            env = {
                GOPACKAGESDRIVER = './tools/gopackagesdriver.sh'
            },
            directoryFilters = {
                "-bazel-bin",
                "-bazel-out",
                "-bazel-testlogs",
                "-bazel-cigar",
            },
        },
    },
})

lsp.setup()

local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
    }
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
