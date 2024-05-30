vim.cmd("hi! link NormalFloat Normal")
vim.cmd("hi! link FloatBorder Normal")

vim.cmd("hi! illuminatedWord gui=underline")
vim.cmd("hi! IlluminatedWordText gui=underline")
vim.cmd("hi! IlluminatedWordRead gui=underline")
vim.cmd("hi! IlluminatedWordWrite gui=underline")

vim.cmd("hi! link @lsp.typemod.typeAlias.library.rust YellowItalic")

-- highlight bracker pair
vim.cmd("hi! MatchParen ctermfg=235 ctermbg=109 guifg=#282828 guibg=#83a598")
