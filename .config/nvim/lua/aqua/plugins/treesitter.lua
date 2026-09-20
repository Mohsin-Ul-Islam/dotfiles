return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		config = function()
			-- python added: needed explicitly here since `main` has no auto_install equivalent
			local ensure_installed =
				{ "c", "go", "json", "http", "lua", "vim", "vimdoc", "query", "python", "markdown" }

			require("nvim-treesitter").install(ensure_installed)

			local group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				group = group,
				pattern = ensure_installed,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
