local api = require("api")

-- Useful keymaps from nvim
-- <C-è>, Switches between current and previous buffer
-- <C-à>, Moves to the first and last parenthesis in line
-- <C-ò> OR Enter, Opens the quickfix list
-- a, Goes into insert mode but moves the cursor to the right
-- <S-a>, Goes into insert mode to the last character of the line
-- <S-i>, Goes into insert mode to the first character of the line
-- vi", Selects everything within \"\. Also works with parenthesis

-- Better Cut/Delete
api.map({ "n", "x" }, "x", "d", "Cut")
api.map("n", "xx", "dd", "Cut Line")
api.map("n", "X", "D", "Cut to End of Line")
api.map({ "n", "x" }, "<Del>", '"_x', "Delete to void")
api.map({ "n", "x" }, "d", '"_d', "Delete to void")
api.map({ "n", "x" }, "D", '"_D', "Delete to void")
api.map({ "n", "x" }, "c", '"_c', "Change to void")
api.map({ "n", "x" }, "C", '"_C', "Change to void")

-- Disables replacing current clipboard after pasting
api.map("x", "p", '"_dP', "Just Paste")

-- Window
api.map("n", "<leader>s", "<cmd>split<cr>", "[S]plit [W]indow Horizontally")
api.map("n", "<leader>S", "<cmd>vsplit<cr>", "[S]plit [W]indow Vertically")
api.map("n", "<leader>3", api.split_three, "Split Window in [3]")

api.map({ "n", "t" }, "<M-Up>", "<cmd>resize -2<CR>")
api.map({ "n", "t" }, "<M-Down>", "<cmd>resize +2<CR>")
api.map({ "n", "t" }, "<M-Left>", "<cmd>vertical resize -2<CR>")
api.map({ "n", "t" }, "<M-Right>", "<cmd>vertical resize +2<CR>")

api.map("v", "J", ":m '>+1<CR>gv=gv")
api.map("v", "K", ":m '<-2<CR>gv=gv")

-- Cursor Movement
api.map("n", "<M-h>", "<cmd>wincmd h<cr>", "Move Cursor to Left Window")
api.map("n", "<M-j>", "<cmd>wincmd j<cr>", "Move Cursor to Up Window")
api.map("n", "<M-k>", "<cmd>wincmd k<cr>", "Move Cursor to Down Window")
api.map("n", "<M-l>", "<cmd>wincmd l<cr>", "Move Cursor to Right Window")

api.map("n", "<C-j>", "5<C-e>", "Scroll down")
api.map("n", "<C-k>", "5<C-y>", "Scroll up")

-- Directories
api.map("n", "<leader>ff", "<cmd>FzfLua files<cr>", "[F]ind [F]ile")
api.map("n", "<leader>fr", "<cmd>FzfLua oldfiles<cr>", "[F]ind [R]ecent File")
api.map("n", "<leader>fs", "<cmd>FzfLua live_grep<cr>", "[F]ind [S]tring")
api.map("n", "<leader>fg", "<cmd>FzfLua builtin<cr>", "[F]ind [G]lobal")
api.map("n", "-", "<cmd>Oil<cr>", "Open Oil")

-- LSP/Quickfix
api.map("n", "<C-x>", "<cmd>FzfLua lsp_workspace_diagnostics<cr>", "Show Errors Tab")
api.map("n", "<C-s>", api.toggle_diagnostic_float, "Local Diagnostics")
api.map("n", "<C-a>", "<cmd>FzfLua lsp_code_actions<cr>", "Code [A]ctions")
api.map("n", "K", api.hover_with_rounded, "Hover Symbol")
api.map("n", "<leader>xr", "<cmd>FzfLua lsp_references<cr>", "Show [R]eferences")
-- api.map("n", "<C-k>", api.goto_next_error, "Goto Next Error")
-- api.map("n", "<C-j>", api.goto_prev_error, "Goto Prev Error")
api.map("n", "<F4>", api.qf_toggle, "Toggle Quickfix")
api.map("n", "<M-f>", api.toggle_format_on_save, "Toggle Format On Save")

-- Rename
api.map("n", "<leader>r", api.rename, "[R]ename")

-- Goto
api.map("n", "f", "<Plug>(leap)", "Leap")
api.map("n", "gf", "<Plug>(leap-from-window)", "Leap From Window")
api.map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
api.map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
api.map("n", "gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
api.map({ "n", "x" }, "<C-h>", "^", "Goto Line Start")
api.map({ "n", "x" }, "<C-l>", "g_", "Goto Line End")
api.map({ "n", "v" }, "H", "B", "Goto preceding space")
api.map({ "n", "v" }, "L", "E", "Goto following space")

-- Keep current search item at center of window
api.map("n", "n", "nzzzv", "Search Next")
api.map("n", "N", "Nzzzv", "Search Previous")

-- Remove highlighting from search
api.map("n", "<esc>", "<cmd>nohlsearch<cr>", "Remove Search Highlights")

-- Sane terminal mode exit
api.map("t", "<C-d>", "<C-\\><C-n>", "Exit Terminal Mode")
