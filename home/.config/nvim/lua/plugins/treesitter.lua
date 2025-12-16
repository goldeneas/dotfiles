return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local ts = require("nvim-treesitter")
        ts.install({
            "rust", "c", "python", "html", "javascript", "css",
            "zig", "markdown", "java",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "*" },
            callback = function()
                pcall(vim.treesitter.start)
            end,
        })
    end
}
