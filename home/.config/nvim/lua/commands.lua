local utils = require("utils")
local create_command = function(name, func, opts)
    vim.api.nvim_create_user_command(name, func, opts or {})
end

create_command("OpenHere", function ()
    utils.open_here()
end)

create_command("OpenCwd", function ()
    utils.open_cwd()
end)
