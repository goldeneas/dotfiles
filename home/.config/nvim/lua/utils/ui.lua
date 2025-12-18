local oil = require("oil")
local neoscroll = require("neoscroll")

local M = {}

M.scroll_up = function()
    neoscroll.scroll(-10, { move_cursor = true, duration = 50 })
end

M.scroll_down = function()
    neoscroll.scroll(10, { move_cursor = true, duration = 50 })
end

M.win_is_qf_or_loc = function(win_id)
    local win_info = vim.fn.getwininfo(win_id)[1]
    if not win_info then return false end

    return win_info.quickfix == 1 or win_info.loclist == 1
end

M.qf_toggle = function()
    local qf_exists = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win.quickfix == 1 then
            qf_exists = true
            break -- Found one, no need to keep checking
        end
    end

    if qf_exists then
        vim.cmd("cclose")
    else
        vim.cmd("vertical botright copen 60")
    end
end

M.goto_window_top = function()
    vim.cmd("normal! H")
end

M.goto_window_bottom = function()
    vim.cmd("normal! L")
end

M.split_three = function()
    vim.cmd("vsplit")
    vim.cmd("split")
end

-- opts: table { buf, width, height, col, row }
M.open_float = function(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    local col = opts.col or math.floor((vim.o.columns - width) / 2)
    local row = opts.row or math.floor((vim.o.lines - height) / 2)

    local buf = nil
    -- Fixed check to prevent nil error
    if opts.buf and vim.api.nvim_buf_is_valid(opts.buf) then
        buf = opts.buf
    else
        buf = vim.api.nvim_create_buf(false, true)
    end

    local win_config = {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    }

    local win = vim.api.nvim_open_win(buf, true, win_config)

    return { win = win, buf = buf }
end

M.toggle_oil = function()
    oil.open_float()
end

return M
