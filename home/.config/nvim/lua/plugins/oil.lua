return {
	"stevearc/oil.nvim",
    opts = {
        view_options = {
            show_hidden = false,
        },

        float = {
            max_width = 0.9,
            max_height = 0.8,
            border = "rounded",
        },

        keymaps = {
            ["q"] = { "actions.close", mode = "n" },
            ["<ESC>"] = { "actions.close", mode = "n" },
        },
    },
}
