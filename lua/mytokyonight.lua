require("tokyonight").setup({
  hide_inactive_statusline = true, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
})
vim.cmd.colorscheme('tokyonight')
--vim.cmd [[colorscheme tokyonight]]
--vim.cmd [[highlight NormalFloat guifg='#c0caf5']]
--vim.cmd [[highlight FloatBorder guifg='#c0caf5']]
