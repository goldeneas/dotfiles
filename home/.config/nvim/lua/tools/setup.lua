local helper = require("tools.helper")
local formatter = require("tools.formatter")

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*" },
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if not formatter.is_on_save() then return end
        formatter.format()
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

helper.install_all()
