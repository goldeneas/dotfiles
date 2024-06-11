local nmap = function(keys, func, desc)
	local options = { noremap = true, silent = true }
	if desc then
		options.desc = desc
	end

	vim.keymap.set("n", keys, func, options)
end


local imap = function(keys, func, desc)
	local options = { noremap = true, silent = true }
	if desc then
		options.desc = desc
	end

	vim.keymap.set("i", keys, func, options)
end

vim.keymap.set("n", "<leader>rn", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "[R]e[n]ame", expr = true })

nmap("<leader>ws", "<cmd>split<cr>", "[S]plit [W]indow Horizontally")
nmap("<leader>wS", "<cmd>vsplit<cr>", "[S]plit [W]indow Vertically")

nmap("<leader>ff", "<cmd>Telescope find_files<cr>", "[F]ind [F]ile")
nmap("<leader>fr", "<cmd>Telescope oldfiles<cr>", "[F]ind [R]ecent File")
nmap("<leader>fs", "<cmd>Telescope live_grep<cr>", "[F]ind [S]tring")
nmap("-", "<cmd>Oil<cr>", "[F]ind [D]irectory")

nmap("<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Show Errors Tab")
nmap("<leader>xl", vim.diagnostic.open_float, "Show Local Error")

nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")

nmap("K", vim.lsp.buf.hover, "Hover Symbol")
nmap("<C-k>", vim.lsp.buf.type_definition, "Check Type Definition")
nmap("<esc>", "<cmd>nohlsearch<cr>", "Remove Search Highlights")

nmap("gw", "<cmd>HopWord<cr>", "[G]oto [W]ord")
nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
nmap("gr", "<cmd>Telescope lsp_references show_line=false<cr>", "[G]oto [R]eferences")
