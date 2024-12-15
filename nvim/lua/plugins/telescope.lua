return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
	dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
	config = function()
		local telescope = require("telescope")
		telescope.load_extension("fzf")

		telescope.setup({
			defaults = {
				path_display = { "tail" },
				preview = false,
				layout_strategy = "center",
				layout_config = {
					prompt_position = "bottom"
				}
			}
		})
	end,
}
