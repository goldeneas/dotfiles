return {
    url = "https://codeberg.org/andyg/leap.nvim",
    event = "VeryLazy",
    setup = function()
        -- Highly recommended: define a preview filter to reduce visual noise
        -- and the blinking effect after the first keypress.
        -- For example, define word boundaries as the common case, that is, skip
        -- preview for matches starting with whitespace or an alphabetic
        -- mid-word character: foobar[baaz] = quux
        --                     ^    ^^^  ^^ ^ ^  ^
        require('leap').opts.preview = function(ch0, ch1, ch2)
            return not (
                ch1:match('%s')
                or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
            )
        end
    end
}
