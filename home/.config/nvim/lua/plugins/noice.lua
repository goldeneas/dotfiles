return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
        },
        -- you can enable a preset for easier configuration
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = true, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true,
        },

        cmdline = {
            view = "cmdline",
            format = {
                cmdline = { icon = ">" },
                search_down = { icon = "/" },
                search_up = { icon = "/UP" },
                filter = { icon = "$" },
                lua = { icon = "LUA" },
                help = { icon = "?" },
            },
        },

        format = {
            level = {
                icons = {
                    error = "E",
                    warn = "W",
                    info = "I",
                },
            },
        },

        popupmenu = {
            kind_icons = false,
        },

        views = {
            mini = {
                size = {
                    max_width = 120,
                },
            },
        },
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
    }
}
