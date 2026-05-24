local M = {}

M.map = function(mode, keys, func, desc, opts)
    local default_opts = { noremap = true, silent = true }
    local options = vim.tbl_extend("force", default_opts, opts or {})
    if desc then options.desc = desc end

    vim.keymap.set(mode, keys, func, options)
end

return M
