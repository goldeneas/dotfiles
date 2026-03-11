local config_dir = vim.fn.stdpath("config") .. "/lua/lsp/ft"

for name, type in vim.fs.dir(config_dir) do
    if type ~= "file" then goto continue end

    -- match the file type from the file's name
    local ft = name:match("(.+)%.lua$")
    if not ft then goto continue end

    vim.api.nvim_create_autocmd("FileType", {
        pattern = ft,
        callback = function()
            local path = config_dir .. "/" .. name
            local result = dofile(path)

            local lsp_name = result.name
            local config = result.config

            vim.lsp.config(lsp_name, config)
        end,
        once = true
    })

    ::continue::
end
