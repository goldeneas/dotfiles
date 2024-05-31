return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
        require'lsp_signature'.setup({
            bind = true, 
            handler_opts = {
                border = "rounded"
            },

            always_show = true,

            hint_enable = false,
            hi_parameter = "LspSignatureActiveParameter",
        })
    end
}
