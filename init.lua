if vim.loop.os_uname().version:match("NixOS") ~= "NixOS" then
  require 'mypaq'
else
  require  'myhttp'
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
--require 'mycurl'
require 'gitsigns'.setup()
