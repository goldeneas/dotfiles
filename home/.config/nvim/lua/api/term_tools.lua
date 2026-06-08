local system = require("api.system")
local Terminal = require("toggleterm.terminal").Terminal

local M = {}

local term_count = 99
local spawned_terms = {}

local check_command = function(cmd)
    if not system.has_cmd(cmd) then
        vim.notify(cmd .. " is not installed!", vim.log.levels.WARN)
        return false
    end

    return true
end

local spawn_tool_if_nil = function(cmd)
    local term = spawned_terms[cmd]
    if term then
        return
    end

    spawned_terms[cmd] = Terminal:new({
        cmd = cmd,
        hidden = true,
        count = term_count,
    })

    term_count = term_count - 1
end

M.toggle_term_tool = function(cmd)
    if not check_command(cmd) then
        return
    end

    spawn_tool_if_nil(cmd)

    local term = spawned_terms[cmd]
    term:toggle()
end

M.toggle_lazygit = function()
    M.toggle_term_tool("lazygit")
end

M.toggle_lazysql = function()
    M.toggle_term_tool("lazysql")
end

M.toggle_posting = function()
    M.toggle_term_tool("posting")
end

return M
