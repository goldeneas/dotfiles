return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		local whichkey = require("which-key")
		local harpoon = require("harpoon")

		whichkey.register({
			f = {
				name = "File",
				f = { "<cmd>Telescope frecency<cr>", "Find File" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent Files" },
				d = { "<cmd>Telescope file_browser<cr>", "Open File Browser" },
			},
			d = {
				name = "Directory",
				d = { "<cmd>Dirbuf<cr>", "Open Dirbuf" },
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
				u = { "<cmd>Telescope lsp_references show_line=false<cr>", "Check Usages" },
			},
			s = {
				name = "Switch Tabs",
				s = { function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "Tab List" },
				a = { function() harpoon:list():append() end, "Append Tab" },
			},
			x =  {
				x = { "<cmd>TroubleToggle<cr>", "Toggle Errors Tab" },
				l = { vim.diagnostic.open_float, "Check Local Error" },
				q = { "<cmd>Trouble quickfix<cr>", "Toggle Quickfix Tab" },
			},
			z = { "<cmd>HopWord<cr>", "Hop Word" },
		}, { prefix = "<leader>" })
	end
}
