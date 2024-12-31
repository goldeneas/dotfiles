local M = {}

M.toggle_qf = function()
    for _, win in pairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 or win.loclist == 1 then
            vim.cmd("cclose")
        else
            vim.cmd("vertical botright copen 60")
        end
    end
end

return M
