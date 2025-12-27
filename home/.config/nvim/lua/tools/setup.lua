local utils = require("utils")

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        if not utils.is_format_on_save() then return end
        utils.format()
    end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
    callback = function()
        require("lint").try_lint()
    end,
})

utils.install_all()
