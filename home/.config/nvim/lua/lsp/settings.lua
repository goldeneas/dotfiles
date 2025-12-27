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
