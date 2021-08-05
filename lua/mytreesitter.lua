require 'nvim-treesitter.install'.compilers = { 'clang++'}
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",

    hightlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}

