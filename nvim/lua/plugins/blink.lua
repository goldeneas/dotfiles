return {
    "saghen/blink.cmp",
    lazy = false, -- lazy loading handled internally

    -- use a release tag to download pre-built binaries
    version = "v0.*",

    opts = {
        keymap = {
            ["<Tab>"] = { "select_next", "fallback" },
            ["<S-Tab>"] = { "select_prev", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
            ["<Up>"] = {},
            ["<Down>"] = {},
        },

        completion = {
            keyword = {
                exclude_from_prefix_regex = "[\\-,]",
            },

            menu = {
                border = "rounded",
                scrollbar = false,
                winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",

                draw = {
                    padding = 0,
                    columns = { { "label", "label_description", gap = 1 }, { "kind" } },
                }
            },

            documentation = {
                window = {
                    border = "rounded",
                }
            },

            ghost_text = {
                enabled = false,

            }
        },

        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to "mono" for "Nerd Font Mono" or "normal" for "Nerd Font"
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = "mono"
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            default = { "lsp", "path", "lazydev" },
            providers = {
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
                snippets = {
                    opts = {
                        -- Disable the "all" snippets which gives useless stuff like the 'date' snippet
                        global_snippets = {},
                    }
                }
            },

            -- TODO:
            -- stop prompting autocomplete on symbols (, ;...)
            -- make lazydev work

            transform_items = function(_, items)
                return vim.tbl_filter(function(item)
                    return item.kind ~= require('blink.cmp.types').CompletionItemKind.Text
                end, items)
            end,
        },

        -- experimental signature help support
        signature = {
            enabled = true,
            window = {
                border = "rounded",
                winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",
            }
        }
    },
}
