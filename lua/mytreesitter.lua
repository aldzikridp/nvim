if vim.loop.os_uname().sysname ~= "Linux" then
  require 'nvim-treesitter.install'.compilers = { 'gcc'}
elseif vim.loop.os_uname().sysname ~= "Darwin" then
  require 'nvim-treesitter.install'.compilers = { 'clang++'}
end

local ts = require 'nvim-treesitter.configs'
ts.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = {enable = true},
    incremental_selection = {
       enable = true,
       keymaps = {
          init_selection = "gnn",
          node_incremental = "gmn",
          scope_incremental = "gmc",
          node_decremental = "gmm",
       },
    },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = false },
  },
--  textobjects = {
--    select = {
--        enable = true,
--
--        -- Automatically jump forward to textobj, similar to targets.vim 
--        lookahead = true,
--
--        keymaps = {
--          -- You can use the capture groups defined in textobjects.scm
--          ["af"] = "@function.outer",
--          ["if"] = "@function.inner",
--          ["ac"] = "@class.outer",
--          ["ic"] = "@class.inner",
--
--          ["iF"] = {
--            python = "(function_definition) @function",
--            cpp = "(function_definition) @function",
--            c = "(function_definition) @function",
--            java = "(method_declaration) @function",
--          },
--        },
--      },
--       move = {
--      enable = true,
--      set_jumps = true, -- whether to set jumps in the jumplist
--      goto_next_start = {
--        ["]m"] = "@function.outer",
--        ["]]"] = "@class.outer",
--      },
--      goto_next_end = {
--        ["]M"] = "@function.outer",
--        ["]["] = "@class.outer",
--      },
--      goto_previous_start = {
--        ["[m"] = "@function.outer",
--        ["[["] = "@class.outer",
--      },
--      goto_previous_end = {
--        ["[M"] = "@function.outer",
--        ["[]"] = "@class.outer",
--      },
--    },
--  },
}

