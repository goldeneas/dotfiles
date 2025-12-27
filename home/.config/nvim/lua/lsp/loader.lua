local config_dir = vim.fn.stdpath("config") .. "/lua/lsp/ft"

for name, type in vim.fs.dir(config_dir) do
    if type ~= "file" then goto continue end

    local path = config_dir .. "/" .. name
    local result = dofile(path)

    local lsp_name = result.name
    local config = result.config

    vim.lsp.config(lsp_name, config)

    ::continue::
end
