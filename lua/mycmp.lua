vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
local luasnip = require 'luasnip'
require("luasnip/loaders/from_vscode").load()
local set_keymap = vim.api.nvim_set_keymap
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

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
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-n>', true, true, true), 'n')
      elseif luasnip.expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(luasnip.expand_or_jump, true, true, true), '')
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if vim.fn.pumvisible() == 1 then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-p>', true, true, true), 'n')
      elseif luasnip.jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes(luasnip.jump(-1), true, true, true), '')
      else
        fallback()
      end
    end,
  },

  sources = {
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },

  documentation = {
      border = "single"
    }
}

--_G.expandOrJump = function ()
--    if vim.fn.pumvisible() == 1 then
--        return t "<C-n>"
--    elseif luasnip and luasnip.expand_or_jumpable() then
--        return luasnip.expand_or_jump()
--    end
--    return
--end
--
--set_keymap("i", "<C-K>", "v:lua.expandOrJump()", { expr = true, noremap = true})
--
--luasnipJump = function(direction)
--    if luasnip.jumpable(direction) then
--        luasnip.jump(direction)
--    end
--    return
--end
--
--set_keymap("i", "<C-J>", ":lua luasnipJump(-1)<CR>", { expr = true, noremap = true})
--set_keymap("s", "<C-K>", ":lua luasnipJump(1)<CR>", { expr = true, noremap = true})
--set_keymap("s", "<C-J>", ":lua luasnipJump(-1)<CR>", { expr = true, noremap = true})
