return {
    'nvimtools/none-ls.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.formatting.stylua,

                -- setup isort
                null_ls.builtins.formatting.isort.with({
                    extra_args = { "--profile", "black" }
                }),

                -- setup pylint
                null_ls.builtins.diagnostics.pylint.with({
                    env = function(params)
                        return { PYTHONPATH = params.root }
                    end,
                }),
            },
            diagnostics_format = "[#{s}] #{m}",
        })
    end,
}
