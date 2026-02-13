vim.api.nvim_create_augroup("LspOnAttach", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
    group = "LspOnAttach",
    callback = function(evt)
        local bufnr = evt.buf
        local client = assert(vim.lsp.get_client_by_id(evt.data.client_id))

        if
            not client:supports_method("textDocument/willSaveWaitUntil")
            and client:supports_method("textDocument/format")
        then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = "LspOnAttach",
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, id = client.id, async = false, timeout_ms = 2000 })
                end,
            })
        end
    end,
})
