return {
    "j-hui/fidget.nvim",
    config = function()
        local fidget = require("fidget")
        fidget.setup({
            progress = {
                display = {
                    render_limit = 1,
                    done_ttl = 1,
                    progress_ttl = math.huge,
                },

                ignore = {
                    "jdtls",
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
