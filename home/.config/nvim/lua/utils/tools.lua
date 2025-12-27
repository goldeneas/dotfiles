local M = {}

local formatters_by_ft = {}
local linters_by_ft = {}
local ensure_installed = {}

M.get_formatters_by_ft = function()
    return formatters_by_ft
end

M.get_linters_by_ft = function()
    return linters_by_ft
end

M.get_ensure_installed = function()
    return ensure_installed
end

M.add_formatter = function(ft, name)
    formatters_by_ft[ft] = { name }
    M.add_ensure_installed(name)
end

M.add_linter = function(ft, name)
    linters_by_ft[ft] = { name }
    M.add_ensure_installed(name)
end

M.add_ensure_installed = function(name)
    table.insert(ensure_installed, name)
end

return M
