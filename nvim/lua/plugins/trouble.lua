return {
	"folke/trouble.nvim",
    event = "VeryLazy",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local trouble = require("trouble")
        trouble.setup({
            win_config = {
                border = "single",
            }
        })
    end
}
