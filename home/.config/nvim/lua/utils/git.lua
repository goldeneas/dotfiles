local M = {}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    count = 99,
})

M.toggle_lazygit = function()
    if not vim.fn.executable("lazygit") == 1 then
        vim.notify("Lazygit is not installed!", vim.log.levels.WARN)
        return
    end

    lazygit:toggle()
end

return M
