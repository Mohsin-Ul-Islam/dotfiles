return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		local helpers = require("null-ls.helpers")

		local ktfmt = {
			name = "ktfmt",
			method = null_ls.methods.FORMATTING,
			filetypes = { "kotlin" },
			generator = helpers.formatter_factory({
				command = "ktfmt",
				args = { "--google-style", "$FILENAME" },
				ignore_stdout = true,
				to_stdin = false,
				to_temp_file = true,
				from_temp_file = true,
			}),
		}

		null_ls.setup({
			sources = {
				ktfmt,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.black,
				null_ls.builtins.diagnostics.mypy,
				null_ls.builtins.formatting.stylua,

				-- setup isort
				null_ls.builtins.formatting.isort.with({
					extra_args = { "--profile", "black" },
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
