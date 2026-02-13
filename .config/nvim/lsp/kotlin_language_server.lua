---@type vim.lsp.Config
return {
    cmd = { 'kotlin-language-server' },
    filetypes = { 'kotlin' },
    root_markers = {
        'settings.gradle',
        'settings.gradle.kts',
        'build.xml',
        'pom.xml',
        'build.gradle',
        'build.gradle.kts',
    },
    settings = {
        formatting = {
            formatter = "ktfmt",
            ktfmt = {
                style = "google",
                indent = 2,
                removeUnusedImports = true
            },
        },
    },
}
