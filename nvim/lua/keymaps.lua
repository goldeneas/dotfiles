local map = function(keys, func, desc)
	local options = { noremap = true, silent = true }
	if desc then
		options.desc = desc
	end

	vim.keymap.set("n", keys, func, options)
end

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "[R]e[n]ame", expr = true })

map("<leader>ws", "<cmd>split<cr>", "[S]plit [W]indow Horizontally")
map("<leader>wS", "<cmd>vsplit<cr>", "[S]plit [W]indow Vertically")

map("<leader>ff", "<cmd>Telescope find_files<cr>", "[F]ind [F]ile")
map("<leader>fr", "<cmd>Telescope oldfiles<cr>", "[F]ind [R]ecent File")
map("<leader>fs", "<cmd>Telescope live_grep<cr>", "[F]ind [S]tring")
map("-", "<cmd>Oil<cr>", "[F]ind [D]irectory")

map("<leader>xx", "<cmd>TroubleToggle<cr>", "Show Errors Tab")
map("<leader>xl", vim.diagnostic.open_float, "Show Local Error")

map("<leader>xl", vim.diagnostic.open_float, "Show Local Error")

map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")

map("K", vim.lsp.buf.hover, "Hover Documentation")
map("<esc>", "<cmd>nohlsearch<cr>", "Remove Search Highlights")

map("gw", "<cmd>HopWord<cr>", "[G]oto [W]ord")
map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
map("gr", "<cmd>Telescope lsp_references show_line=false<cr>", "[G]oto [R]eferences")
