local M = {}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

M.toggle_lazygit = function()
    lazygit:toggle()
end

return M
