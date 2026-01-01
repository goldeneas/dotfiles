return {
    "hiphish/rainbow-delimiters.nvim",
    submodules = false,
    config = function()
        vim.cmd("hi! RainbowDelimiterOrange ctermfg=15 guifg=#d65d0e")
        vim.cmd("hi! RainbowDelimiterBlue ctermfg=12 guifg=#458588")
        vim.cmd("hi! RainbowDelimiterViolet ctermfg=13 guifg=#b16286")

        ---@type rainbow_delimiters.config
        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = 'rainbow-delimiters.strategy.global',
                vim = 'rainbow-delimiters.strategy.local',
            },
            query = {
                [''] = 'rainbow-delimiters',
            },
            priority = {
                [''] = 110,
            },
            highlight = {
                'RainbowDelimiterOrange',
                'RainbowDelimiterViolet',
                'RainbowDelimiterBlue',
            },
        }
    end
}
