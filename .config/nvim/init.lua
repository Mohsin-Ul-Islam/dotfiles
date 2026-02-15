require("aqua")

vim.lsp.config("*", {
    on_attach = function(client, bufnr)
        local map = function(keys, func, desc, method)
            if method then
                if client:supports_method(method) then
                    vim.keymap.set(
                        "n",
                        keys,
                        func,
                        { buffer = bufnr, desc = "LSP: " .. desc, noremap = true, silent = true }
                    )
                else
                    vim.keymap.set(
                        "n",
                        keys,
                        func,
                        { buffer = bufnr, desc = "LSP: " .. desc, noremap = true, silent = true }
                    )
                end
            end
        end

        if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
        end

        local methods = vim.lsp.protocol.Methods

        -- buffer
        map("K", vim.lsp.buf.hover, "Hover Documentation", methods.textDocument_hover)
        map("gd", vim.lsp.buf.definition, "Go to Definition", methods.textDocument_definition)
        map("gD", vim.lsp.buf.declaration, "Go to Declaration", methods.textDocument_declaration)
        map("gi", vim.lsp.buf.implementation, "Go to Implementation", methods.textDocument_implementation)
        map("<leader>rs", vim.lsp.buf.rename, "Rename Symbol", methods.textDocument_rename)
        map("<leader>ca", vim.lsp.buf.code_action, "Code Actions", methods.textDocument_codeAction)
    end,
})

vim.lsp.enable({ "gopls", "lua_ls", "clangd", "pyright", "kotlin_lsp", "docker_language_server" })
