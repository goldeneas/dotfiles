local cwd_relative_path = function()
  local full_path = vim.fn.expand('%:p:h') -- directory of current file
  local rel_path = vim.fn.fnamemodify(full_path, ':.' ) -- relative to cwd
  return rel_path ~= '' and rel_path or '.'
end

local filename_component = function()
    return {
        "filename",
        padding = { left = 1, right = 0 },
    }
end

local lsp_status_component = function()
    return {
        "lsp_status",
        icon = "",
        symbols = {
            done = "",
            spinner = { "!" },
            separator = " | "
        },
        show_name = true,
        padding = { left = 0, right = 1 },
        fmt = function(str)
            if str == "" then return "" end
            return "[" .. str .. "]"
        end
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
    'nvim-lualine/lualine.nvim',
    opts = {
        options ={
            component_separators = "",
            section_separators = "",
        },
        sections = {
            lualine_b = { branch_component(), "diagnostics" },
            lualine_c = { filename_component(), lsp_status_component()},
            lualine_x = {  cwd_relative_path },
            lualine_y = { "" },
            lualine_z = { "" },
        }
    }
}
