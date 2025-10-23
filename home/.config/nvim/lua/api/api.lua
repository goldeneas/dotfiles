local M = {}

-- @returns str or nil
M.get_os = function()
    local os = "linux"

    -- for some reason removing the '== 1' makes the condition always true
    if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
        os = "win"
    elseif vim.fn.has("mac") == 1 then
        os = "mac"
    elseif vim.fn.has("linux") == 1 then
        os = "linux"
    end

    return os
end

M.win_is_qf_or_loc = function(win_id)
    local win_info = vim.fn.getwininfo(win_id)
    local is_qf = win_info[1].quickfix
    local is_loc = win_info[1].loclist

    return is_qf or is_loc
end

M.map = function(mode, keys, func, desc, opts)
	local default_opts = { noremap = true, silent = true }
    local options = vim.tbl_extend("force", default_opts, opts or {})
	if desc then options.desc = desc end

	vim.keymap.set(mode, keys, func, options)
end

return M
