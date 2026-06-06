-- make .h classify as c files
vim.filetype.add({
    extension = {
        h = "c",
    }
})

-- pass capabilities
-- NOTE: this might not be needed soon, as blink will be adding this themselves
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
capabilities = vim.tbl_extend("force", capabilities, {
    -- disable snippet support
    textDocument = { completion = { completionItem = { snippetSupport = false } } },
})

vim.lsp.config("*", {
    capabilities = capabilities,
})

-- load LSPs that have been manually integrated with neovim.
-- LSPs installed through mason SHOULDN'T be manually enabled.
vim.lsp.enable("dartls")
