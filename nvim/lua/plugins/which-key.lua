return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local wk = require("which-key")

		wk.register({
			["g"] = { name = "+goto" },
			["<leader>w"] = { name = "+window" },
			["<leader>f"] = { name = "+find" },
			["<leader>x"] = { name = "+diagnostics" },
		})
	end
}
