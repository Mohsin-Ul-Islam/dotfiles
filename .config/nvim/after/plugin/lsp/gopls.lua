local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local is_bazel_project = true

if vim.fn.findfile('WORKSPACE', vim.fn.getcwd()) == "" then
    if vim.fn.findfile('WORKSPACE.bazel', vim.fn.getcwd()) == "" then
        is_bazel_project = false
    end
end

local opts = {}
if is_bazel_project then
    opts = {
        settings = {
            gopls = {
                env = {
                    GOPACKAGESDRIVER = './tools/gopackagesdriver.sh'
                },
                directoryFilters = {
                    "-bazel-bin",
                    "-bazel-out",
                    "-bazel-testlogs",
                    "-bazel-" .. workspace_dir,
                },
            },
        }
    }
end

require('lspconfig').gopls.setup(opts)
