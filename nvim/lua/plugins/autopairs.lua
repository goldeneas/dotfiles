return {
	"windwp/nvim-autopairs",
    event = "VeryLazy",
	config = function()
        local autopairs = require("nvim-autopairs")
        autopairs.setup({
            check_ts = true,
            enable_moveright = false,
            enable_check_bracket_line = false
        })
    end
}
