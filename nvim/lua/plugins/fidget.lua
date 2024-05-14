return {
    "j-hui/fidget.nvim",
    config = function()
        local fidget = require("fidget")
        fidget.setup({
            progress = {
                display = {
                    render_limit = 4,
                    done_ttl = 1,
                    progress_ttl = math.huge,

                    format_message = function(msg)
                        return msg.done and "Completed:" or "Doing:"
                    end
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
