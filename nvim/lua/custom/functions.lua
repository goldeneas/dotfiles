local M = {}

M.hover_with_rounded = function()
    vim.lsp.buf.hover({ border = "rounded" })
end

M.open_float_rounded = function()
    vim.diagnostic.open_float({ border = "rounded" })
end

M.goto_next_error = function()
    vim.diagnostic.jump({
        count = 1,
        severity = vim.diagnostic.severity.ERROR,
    })
end

M.goto_prev_error = function()
    vim.diagnostic.jump({
        count = 1,
        severity = vim.diagnostic.severity.ERROR,
    })
end

M.inc_rename = function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end

M.qf_toggle = function()
    for _, win in pairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 or win.loclist == 1 then
            vim.cmd("cclose")
        else
            vim.cmd("vertical botright copen 60")
        end
    end
end

return M
