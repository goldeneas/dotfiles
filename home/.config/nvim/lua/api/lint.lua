local M = {}

M.list_linters_by_ft = function(ft)
    return require("lint").linters_by_ft[ft] or {}
end

M.lint = function()
    require("lint").try_lint()
end

return M
