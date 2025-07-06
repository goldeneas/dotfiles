vim.cmd("hi! link NormalFloat Normal")
vim.cmd("hi! link FloatBorder Normal")

vim.cmd("hi! illuminatedWord gui=underline")
vim.cmd("hi! IlluminatedWordText gui=underline")
vim.cmd("hi! IlluminatedWordRead gui=underline")
vim.cmd("hi! IlluminatedWordWrite gui=underline")

-- Rust
vim.cmd("hi! link @lsp.typemod.typeAlias.library.rust Yellow")
vim.cmd("hi! link @lsp.type.namespace.rust Orange")
vim.cmd("hi! link @module.rust Orange")

-- C
vim.cmd("hi! link @keyword.type.c Orange")

-- comments
vim.cmd("hi! @comment.todo.comment ctermfg=235 ctermbg=214 guifg=#282828 guibg=#fabd2f")

-- highlight bracker pair
vim.cmd("hi! MatchParen ctermfg=235 ctermbg=109 guifg=#282828 guibg=#83a598")

-- color column
vim.cmd("hi! ColorColumn ctermbg=235 guibg=#2a2a2a")

-- snippet arg highlighting
vim.cmd("hi! link SnippetTabstop Normal")
