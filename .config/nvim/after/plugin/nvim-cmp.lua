local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ['<C-j>'] = cmp.mapping(function(callback)
            if cmp.visible() then
                cmp.select_next_item()
            end
        end),
        ['<C-k>'] = cmp.mapping(function(callback)
            if cmp.visible() then
                cmp.select_prev_item()
            end
        end),
    },
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
