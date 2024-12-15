return {
	"gbprod/cutlass.nvim",
    event = "VeryLazy",
	config = function()
		local cutlass = require("cutlass")
		cutlass.setup({
			override_del = true,
            cut_key = "x",
		})
	end
}
