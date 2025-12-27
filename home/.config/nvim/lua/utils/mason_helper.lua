local M = {}

local function collect_tools(tool_list, source_table)
    if not source_table then return end

    for _, entry in pairs(source_table) do
        if type(entry) == "string" then
            -- lsp = { "jdtls", ... }
            table.insert(tool_list, entry)
        elseif type(entry) == "table" then
            -- formatters = { python = { "black", "isort" } }
            for _, tool in ipairs(entry) do
                table.insert(tool_list, tool)
            end
        end
    end
end

M.get_all_tools = function(ensure_installed)
    local tools = {}

    collect_tools(tools, ensure_installed.lsp)
    collect_tools(tools, ensure_installed.formatters)
    collect_tools(tools, ensure_installed.linters)
    collect_tools(tools, ensure_installed.dap)

    local seen = {}
    local unique_tools = {}

    for _, tool in ipairs(tools) do
        if not seen[tool] then
            seen[tool] = true
            table.insert(unique_tools, tool)
        end
    end

    return unique_tools
end

M.install_all = function()
    local registry = require("mason-registry")
    local ensure_installed = require("config.ensure_installed")

    local tools = M.get_all_tools(ensure_installed)
    local aliases = ensure_installed.mason_aliases or {}

    -- filter the list to only include packages NOT installed
    local to_install = {}
    for _, tool_name in ipairs(tools) do
        local mason_package_name = aliases[tool_name] or tool_name

        if not registry.is_installed(mason_package_name) then
            table.insert(to_install, mason_package_name)
        end
    end

    if #to_install > 0 then
        local packages_str = table.concat(to_install, " ")
        vim.cmd("MasonInstall " .. packages_str)
    end
end

return M
