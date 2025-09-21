local function cwd_relative_path()
  local full_path = vim.fn.expand('%:p:h') -- directory of current file
  local rel_path = vim.fn.fnamemodify(full_path, ':.' ) -- relative to cwd
  return rel_path ~= '' and rel_path or '.'
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
        local lualine = require("lualine")
        lualine.setup({
			theme = "gruvbox",
			sections = {
                lualine_b = { "branch", "diagnostics" },
				lualine_x = {  cwd_relative_path },
                lualine_y = { "" },
                lualine_z = { "" },
			}
		})
	end
}
