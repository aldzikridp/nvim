require 'nvim-treesitter.install'.compilers = { 'clang++'}
local ts = require 'nvim-treesitter.configs'
ts.setup {
    ensure_installed = 'maintained',
    highlight = {enable = true},
    indent = {enable = true}
}

