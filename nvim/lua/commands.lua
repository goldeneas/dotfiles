local create_command = function(name, func, opts)
    vim.api.nvim_create_user_command(name, func, opts or { nargs = "*" })
end

local open_picker = function(picker, split)
    if picker == nil then picker = "files" end
    if split == nil then split = "split" end

    -- Checks if current buffer is a valid buffer.
    -- This is used so that if the current buffer is not "valid"
    -- we wont create an useless split and instead reuse the current window
    local is_buf_listed = vim.fn.buflisted(0) == 1

    if is_buf_listed then
        vim.cmd(string.format("botright %s", split))
    end

    vim.cmd(string.format("FzfLua %s", picker))
end

create_command("OpenPicker", function(opts) open_picker(unpack(opts.fargs)) end)
create_command("OpenFiles", ":OpenPicker files split")
create_command("VOpenFiles", ":OpenPicker files vsplit")
create_command("OpenOldfiles", ":OpenPicker oldfiles split")
create_command("VOpenOldfiles", ":OpenPicker oldfiles vsplit")
