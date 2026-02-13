vim.opt.nu = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.winborder = "rounded"

vim.opt.completeopt = vim.opt.completeopt + "noselect"

vim.diagnostic.config({ virtual_text = false })
