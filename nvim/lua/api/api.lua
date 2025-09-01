local M = {}

-- @returns str or nil
M.get_os = function()
    if vim.fn.has("mac") then return "mac" end
    if vim.fn.has("unix") then return "linux" end
    if vim.fn.has("win32") then return "win" end

    return nil
end

M.win_is_qf_or_loc = function(win_id)
    local win_info = vim.fn.getwininfo(win_id)
    local is_qf = win_info[1].quickfix
    local is_loc = win_info[1].loclist

    return is_qf or is_loc
end

return M
