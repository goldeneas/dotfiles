return {
    "j-hui/fidget.nvim",
    config = function()
        local fidget = require("fidget")
        fidget.setup({
            progress = {
                display = {
                    render_limit = 1,
                    done_ttl = 0
                },
            },

            notification = {
                window = {
                    align = "top",
                    border = "single",
                }
            }
        })
    end
}
