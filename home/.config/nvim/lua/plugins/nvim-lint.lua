return {
    "mfussenegger/nvim-lint",
    config = function()
        local lint = require("lint")
        local utils = require("utils")

        lint.linters_by_ft = utils.get_linters_by_ft()
    end
}
