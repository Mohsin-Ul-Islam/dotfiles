return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")
		local helpers = require("null-ls.helpers")

		-- project-local tool directories, searched from the file upwards to the repo root
		local local_bins = { ".venv/bin", "venv/bin", ".tox/bin", "node_modules/.bin" }

		-- resolves a command to a project-local binary, then to $PATH, else nil
		local function resolve(cmd, bufname)
			if cmd and bufname ~= "" then
				for dir in vim.fs.parents(bufname) do
					for _, bin in ipairs(local_bins) do
						local candidate = table.concat({ dir, bin, cmd }, "/")
						if vim.fn.executable(candidate) == 1 then
							return candidate
						end
					end

					if vim.uv.fs_stat(dir .. "/.git") then
						break
					end
				end
			end

			if cmd and vim.fn.executable(cmd) == 1 then
				return cmd
			end

			return nil
		end

		-- opts that skip a source (instead of erroring) when its command is missing here
		local function if_available(cmd)
			return {
				runtime_condition = helpers.cache.by_bufnr(function(params)
					return resolve(cmd, params.bufname) ~= nil
				end),
				dynamic_command = function(params, done)
					done(resolve(params.command, params.bufname))
				end,
			}
		end

		local ktfmt = {
			name = "ktfmt",
			method = null_ls.methods.FORMATTING,
			filetypes = { "kotlin" },
			generator = helpers.formatter_factory(vim.tbl_extend("error", {
				command = "ktfmt",
				args = { "--google-style", "$FILENAME" },
				ignore_stdout = true,
				to_stdin = false,
				to_temp_file = true,
				from_temp_file = true,
			}, if_available("ktfmt"))),
		}

		null_ls.setup({
			sources = {
				ktfmt,
				null_ls.builtins.formatting.black.with(if_available("black")),
				null_ls.builtins.diagnostics.mypy.with(if_available("mypy")),
				null_ls.builtins.formatting.stylua.with(if_available("stylua")),
				null_ls.builtins.formatting.clang_format.with(if_available("clang-format")),

				-- setup isort
				null_ls.builtins.formatting.isort.with(vim.tbl_extend("error", {
					extra_args = { "--profile", "black" },
				}, if_available("isort"))),

				-- setup pylint
				null_ls.builtins.diagnostics.pylint.with(vim.tbl_extend("error", {
					env = function(params)
						return { PYTHONPATH = params.root }
					end,
				}, if_available("pylint"))),
			},
			diagnostics_format = "[#{s}] #{m}",
		})
	end,
}
