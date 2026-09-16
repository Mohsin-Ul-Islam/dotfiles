return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		branch = "main",
		config = function()
			-- python added: needed explicitly here since `main` has no auto_install equivalent
			local ensure_installed = { "c", "go", "json", "http", "lua", "vim", "vimdoc", "query", "python" }

			require("nvim-treesitter").install(ensure_installed)

			vim.api.nvim_create_autocmd("FileType", {
				pattern = ensure_installed,
				callback = function()
					vim.treesitter.start()
				end,
			})
		end,
	},
}
