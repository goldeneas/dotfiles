return {
	"smjonas/inc-rename.nvim",
	config = function()
		local increname = require("inc_rename")
		increname.setup({
			input_buffer_type = "dressing",
		})
	end
}
