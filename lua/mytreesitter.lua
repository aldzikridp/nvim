require"nvim-treesitter.install".compilers = {"gcc"}
--require 'nvim-treesitter.install'.compilers = { 'clang++'}
local ts = require 'nvim-treesitter.configs'
ts.setup {
    highlight = {enable = true},
    indent = {enable = true}
}

