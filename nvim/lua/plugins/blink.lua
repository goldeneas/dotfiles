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
            menu = {
                border = "rounded",
                -- scrollbar = false,
                winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",

                draw = {
                    padding = 0,
                    columns = { { "label" }, { "kind_icon" } },
                }
            },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                window = {
                    border = "rounded",
                }
            },

            list = {
                selection = { auto_insert = true },
            },

            ghost_text = {
                enabled = false,
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
            enabled = true,
            window = {
                border = "rounded",
                winhighlight = "Normal:NormalFloat,FloatBorder:NormalFloat",
            }
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            default = { "lsp", "lazydev", "ripgrep" },
            providers = {
                buffer = { enabled = false },
                snippets = { enabled = false },
                lazydev = {
                    name = "LazyDev",
                    enabled = true,
                    module = "lazydev.integrations.blink",
                    score_offset = 100,  -- make lazydev completions top priority
                },
                lsp = {
                    transform_items = function (_, items)
                        return vim.tbl_filter(function(item)
                            local types = require('blink.cmp.types').CompletionItemKind
                            local kind = item.kind
                            return kind ~= types.Text and kind ~= types.Snippet
                        end, items)
                    end
                },
                ripgrep = {
                    module = "blink-ripgrep",
                    enabled = true,
                    name = "Ripgrep",
                    -- the options below are optional, some default values are shown
                    opts = {
                        -- For many options, see `rg --help` for an exact description of
                        -- the values that ripgrep expects.

                        -- the minimum length of the current word to start searching
                        -- (if the word is shorter than this, the search will not start)
                        prefix_min_len = 3,

                        -- The number of lines to show around each match in the preview
                        -- (documentation) window. For example, 5 means to show 5 lines
                        -- before, then the match, and another 5 lines after the match.
                        context_size = 5,

                        -- The maximum file size of a file that ripgrep should include in
                        -- its search. Useful when your project contains large files that
                        -- might cause performance issues.
                        -- Examples:
                        -- "1024" (bytes by default), "200K", "1M", "1G", which will
                        -- exclude files larger than that size.
                        max_filesize = "1M",

                        -- Specifies how to find the root of the project where the ripgrep
                        -- search will start from. Accepts the same options as the marker
                        -- given to `:h vim.fs.root()` which offers many possibilities for
                        -- configuration. If none can be found, defaults to Neovim's cwd.
                        --
                        -- Examples:
                        -- - ".git" (default)
                        -- - { ".git", "package.json", ".root" }
                        project_root_marker = ".git",

                        -- Enable fallback to neovim cwd if project_root_marker is not
                        -- found. Default: `true`, which means to use the cwd.
                        project_root_fallback = true,

                        -- The casing to use for the search in a format that ripgrep
                        -- accepts. Defaults to "--ignore-case". See `rg --help` for all the
                        -- available options ripgrep supports, but you can try
                        -- "--case-sensitive" or "--smart-case".
                        search_casing = "--ignore-case",

                        -- (advanced) Any additional options you want to give to ripgrep.
                        -- See `rg -h` for a list of all available options. Might be
                        -- helpful in adjusting performance in specific situations.
                        -- If you have an idea for a default, please open an issue!
                        --
                        -- Not everything will work (obviously).
                        additional_rg_options = {},

                        -- When a result is found for a file whose filetype does not have a
                        -- treesitter parser installed, fall back to regex based highlighting
                        -- that is bundled in Neovim.
                        fallback_to_regex_highlighting = true,

                        -- Absolute root paths where the rg command will not be executed.
                        -- Usually you want to exclude paths using gitignore files or
                        -- ripgrep specific ignore files, but this can be used to only
                        -- ignore the paths in blink-ripgrep.nvim, maintaining the ability
                        -- to use ripgrep for those paths on the command line. If you need
                        -- to find out where the searches are executed, enable `debug` and
                        -- look at `:messages`.
                        ignore_paths = {},

                        -- Any additional paths to search in, in addition to the project
                        -- root. This can be useful if you want to include dictionary files
                        -- (/usr/share/dict/words), framework documentation, or any other
                        -- reference material that is not available within the project
                        -- root.
                        additional_paths = {},

                        -- Keymaps to toggle features on/off. This can be used to alter
                        -- the behavior of the plugin without restarting Neovim. Nothing
                        -- is enabled by default. Requires folke/snacks.nvim.
                        toggles = {
                            -- The keymap to toggle the plugin on and off from blink
                            -- completion results. Example: "<leader>tg" ("toggle grep")
                            on_off = nil,

                            -- The keymap to toggle debug mode on/off. Example: "<leader>td" ("toggle debug")
                            debug = nil,
                        },
                    },
                },
            },
        }
    }
}
