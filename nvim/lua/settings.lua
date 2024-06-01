vim.g.mapleader = ","

vim.opt.guicursor = "i:block"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.clipboard = "unnamedplus"

vim.opt.background = "dark"
vim.opt.termguicolors = true

-- Disables menus auto selecting first option
-- :h completeopt
vim.opt.completeopt = menu,menuone,noselect
