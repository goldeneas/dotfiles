return {
    "saghen/blink.pairs",
    version = "*",
    dependencies = 'saghen/blink.download',

    --- @module 'blink.pairs'
    --- @type blink.pairs.Config
    opts = {
        highlights = {
            enabled = true,
            cmdline = false,

            matchparen = {
                enabled = false,
            }
        }
    },
}
