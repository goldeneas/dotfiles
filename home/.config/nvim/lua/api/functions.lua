local Terminal = require('toggleterm.terminal').Terminal

local M = {}

M.hover_with_rounded = function()
    vim.lsp.buf.hover({ border = "rounded" })
end

local diagnostic_float = nil
M.toggle_diagnostic_float = function()
    if diagnostic_float and vim.api.nvim_win_is_valid(diagnostic_float) then
        vim.api.nvim_win_close(diagnostic_float, true)
        diagnostic_float = nil
        return
    end

    local _, winid = vim.diagnostic.open_float({
        border = "rounded",
        scope = "line",
    })

    diagnostic_float = winid
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

M.rename = function()
    require("live-rename").rename({ cursorpos=0 })
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

M.goto_window_top = function()
    vim.cmd("normal! H")
end

M.goto_window_bottom = function()
    vim.cmd("normal! L")
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

M.split_three = function()
    vim.cmd("vsplit")
    vim.cmd("split")
end

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

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
M.toggle_lazygit = function()
    lazygit:toggle()
end

return M
