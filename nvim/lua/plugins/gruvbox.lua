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

            overrides = {
                ["@lsp.typemod.keyword.async.rust"] = { link = "GruvboxRed" }
            }
        })

        vim.cmd([[colorscheme gruvbox]])
    end,
}
