local utils = require("utils")

local del = vim.keymap.del
local map = utils.map

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
map("n", "<leader>s", "<cmd>split<cr>", "[S]plit [W]indow Horizontally")
map("n", "<leader>S", "<cmd>vsplit<cr>", "[S]plit [W]indow Vertically")
map("n", "<leader>3", utils.split_three, "Split Window in [3]")

map({"n", "t"}, "<M-Up>", "<cmd>resize -2<CR>")
map({"n", "t"}, "<M-Down>", "<cmd>resize +2<CR>")
map({"n", "t"}, "<M-Left>", "<cmd>vertical resize -2<CR>")
map({"n", "t"}, "<M-Right>", "<cmd>vertical resize +2<CR>")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor Movement
map("n", "<M-h>", "<cmd>wincmd h<cr>", "Move Cursor to Left Window")
map("n", "<M-j>", "<cmd>wincmd j<cr>", "Move Cursor to Up Window")
map("n", "<M-k>", "<cmd>wincmd k<cr>", "Move Cursor to Down Window")
map("n", "<M-l>", "<cmd>wincmd l<cr>", "Move Cursor to Right Window")

map("n", "<C-j>", "5<C-e>", "Scroll down")
map("n", "<C-k>", "5<C-y>", "Scroll up")

-- Directories
map("n", "<leader>ff", "<cmd>FzfLua files<cr>", "[F]ind [F]ile")
map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", "[F]ind [R]ecent File")
map("n", "<leader>fs", "<cmd>FzfLua live_grep<cr>", "[F]ind [S]tring")
map("n", "<leader>fg", "<cmd>FzfLua builtin<cr>", "[F]ind [G]lobal")
map("n", "-", utils.toggle_oil, "Open Oil")

-- LSP/Quickfix
map("n", "<C-x>", "<cmd>Trouble diagnostics toggle<cr>", "Show Errors Tab")
map("n", "<C-s>", utils.toggle_diagnostic_float, "Local Diagnostics")
map("n", "<C-a>", vim.lsp.buf.code_action, "Code [A]ctions")
map("n", "K", utils.hover_with_rounded, "Hover Symbol")
map("n", "<leader>xr", "<cmd>FzfLua lsp_references<cr>", "Show [R]eferences")
-- map("n", "<C-k>", utils.goto_next_error, "Goto Next Error")
-- map("n", "<C-j>", utils.goto_prev_error, "Goto Prev Error")
map("n", "<F4>", utils.qf_toggle, "Toggle Quickfix")

-- Rename
map("n", "<leader>r", utils.rename, "[R]ename")

-- Goto
map("n", "f", "<Plug>(leap)", "Leap")
map("n", "gf", "<Plug>(leap-from-window)", "Leap From Window")
map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
map("n", "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
map({"n", "x"}, "<C-h>", "^", "Goto Line Start")
map({"n", "x"}, "<C-l>", "g_", "Goto Line End")
map({"n", "v"}, "H", "B", "Goto preceding space")
map({"n", "v"}, "L", "E", "Goto following space")

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
map({"n", "t"}, "<C-e>", "<cmd>3ToggleTerm<cr>", "Toggle Terminal 3")
map({"n", "t"}, "<C-g>", utils.toggle_lazygit, "Toggle Lazygit")

-- Sane terminal mode exit
map("t", "<esc>", "<C-\\><C-n>", "Exit Terminal Mode")
