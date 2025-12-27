local utils = require("utils")

local install_required = function()
    local registry = require("mason-registry")
    local ensure_installed = utils.get_ensure_installed()

    -- filter the list to only include packages NOT installed
    local to_install = {}
    for _, pkg_name in ipairs(ensure_installed) do
        if not registry.is_installed(pkg_name) then
            table.insert(to_install, pkg_name)
        end
    end

    if #to_install > 0 then
        local packages_str = table.concat(to_install, " ")
        vim.cmd("MasonInstall " .. packages_str)
    end
end

install_required()
