local map = function(mode, keys, func, desc)
	local options = { noremap = true, silent = true }
	if desc then
		options.desc = desc
	end

	vim.keymap.set(mode, keys, func, options)
end

-- Useful keymaps from nvim
-- <C-è>, Switches between current and previous buffer
-- <C-à>, Moves to the first and last parenthesis in line
-- <C-ò>, Toggles the quickfix list
-- a, Goes into insert mode but moves the cursor to the right
-- <S-a>, Goes into insert mode to the last character of the line
-- <S-i>, Goes into insert mode to the first character of the line
-- vi", Selects everything within \"\. Also works with parenthesis

-- IncRename
-- TODO: Change this maybe
vim.keymap.set("n", "<leader>r", function()
  return ":IncRename " .. vim.fn.expand("<cword>")
end, { desc = "[R]ename", expr = true })

-- Window
map("n", "<leader>ws", "<cmd>split<cr>", "[S]plit [W]indow Horizontally")
map("n", "<leader>wS", "<cmd>vsplit<cr>", "[S]plit [W]indow Vertically")

-- Directories
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", "[F]ind [F]ile")
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", "[F]ind [R]ecent File")
map("n", "<leader>fs", "<cmd>FzfLua grep_project<cr>", "[F]ind [S]tring")
map("n", "-", "<cmd>Oil<cr>", "[F]ind [D]irectory")
map("n", "<F3>", "<cmd>UndotreeToggle<cr>", "Toggle Undotree")

-- LSP/Code
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(_)
        map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Show Errors Tab")
        map("n", "<leader>xl", vim.diagnostic.open_float, "Show [L]ocal Error")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")
        map("n", "K", vim.lsp.buf.hover, "Hover Symbol")
        map("n", "ò", vim.diagnostic.goto_next, "Goto Next Error")
        map("n", "à", vim.diagnostic.goto_prev, "Goto Prev Error")
        map("n", "<leader>xr", vim.lsp.buf.references, "Show [R]eferences")
    end,
})

-- Goto
map("n", "f", "<Plug>(leap)", "Leap")
map("n", "gf", "<Plug>(leap-from-window)", "Leap From Window")
map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("n", "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
map("n", "gr", "<cmd>FzfLua lsp_references<cr>", "[G]oto [R]eferences")
map({"n", "x"}, "<C-h>", "^", "Goto Line Start")
map({"n", "x"}, "<C-l>", "g_", "Goto Line End")

-- DAP
map("n", "<F5>", "<cmd>DapContinue<cr>", "Dap Continue")
map("n", "<F10>", "<cmd>DapStepOver<cr>", "Dap StepOver")
map("n", "<F11>", "<cmd>DapStepInto<cr>", "Dap StepInto")
map("n", "<leader>b", "<cmd>DapToggleBreakpoint<cr>", "Dap Toggle Breakpoint")

-- Quickfix
map("n", "<C-j>", "<cmd>cnext<cr>", "Next Quickfix Entry")
map("n", "<C-k>", "<cmd>cprev<cr>", "Prev Quickfix Entry")

-- Keep current search item at center of window
map("n", "n", "nzzzv", "Search Next")
map("n", "N", "Nzzzv", "Search Previous")

-- Disables replacing current clipboard after pasting
map("x", "p", "\"_dP", "Just Paste")

-- Remove highlighting from search
map("n", "<esc>", "<cmd>nohlsearch<cr>", "Remove Search Highlights")
