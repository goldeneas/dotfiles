local f = require("functions")

local map = function(mode, keys, func, desc)
	local options = { noremap = true, silent = true }
	if desc then
		options.desc = desc
	end

	vim.keymap.set(mode, keys, func, options)
end

-- KEYMAPS

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "[R]e[n]ame", expr = true })

map("n", "<leader>ws", "<cmd>split<cr>", "[S]plit [W]indow Horizontally")
map("n", "<leader>wS", "<cmd>vsplit<cr>", "[S]plit [W]indow Vertically")

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "[F]ind [F]ile")
map("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", "[F]ind [R]ecent File")
map("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", "[F]ind [S]tring")
map("n", "-", "<cmd>Oil<cr>", "[F]ind [D]irectory")

map("n", "<esc>", "<cmd>nohlsearch<cr>", "Remove Search Highlights")

map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Show Errors Tab")
map("n", "<leader>xl", vim.diagnostic.open_float, "Show Local Error")

map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")

map("n", "K", vim.lsp.buf.hover, "Hover Symbol")
map("n", "<C-k>", vim.lsp.buf.type_definition, "Check Type Definition")

map("n", "gw", "<cmd>HopWord<cr>", "[G]oto [W]ord")
map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("n", "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
map("n", "gr", "<cmd>Telescope lsp_references show_line=false<cr>", "[G]oto [R]eferences")

map("n", "<F5>", "<cmd>DapContinue<cr>", "Dap Continue")
map("n", "<F10>", "<cmd>DapStepOver<cr>", "Dap StepOver")
map("n", "<F11>", "<cmd>DapStepInto<cr>", "Dap StepInto")
map("n", "<leader>b", "<cmd>DapToggleBreakpoint<cr>", "Dap Toggle Breakpoint")

map("n", "<C-j>", "<cmd>cnext<cr>", "Next Quickfix Entry")
map("n", "<C-k>", "<cmd>cprev<cr>", "Prev Quickfix Entry")
map("n", "<C-h>", f.toggle_qf, "Toggle Quickfix")

-- keep current search item at center of window
map("n", "n", "nzzzv", "Search Next")
map("n", "N", "Nzzzv", "Search Previous")

-- disables replacing current clipboard after pasting
map("x", "p", "\"_dP", "Just Paste")

