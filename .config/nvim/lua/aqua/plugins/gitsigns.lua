return {
	"lewis6991/gitsigns.nvim",
	opts = {
		worktrees = {
			{
				toplevel = vim.env.HOME,
				gitdir = vim.env.HOME .. "/.dotfiles",
			},
		},
	},
	keys = {
		{ "<leader>nh", "<cmd>lua require('gitsigns').next_hunk()<CR>" },
		{ "<leader>ph", "<cmd>lua require('gitsigns').prev_hunk()<CR>" },
		{ "<leader>rh", "<cmd>lua require('gitsigns').reset_hunk()<CR>" },
	},
}
