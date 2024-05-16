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
                ["@lsp.typemod.keyword.async.rust"] = { link = "GruvboxRed" },
                ["@lsp.typemod.typeAlias.library.rust"] = { link = "GruvboxYellow" },
                ["@lsp.typemod.namespace.crateRoot.rust"] = { link = "GruvboxAqua" }
            }
        })

        vim.cmd("colorscheme gruvbox")
    end,
}
