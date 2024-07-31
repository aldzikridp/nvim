local kulala = require('kulala')
kulala.setup()
local function setKeymap(key, command)
  return vim.keymap.set('n', key, command, { silent = true })
end
vim.filetype.add({ extension = { http = "http" } })
setKeymap('<leader>ht', function() kulala.run() end)
setKeymap('<leader>hc', function() kulala.close() end)
