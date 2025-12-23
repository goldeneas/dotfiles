local M = {}

local lazygit = nil

M.toggle_lazygit = function()
    if vim.fn.executable("lazygit") ~= 1 then
        vim.notify("Lazygit is not installed!", vim.log.levels.WARN)
        return
    end

    if not lazygit then
        local Terminal = require("toggleterm.terminal").Terminal

        lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            count = 99,
        })
    end

    lazygit:toggle()
end

return M
