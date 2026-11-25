---@type vim.lsp.Config

return {
    cmd = { "starpls" },
    filetypes = { "bzl" },
    root_markers = {
        "WORKSPACE",
        "WORKSPACE.bazel",
        "MODULE.bazel",
    },
}
