local M = {}

local modules = {
    require("utils.core"),
    require("utils.lsp"),
    require("utils.ui"),
    require("utils.system"),
    require("utils.git"),
    require("utils.tool_helper"),
}

-- merge in a single M module
for _, module in ipairs(modules) do
    for k, v in pairs(module) do
        M[k] = v
    end
end

return M
