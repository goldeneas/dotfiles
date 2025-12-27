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

-- formatters
utils.add_formatter("go", "goimports")
utils.add_formatter("html", "superhtml")

-- linters
utils.add_linter("go", "golangci-lint")

-- ensure_installed
utils.add_ensure_installed("jdtls")
