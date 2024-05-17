return {
    'sainnhe/gruvbox-material',
    lazy = false,
    config = function()
        vim.g.gruvbox_material_foreground = "original"
        vim.g.gruvbox_material_better_performance = true
        vim.cmd.colorscheme('gruvbox-material')
    end
}
