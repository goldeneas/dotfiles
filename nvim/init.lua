-- require other config files
require("settings")
require("keymaps")
require("lsp")
require("commands")

-- lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    spec = {
        { import = "plugins", }
    }
})

-- For some reason something is changing these highlight
-- This is required at last to be sure that those get overridden correctly
require("colors")
