return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	options = { theme = "gruvbox" },
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			sections = {
				lualine_x = { "filetype" }
			}
		})
	end
}
