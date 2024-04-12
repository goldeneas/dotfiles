return {
	'ellisonleao/gruvbox.nvim',
    config = function()
        local gruvbox = require("gruvbox")
        gruvbox.setup({
    		italic = {
    			strings = false,
    			emphasis = false,
    			comments = false,
    			operators = false,
    			folds = false,
    		},
        })

        vim.cmd([[colorscheme gruvbox]])
    end,
}
