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
local keymap = require('keymap')
keymap.setKeymap("<leader>b", "<Cmd>NvimTreeToggle<CR>")
