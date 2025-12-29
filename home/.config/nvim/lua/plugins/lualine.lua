local utils = require("utils")

-- FUNCTIONS

local function mode()
    -- Map of modes to their respective shorthand indicators
    local mode_map = {
        n = 'N',      -- Normal mode
        i = 'I',      -- Insert mode
        v = 'V',      -- Visual mode
        [''] = 'V',  -- Visual block mode
        V = 'V',      -- Visual line mode
        c = 'C',      -- Command-line mode
        no = 'N',     -- NInsert mode
        s = 'S',      -- Select mode
        S = 'S',      -- Select line mode
        ic = 'I',     -- Insert mode (completion)
        R = 'R',      -- Replace mode
        Rv = 'R',     -- Virtual Replace mode
        cv = 'C',     -- Command-line mode
        ce = 'C',     -- Ex mode
        r = 'R',      -- Prompt mode
        rm = 'M',     -- More mode
        ['r?'] = '?', -- Confirm mode
        ['!'] = '!',  -- Shell mode
        t = 'T',      -- Terminal mode
    }
    -- Return the mode shorthand or [UNKNOWN] if no match
    return mode_map[vim.fn.mode()] or '[UNKNOWN]'
end

local cwd_relative_path = function()
    local full_path = vim.fn.expand("%:p:h")             -- directory of current file
    local rel_path = vim.fn.fnamemodify(full_path, ":.") -- relative to cwd
    return rel_path ~= "" and rel_path or "."
end

-- COMPONENTS

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

    return "[F: none]"
end

local linter_component = function()
    local ft = vim.bo.filetype
    local linters = require("lint").linters_by_ft[ft] or {}
    if (#linters == 0) then
        return "[L: none]"
    end

    return string.format("[L: %s]", table.concat(linters, " | "))
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
            return "[S: " .. str .. "]"
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
            lualine_a = {
                {
                    mode,
                    padding = { left = 1, right = 1 },
                },
            },
            lualine_b = { branch_component(), diagnostics_component() },
            lualine_c = {
                {
                    auto_format_component,
                    padding = { left = 1 },
                },
                {
                    linter_component,
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
