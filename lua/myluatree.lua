require'nvim-tree'.setup{
    hijack_cursor = true,
    diagnostics = { enable = true },
    renderer = {
    indent_markers = {
      enable = true;
    },
  },
}
vim.api.nvim_set_keymap("n", "<leader>b", "<Cmd>NvimTreeToggle<CR>", {noremap = true, silent = true})
