vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
local luasnip = require 'luasnip'
require("luasnip/loaders/from_vscode").load()
local set_keymap = vim.api.nvim_set_keymap
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local cmp = require "cmp"
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end
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
      --if vim.fn.pumvisible() == 1 then
      --  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      --elseif luasnip.expand_or_jumpable() then
      --  luasnip.expand_or_jump()
      --else
      --  fallback()
      --end

      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end

    end,
    ['<S-Tab>'] = function(fallback)
      --if vim.fn.pumvisible() == 1 then
      --  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      --elseif luasnip.jumpable(-1) then
      --  luasnip.jump(-1)
      --else
      --  fallback()
      --end

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
    }
}

--function deleteField()
--    vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Del>', true, true, true), '')
--    vim.cmd('startinsert')
--end
--vim.api.nvim_set_keymap("s", "<BS>", "<Cmd>lua deleteField()<CR>", {noremap = true, silent = true})
