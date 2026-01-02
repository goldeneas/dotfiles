local M = {}

local format_on_save = true

M.toggle_on_save = function()
    format_on_save = not format_on_save
end

M.is_on_save = function()
    return format_on_save
end

M.format = function()
    require("conform").format()
end

M.list_for_buffer = function()
    return require("conform").list_formatters_for_buffer()
end

return M
