local blink = require("blink.cmp")

-- Rust
vim.cmd("hi! link @lsp.typemod.typeAlias.library.rust Yellow")
vim.cmd("hi! link @lsp.type.namespace.rust Orange")
vim.cmd("hi! link @module.rust Orange")

-- C
vim.cmd("hi! link @keyword.type.c Orange")

-- signature curr parameter highlight
vim.cmd("hi! LspSignatureActiveParameter gui=bold,nocombine guifg=#282828 guibg=#fabd2f")

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

-- make .h classify as c files
vim.filetype.add({
    extension = {
        h = "c",
    }
})
