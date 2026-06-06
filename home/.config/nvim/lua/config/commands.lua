local api = require("api")
local formatter = require("tools.formatter")

local create_command = function(name, func, opts)
    vim.api.nvim_create_user_command(name, func, opts or {})
end

create_command("OpenHere", function()
    api.open_here()
end)

create_command("OpenCwd", function()
    api.open_cwd()
end)

create_command("ToggleFormatOnSave", function()
    formatter.toggle_on_save()
end)
