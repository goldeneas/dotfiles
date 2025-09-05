local functions = require("api.functions")
local create_command = function(name, func, opts)
    vim.api.nvim_create_user_command(name, func, opts or {})
end

create_command("OpenHere", function ()
    functions.open_here()
end)

create_command("OpenCwd", function ()
    functions.open_cwd()
end)
