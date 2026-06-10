local M = {}

local modules = {
    require("api.core"),
    require("api.lsp"),
    require("api.ui"),
    require("api.system"),
    require("api.format"),
    require("api.lint"),
    require("api.tools"),
}

-- merge in a single M module
for _, module in ipairs(modules) do
    for k, v in pairs(module) do
        M[k] = v
    end
end

return M
