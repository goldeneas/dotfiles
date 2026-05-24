-- make .h classify as c files
vim.filetype.add({
    extension = {
        h = "c",
    }
})

-- load LSPs that have been manually integrated with neovim.
-- LSPs installed through mason SHOULDN'T be manually enabled.
vim.lsp.enable("dartls")
