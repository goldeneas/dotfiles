return {
	"folke/trouble.nvim",
    event = "VeryLazy",
    opts = {
        focus = true,
        warn_no_results = false,
        open_no_results = true,
        auto_close = true,

        win = {
            border = "rounded",
            type = "float",

            size = {
                width = 0.5,
                height = 0.5,
            },
        },

        keys = {
            ["<cr>"] = "jump_close",
            ["<2-leftmouse>"] = "jump_close",
        },
    }
}
