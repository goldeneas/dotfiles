local M = {}

-- parameters:
-- opts: table
-- BUF, width, height, col, row
--
-- returns:
-- table containing win and buf for the created float
M.open_float = function(opts)
    opts = opts or {}
    local width = opts.width or math.floor(vim.o.columns * 0.8)
    local height = opts.height or math.floor(vim.o.lines * 0.8)

    -- calculate center position
    local col = opts.col or math.floor((vim.o.columns - width) / 2)
    local row = opts.row or math.floor((vim.o.lines - height) / 2)

    -- create buffer
    local buf = nil
    if vim.api.nvim_buf_is_valid(opts.buf) then
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

M.win_is_qf_or_loc = function(win_id)
    local win_info = vim.fn.getwininfo(win_id)
    local is_qf = win_info[1].quickfix
    local is_loc = win_info[1].loclist

    return is_qf or is_loc
end

return M
