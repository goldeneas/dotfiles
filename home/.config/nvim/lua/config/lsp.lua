-- make .h classify as c files
vim.filetype.add({
    extension = {
        h = "c",
    }
})

-- pass blink.cmp capabilities
-- NOTE: this might not be needed soon, as blink will be adding this themselves
local base_capabilities = vim.lsp.protocol.make_client_capabilities()
local full_capabilities = require('blink.cmp').get_lsp_capabilities(base_capabilities)
vim.lsp.config("*", {
    capabilities = full_capabilities,
})

-- load LSPs that have been manually integrated with neovim.
-- LSPs installed through mason SHOULDN'T be manually enabled.
vim.lsp.enable("dartls")
