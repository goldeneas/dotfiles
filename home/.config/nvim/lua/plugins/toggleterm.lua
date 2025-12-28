return {
    "akinsho/toggleterm.nvim",
    opts = {
        autochdir = true,
        direction = "float",
        close_on_exit = true,
        persist_mode = false,

        on_open = function(term)
            vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>close<cr>", {})
        end,
    }
}
