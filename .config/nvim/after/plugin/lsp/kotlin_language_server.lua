vim.lsp.config('kotlin_language_server', {
    settings = {
        formatting = {
            formatter = "ktfmt",
            ktfmt = {
                style = "google",
                removeUnusedImports = true
            },
        },
    },
})
