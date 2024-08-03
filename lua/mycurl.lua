local curl = require('curl')
curl.setup()

local function setKeymap(key, command)
  return vim.keymap.set('n', key, command, { silent = true })
end
setKeymap('<leader>ht', function() curl.execute_curl() end)
