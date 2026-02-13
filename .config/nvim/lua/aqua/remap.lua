vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true })

vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true })

-- rest.nvim
vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>", { noremap = true, silent = true })

-- yanking
vim.keymap.set({ "v", "n" }, "<leader>y", '"+y', { noremap = true })
vim.keymap.set("n", "<leader>yy", '"+yy', { noremap = true })

-- diagnostics
local next_diagnostic = function()
    vim.diagnostic.jump({ count = 1, float = true })
end

local previous_diagnostic = function()
    vim.diagnostic.jump({ count = -1, float = true })
end

vim.keymap.set("n", "<leader>nd", next_diagnostic, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pd", previous_diagnostic, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float, { noremap = true, silent = true })
