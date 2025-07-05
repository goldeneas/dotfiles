local M = {}

M.hover_with_rounded = function()
    vim.lsp.buf.hover({ border = "rounded" })
end

M.open_float_rounded = function()
    vim.diagnostic.open_float({ border = "rounded" })
end

return M
