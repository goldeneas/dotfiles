return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
        local lualine = require("lualine")
        lualine.setup({
			theme = "gruvbox",
			sections = {
				lualine_x = { "" },
                lualine_y = { "filetype" },
                lualine_z = { "" },
			}
		})
	end
}
