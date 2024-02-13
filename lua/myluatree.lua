require'nvim-tree'.setup{
    hijack_cursor = true,
    diagnostics = { enable = true },
    renderer = {
      indent_markers = {
        enable = true;
      },
    },
    update_focused_file = {
      enable = true;
    },
}
vim.api.nvim_set_keymap("n", "<leader>b", "<Cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})
