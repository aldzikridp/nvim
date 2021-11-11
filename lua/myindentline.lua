vim.opt.list = true

require("indent_blankline").setup {
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    show_trailing_blankline_indent = false,
    buftype_exclude = {'terminal', 'nofile'},
    filetype_exclude = {'help', 'lspinfo', 'checkhealth', 'markdown', ''},
    context_patterns = {
        'export_clause',
        'object',
        'template_string',
        'property_identifier',
        'statement_block',
        'try_statement',
        'class',
        'function',
        'method',
        'do_block',
        '^for',
        '^while',
        'catch_clause',
        'arguments',
        'array',
    },
}
vim.api.nvim_command("highlight! link IndentBlanklineChar LineNr")
vim.api.nvim_command("highlight! IndentBlanklineContextChar guifg=#7aa2f7")
vim.api.nvim_command("highlight! IndentBlanklineContextStart guisp=#7aa2f7 gui=underline")
vim.api.nvim_command("highlight! link IndentBlanklineSpaceChar LineNr")

