local utils = require("utils")
local blink = require("blink.cmp")

-- remove code autocomplete for arguments (and snippets)
vim.lsp.config("*", {
    capabilities = blink.get_lsp_capabilities({
        textDocument = {
            completion = {
                completionItem = {
                    snippetSupport = false
                }
            }
        },
    })
});

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if not utils.is_format_on_save() then return end
        utils.format()
    end,
})
