local ensure_installed = require("config.ensure_installed")

return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = ensure_installed.linters
    end
}
