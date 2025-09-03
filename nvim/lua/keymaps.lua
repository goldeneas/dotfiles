local functions = require("api.functions")

local del = vim.keymap.del

local map = function(mode, keys, func, desc, opts)
	local default_opts = { noremap = true, silent = true }
    local options = vim.tbl_extend("force", default_opts, opts or {})
	if desc then options.desc = desc end

	vim.keymap.set(mode, keys, func, options)
end

-- Useful keymaps from nvim
-- <C-è>, Switches between current and previous buffer
-- <C-à>, Moves to the first and last parenthesis in line
-- <C-ò> OR Enter, Opens the quickfix list
-- a, Goes into insert mode but moves the cursor to the right
-- <S-a>, Goes into insert mode to the last character of the line
-- <S-i>, Goes into insert mode to the first character of the line
-- vi", Selects everything within \"\. Also works with parenthesis

-- Better Cut/Delete
map({ "n", "x" }, "x", "d", "Cut")
map("n", "xx", "dd", "Cut Line")
map("n", "X", "D", "Cut to End of Line")
map({ "n", "x" }, "<Del>", '"_x', "Delete to void")
map({ "n", "x" }, "d", '"_d', "Delete to void")
map({ "n", "x" }, "D", '"_D', "Delete to void")
map({ "n", "x" }, "c", '"_c', "Change to void")
map({ "n", "x" }, "C", '"_C', "Change to void")

-- Disables replacing current clipboard after pasting
map("x", "p", '"_dP', "Just Paste")

-- Window
map("n", "<leader>ws", "<cmd>split<cr>", "[S]plit [W]indow Horizontally")
map("n", "<leader>wS", "<cmd>vsplit<cr>", "[S]plit [W]indow Vertically")

-- Window Movement
map("n", "<M-h>", "<cmd>wincmd h<cr>", "Move Cursor to Left Window")
map("n", "<M-j>", "<cmd>wincmd j<cr>", "Move Cursor to Up Window")
map("n", "<M-k>", "<cmd>wincmd k<cr>", "Move Cursor to Down Window")
map("n", "<M-l>", "<cmd>wincmd l<cr>", "Move Cursor to Right Window")

map("n", "<C-j>", "<C-e>", "Scroll down")
map("n", "<C-k>", "<C-y>", "Scroll up")

-- Directories
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", "[F]ind [F]ile")
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", "[F]ind [R]ecent File")
map("n", "<leader>fs", "<cmd>FzfLua live_grep<cr>", "[F]ind [S]tring")
map("n", "-", "<cmd>Oil<cr>", "[F]ind [D]irectory")
map("n", "<F3>", "<cmd>UndotreeToggle<cr>", "Toggle Undotree")

-- LSP/Quickfix
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", "Show Errors Tab")
map("n", "<leader>xl", functions.open_float_rounded, "Show [L]ocal Error")
map("n", "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ctions")
map("n", "K", functions.hover_with_rounded, "Hover Symbol")
map("n", "<leader>xr", "<cmd>FzfLua lsp_references<cr>", "Show [R]eferences")
-- map("n", "<C-k>", functions.goto_next_error, "Goto Next Error")
-- map("n", "<C-j>", functions.goto_prev_error, "Goto Prev Error")

-- Quickfix
map("n", "<F4>", functions.qf_toggle, "Toggle Quickfix")

-- IncRename
map("n", "<leader>r", functions.inc_rename, "[R]ename", { expr = true })

-- Goto
map("n", "f", "<Plug>(leap)", "Leap")
map("n", "gf", "<Plug>(leap-from-window)", "Leap From Window")
map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("n", "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
map({"n", "x"}, "<C-h>", "^", "Goto Line Start")
map({"n", "x"}, "<C-l>", "g_", "Goto Line End")

-- DAP
map("n", "<F5>", "<cmd>DapContinue<cr>", "Dap Continue")
map("n", "<F10>", "<cmd>DapStepOver<cr>", "Dap StepOver")
map("n", "<F11>", "<cmd>DapStepInto<cr>", "Dap StepInto")
map("n", "<leader>b", "<cmd>DapToggleBreakpoint<cr>", "Dap Toggle Breakpoint")

-- Keep current search item at center of window
map("n", "n", "nzzzv", "Search Next")
map("n", "N", "Nzzzv", "Search Previous")

-- Remove highlighting from search
map("n", "<esc>", "<cmd>nohlsearch<cr>", "Remove Search Highlights")

-- Toggleterm
del("n", "<C-W>d")
del("n", "<C-W><C-D>")

map({"n", "t"}, "<C-q>", "<cmd>1ToggleTerm<cr>", "Toggle Terminal 1")
map({"n", "t"}, "<C-w>", "<cmd>2ToggleTerm<cr>", "Toggle Terminal 2")
map({"n", "t"}, "<C-e>", "<cmd>3ToggleTerm<cr>", "Toggle Terminal 1")


-- Sane terminal mode exit
map("t", "<esc>", "<C-\\><C-n>", "Exit Terminal Mode")
