require 'mybase'
--require 'myplugins'
require 'myluatree'
require 'mytreesitter'
require 'mytelescope'
require 'mylsp'
require 'mycompe'
require 'mylualine'
require 'mybufferline'

--colorscheme
--require('highlite')
vim.api.nvim_exec(
[[
colorscheme tokyonight
]],
false)
vim.g.tokyonight_hide_inactive_statusline = true
--require('zephyr')
