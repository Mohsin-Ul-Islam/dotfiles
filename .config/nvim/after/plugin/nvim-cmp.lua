local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
    }
})

local autocomplete_group = vim.api.nvim_create_augroup("vimrc_autocompletion", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "mysql", "plsql" },
    callback = function()
        cmp.setup.buffer({
            sources = {
                { name = "vim-dadbod-completion" },
                { name = "buffer" },
                { name = "luasnip" },
            },
        })
    end,
    group = autocomplete_group,
})
