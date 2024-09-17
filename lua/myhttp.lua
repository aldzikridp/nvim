local rest = require('rest-nvim')
vim.g.rest_nvim = {
  skip_ssl_verification = true,
  --result_split_horizontal = true,
  --result_split_in_place = true,
  --jump_to_request = false,
}
vim.filetype.add({ extension = { http = "http" } })
local function setKeymap(key, command)
  return vim.keymap.set('n', key, command, { silent = true })
end
--setKeymap("<Leader>ht", require('rest-nvim').run())
setKeymap('<leader>ht', function() rest.run() end)
setKeymap("<Leader>hp", function() rest.run(true) end)
setKeymap("<Leader>hl", function() rest.last() end)
