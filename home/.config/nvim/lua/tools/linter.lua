local M = {}

M.list_by_ft = function(ft)
    return require("lint").linters_by_ft[ft] or {}
end

return M
