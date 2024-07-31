if vim.loop.os_uname().version:match("NixOS") ~= "NixOS" then
  require 'mypaq'
end
require 'mybase'
require 'mytokyonight'
require 'mybufferline'
require 'myluatree'
require 'mytreesitter'
require 'myfzf'
require 'mylsp'
require 'mycmp'
require 'mylualine'
require 'myindentline'
--require 'mykulala'
require 'gitsigns'.setup()
