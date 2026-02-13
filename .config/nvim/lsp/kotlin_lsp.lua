---@type vim.lsp.Config
return {
    filetypes = { 'kotlin' },
    cmd = { 'kotlin-lsp', '--stdio' },
    root_markers = {
        'settings.gradle',
        'settings.gradle.kts',
        'pom.xml',
        'build.gradle',
        'build.gradle.kts',
        'workspace.json',
    },
    single_file_support = true,
    settings = {
        provideFormatter = false,
    },
}
