vim.cmd("hi! link NormalFloat Normal")
vim.cmd("hi! link FloatBorder Normal")

vim.cmd("hi! illuminatedWord gui=underline")
vim.cmd("hi! IlluminatedWordText gui=underline")
vim.cmd("hi! IlluminatedWordRead gui=underline")
vim.cmd("hi! IlluminatedWordWrite gui=underline")

vim.cmd("hi! link @lsp.typemod.typeAlias.library.rust Yellow")
vim.cmd("hi! link @lsp.type.namespace.rust Orange")
vim.cmd("hi! link @module.rust Orange")

-- highlight bracker pair
vim.cmd("hi! MatchParen ctermfg=235 ctermbg=109 guifg=#282828 guibg=#83a598")
