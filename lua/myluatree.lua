vim.api.nvim_set_var('nvim_tree_indent_markers', 1)

require'nvim-tree'.setup{
    auto_close = true,
    hijack_cursor = true,
    diagnostics = { enable = true },
}
vim.api.nvim_set_keymap("n", "<leader>b", "<Cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})
