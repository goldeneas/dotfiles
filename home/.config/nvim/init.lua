require("settings")

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

require("keymaps")
require("commands")
require("filetype")

require("lsp.settings")
require("lsp.loader")

-- for some reason something is changing these highlight
-- this is required at last to be sure that those get overridden correctly
require("colors")
