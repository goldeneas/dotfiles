local M = {}

-- @returns "linux" | "win" | "mac"
M.get_os = function()
    -- You were right about the '== 1'.
    -- In Lua, 0 is truthy, so has("win32") returning 0 would count as true without the check.
    if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
        return "win"
    elseif vim.fn.has("mac") == 1 then
        return "mac"
    end
    return "linux"
end

M.open_here = function()
    local dir = vim.fn.expand("%:p:h")
    vim.ui.open(dir)
end

M.open_cwd = function()
    local cwd = vim.uv.cwd()
    if not cwd then return end
    vim.ui.open(cwd)
end

M.save_and_quit = function()
    vim.cmd("wa") -- Write all
    vim.cmd("qa") -- Quit all
end

return M
