local go_packages_driver_path = nil

if vim.fn.findfile("WORKSPACE", vim.fn.getcwd()) == "" then
    if vim.fn.findfile("WORKSPACE.bazel", vim.fn.getcwd()) == "" then
        go_packages_driver_path = vim.fn.getcwd() .. "/tools/gopackagesdriver.sh"
    end
end

---@type vim.lsp.Config
return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
        gopls = {
            env = {
                GOPACKAGESDRIVER = go_packages_driver_path,
            },
            directoryFilters = {
                "-bazel-bin",
                "-bazel-out",
                "-bazel-testlogs",
                "-bazel-" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
            },
        },
    },
}
