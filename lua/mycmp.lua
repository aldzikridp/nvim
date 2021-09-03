vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
local luasnip = require 'luasnip'

local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
            require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },

  documentation = {
      border = "single"
    }
}
