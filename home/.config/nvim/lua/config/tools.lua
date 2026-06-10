local api = require("api")

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if not api.is_format_on_save() then return end
        api.format()
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        api.lint()
    end,
})

api.install_tools()
