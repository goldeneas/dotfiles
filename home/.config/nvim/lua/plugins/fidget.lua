return {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    opts = {
        progress = {
            ignore_done_already = true,
            suppress_on_insert = true,

            display = {
                render_limit = 4,
                done_ttl = 1,
                progress_ttl = math.huge,

                format_message = function(msg)
                    return msg.done and "Completed ->" or "Working ->"
                end
            },
        },

        notification = {
            window = {
                align = "top",
                border = "single",
                max_width = 0,
            }
        }
    }
}
