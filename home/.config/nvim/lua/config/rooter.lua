-- we need the '' because if none of those files is found,
-- we set the root to the curr dir returned by `calling vim.fs.root(0, '')`
local root_names = {
    '.git', '.hg', '.svn', '.bzr', '_darcs',
    'Makefile', 'package.json', 'go.mod', 'pom.xml', 'Cargo.toml', 'requirements.txt', ''
}

-- automatically change root dir when entering buf (like vim-rooter)
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        local root = vim.fs.root(0, root_names)
        vim.fn.chdir(root)
    end,
})
