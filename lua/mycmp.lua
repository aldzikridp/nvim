vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
local luasnip = require 'luasnip'
require("luasnip/loaders/from_vscode").load()
local set_keymap = vim.api.nvim_set_keymap
local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
            require('luasnip').lsp_expand(args.body)
    end,
  },

  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)

      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end

    end,
    ['<S-Tab>'] = function(fallback)

      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end

    end,
  },

  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
  },

  documentation = {
      border = "single"
  },

  experimental = {native_menu = true}
}
