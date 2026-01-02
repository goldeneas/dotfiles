return {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function()
        vim.cmd("hi! illuminatedWord gui=underline")
        vim.cmd("hi! IlluminatedWordText gui=underline")
        vim.cmd("hi! IlluminatedWordRead gui=underline")
        vim.cmd("hi! IlluminatedWordWrite gui=underline")
    end
}
