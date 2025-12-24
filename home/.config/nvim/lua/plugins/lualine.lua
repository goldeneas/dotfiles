local utils = require("utils")

local cwd_relative_path = function()
    local full_path = vim.fn.expand("%:p:h")             -- directory of current file
    local rel_path = vim.fn.fnamemodify(full_path, ":.") -- relative to cwd
    return rel_path ~= "" and rel_path or "."
end

local diagnostics_component = function()
    return {
        "diagnostics",
        symbols = { error = "E", warn = "W", info = "I", hint = "H" },
    }
end

local auto_format_component = function()
    local is_enabled = utils.is_format_on_save()
    if not is_enabled then return "" end

    local formatters = require("conform").list_formatters_for_buffer()
    if not (#formatters == 0) then
        return string.format("[F: %s]", table.concat(formatters, " | "))
    end

    local is_lsp_attached = #vim.lsp.get_clients({ bufnr = 0 }) > 0
    if is_lsp_attached then
        return "[F: lsp]"
    end

    return "[F]"
end

local filename_component = function()
    return {
        "filename",
        padding = { left = 1, right = 1 },
    }
end

local lsp_status_component = function()
    return {
        "lsp_status",
        icon = "",
        symbols = {
            done = "",
            spinner = { "!" },
            separator = " | ",
        },
        show_name = true,
        padding = { left = 0, right = 1 },
        fmt = function(str)
            if str == "" then
                return ""
            end
            return "[" .. str .. "]"
        end,
    }
end

local branch_component = function()
    return {
        "branch",
        icon = "",
        padding = { left = 0, right = 2 },
    }
end

return {
    "nvim-lualine/lualine.nvim",
    opts = {
        options = {
            component_separators = "",
            section_separators = "",
        },
        sections = {
            lualine_b = { branch_component(), diagnostics_component() },
            lualine_c = {
                {
                    auto_format_component,
                    padding = { left = 1 },
                },
                lsp_status_component(),
            },
            lualine_x = { cwd_relative_path },
            lualine_y = { filename_component() },
            lualine_z = { "" },
        },
    },
}
