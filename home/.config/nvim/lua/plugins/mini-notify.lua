-- show in bottom right corner
local win_config = function()
    local has_statusline = vim.o.laststatus > 0
    local pad = vim.o.cmdheight + (has_statusline and 1 or 0)
    return {
        anchor = 'SE',
        col = vim.o.columns,
        row = vim.o.lines - pad,
        border = "none",
    }
end

return {
    "nvim-mini/mini.notify",
    version = false,
    opts = {
        window = {
            config = win_config(),
            winblend = 80,
        },

        content = {
            format = function(n)
                local target = n.msg

                local data = n.data
                if data.client_name and data.response.value.title then
                    target = data.client_name .. ": " .. data.response.value.title
                end

                return string.lower(target)
            end,
        },
    }
}
