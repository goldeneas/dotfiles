return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local whichkey = require("which-key")

		whichkey.register({
			f = {
				name = "File",
				f = { "<cmd>Telescope find_files<cr>", "Find File" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files" },
			},
			w = {
				name = "Window",
				s = { "<cmd>split<cr>", "Split Horizontally" },
				S = { "<cmd>vsplit<cr>", "Split Vertically" }
			},
			c = {
				name = "Code",
				s = { vim.lsp.buf.hover, "Hover" },
				r = { vim.lsp.buf.rename, "Rename" },
				D = { vim.lsp.buf.declaration, "Check Declaration" },
				d = { vim.lsp.buf.definition, "Check Definition" },
				i = { vim.lsp.buf.implementation, "Check Implementations" },
				t = { vim.lsp.buf.type_definition, "Check Type Definition" },
			},
			d = {
				name = "Diagnostics",
				d = { vim.diagnostic.open_float, "Check Local Error" },
				t = { "<cmd>TroubleToggle<cr>", "Toggle Errors Tab" },
				c = { "<cmd>TroubleClose<cr>", "Close Errors Tab" },
			}
		}, { prefix = "<leader>" })
	end
}
