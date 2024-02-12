if vim.loop.os_uname().version:match("NixOS") ~= "NixOS" then
  require 'mypaq'
end
require 'mybase'
--require 'myplugins'
require 'mytokyonight'
require 'mybufferline'
require 'myluatree'
require 'mytreesitter'
require 'myfzf'
require 'mylsp'
--require 'mynullls'
require 'mycmp'
require 'mylualine'
require 'myindentline'
require 'myhttp'
require 'gitsigns'.setup()
--require 'myshade'
vim.o.guifont = "JetBrainsMono Nerd Font:h11"
