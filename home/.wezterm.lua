local wezterm = require 'wezterm'
local config = wezterm.config_builder()

local font = wezterm.font_with_fallback({ "Mx437 IBM VGA 8x16", "Maple Mono" })

config.initial_cols = 120
config.initial_rows = 28
config.hide_tab_bar_if_only_one_tab = true
config.freetype_load_target = "Light"

config.font_size = 12
config.color_scheme = 'GruvboxDark'
config.font = font

config.window_close_confirmation = "NeverPrompt"

-- Disable bold font
-- Used with old school fonts, which don't look that good
config.font_rules = {
    {
        intensity = 'Bold',
        italic = false,
        font = font
    },

    {
        intensity = 'Bold',
        italic = true,
        font = font
    },

    {
        intensity = 'Normal',
        italic = true,
        font = font
    },

    {
        intensity = 'Half',
        italic = true,
        font = font
    },

    {
        intensity = 'Half',
        italic = false,
        font = font
    },
}

config.foreground_text_hsb = {
    brightness = 0.7, -- 0.0 è nero totale, 1.0 è normale, > 1.0 aumenta la luminosità
    saturation = 1.0, -- 1.0 è normale, < 1.0 sbiadisce i colori verso il grigio
}


return config
