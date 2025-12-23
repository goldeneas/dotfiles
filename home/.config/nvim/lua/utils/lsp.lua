local M = {}

local format_on_save = false
M.toggle_format_on_save = function()
    format_on_save = not format_on_save
end

M.is_format_on_save = function()
    return format_on_save
end

M.hover_with_rounded = function()
    vim.lsp.buf.hover({ border = "rounded" })
end

local diagnostic_float = nil
M.toggle_diagnostic_float = function()
    if diagnostic_float and vim.api.nvim_win_is_valid(diagnostic_float) then
        vim.api.nvim_win_close(diagnostic_float, true)
        diagnostic_float = nil
        return
    end

    local _, winid = vim.diagnostic.open_float({
        border = "rounded",
        scope = "line",
    })

    diagnostic_float = winid
end

M.goto_next_error = function()
    vim.diagnostic.jump({
        count = 1,
        severity = vim.diagnostic.severity.ERROR,
    })
end

M.goto_prev_error = function()
    vim.diagnostic.jump({
        count = -1,
        severity = vim.diagnostic.severity.ERROR,
    })
end

M.rename = function()
    require("live-rename").rename({ cursorpos = 0 })
end

return M
