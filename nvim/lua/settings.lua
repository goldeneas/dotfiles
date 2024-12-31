vim.g.mapleader = ","

vim.opt.guicursor = {
  'i:block-Cursor/lCursor-blinkwait500-blinkon500-blinkoff500',
}

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smartcase = true

vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

-- Enable highlight group for current line number
vim.opt.cursorline = true

vim.opt.nu = true
-- vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

-- vim.opt.scrolloff = 15

vim.opt.clipboard = "unnamedplus"

vim.opt.background = "dark"
vim.opt.termguicolors = true

-- Disables menus auto selecting first option
-- :h completeopt
vim.opt.completeopt = menu,menuone,noselect

vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
