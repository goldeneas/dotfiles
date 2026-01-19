return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
        enable_moveright = false,
        enable_check_bracket_line = false, --- check bracket in same line
    },
}
