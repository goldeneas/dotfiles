return {
    "saghen/blink.cmp",
    dependencies = {
        "mikavilpas/blink-ripgrep.nvim",
    },
    lazy = false, -- lazy loading handled internally

    -- use a release tag to download pre-built binaries
    version = "1.*",

    opts = {
        keymap = {
            ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<C-space>"] = { "show", "show_documentation", "hide_documentation", "fallback" },
            ["<Up>"] = {},
            ["<Down>"] = {},
        },

        completion = {
            trigger = {
                show_on_backspace_in_keyword = true,
            },

            keyword = {
                range = "full",
            },

            menu = {
                border = "rounded",
                -- scrollbar = false,
                winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",

                draw = {
                    padding = 0,
                    columns = { { "kind_icon", "label", gap = 1 } },
                },

                max_height = 15,
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = {
                    border = "rounded",
                }
            },

            list = {
                selection = { preselect = false, auto_insert = false },
            },

            ghost_text = {
                enabled = true,
                show_without_menu = false,
            },
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

        -- experimental signature help support
        signature = {
            enabled = false,
            window = {
                border = "rounded",
                winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",
            }
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            default = { "lsp", "lazydev", "path" },
            providers = {
                buffer = { enabled = false },
                snippets = { enabled = false },
                path = {
                    opts = {
                        get_cwd = function(_)
                            return vim.fn.getcwd()
                        end,
                    },
                },
                lazydev = {
                    name = "LazyDev",
                    enabled = true,
                    module = "lazydev.integrations.blink",
                    score_offset = 100,  -- make lazydev completions top priority
                },
            },
            transform_items = function(_, items)
                return vim.tbl_filter(function(item)
                    return item.kind ~= require('blink.cmp.types').CompletionItemKind.Snippet
                end, items)
            end,
        }
    }
}
