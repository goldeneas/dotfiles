local root_names = {
    '.git', '.hg', '.svn', '.bzr', '_darcs',
    'Makefile', 'package.json', 'go.mod', 'pom.xml', 'Cargo.toml', 'requirements.txt'
}

-- automatically change root dir when entering buf (like vim-rooter)
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        local root = vim.fs.root(0, root_names)
        if not root then return end

        vim.fn.chdir(root)
    end,
})
