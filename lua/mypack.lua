local function run_build(name, cmd, cwd)
  local result = vim.system(cmd, { cwd = cwd }):wait()
  if result.code ~= 0 then
    local stderr = result.stderr or ''
    local stdout = result.stdout or ''
    local output = stderr ~= '' and stderr or stdout
    if output == '' then output = 'No output from build command.' end
    vim.notify(('Build failed for %s:\n%s'):format(name, output), vim.log.levels.ERROR)
  end
end

-- This autocommand runs after a plugin is installed or updated and
--  runs the appropriate build command for that plugin if necessary.
--
-- See `:help vim.pack-events`
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name = ev.data.spec.name
    local kind = ev.data.kind
    if kind ~= 'install' and kind ~= 'update' then return end

    if name == 'telescope-fzf-native.nvim' and vim.fn.executable 'make' == 1 then
      run_build(name, { 'make' }, ev.data.path)
      return
    end

    if name == 'LuaSnip' then
      if vim.fn.has 'win32' ~= 1 and vim.fn.executable 'make' == 1 then run_build(name, { 'make', 'install_jsregexp' }, ev.data.path) end
      return
    end

    if name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd 'nvim-treesitter' end
      vim.cmd 'TSUpdate'
      return
    end
  end,
})

---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh "savq/paq-nvim" }
vim.pack.add { gh "akinsho/bufferline.nvim" }
vim.pack.add { gh "hrsh7th/nvim-cmp" }
vim.pack.add { gh "saadparwaiz1/cmp_luasnip" }
vim.pack.add { gh "hrsh7th/cmp-path" }
vim.pack.add { gh "hrsh7th/cmp-nvim-lua" }
vim.pack.add { gh "hrsh7th/cmp-nvim-lsp" }
vim.pack.add { gh "hrsh7th/cmp-buffer" }
vim.pack.add { gh "hrsh7th/cmp-cmdline" }
vim.pack.add { gh "rafamadriz/friendly-snippets" }
vim.pack.add { gh "ibhagwan/fzf-lua" }
vim.pack.add { gh "nvim-tree/nvim-web-devicons" }
vim.pack.add { gh "nvim-lualine/lualine.nvim" }
vim.pack.add { gh "l3mon4d3/luasnip" }
vim.pack.add { gh "lukas-reineke/indent-blankline.nvim" }
vim.pack.add { gh "neovim/nvim-lspconfig" }
vim.pack.add { gh "nvim-tree/nvim-tree.lua" }
vim.pack.add { gh "nvim-treesitter/nvim-treesitter-refactor" }
vim.pack.add { gh "nvim-treesitter/nvim-treesitter-textobjects" }
vim.pack.add { gh "nvim-lua/plenary.nvim" }
vim.pack.add { gh "folke/tokyonight.nvim" }
vim.pack.add { gh "lewis6991/gitsigns.nvim" }
vim.pack.add ({ src = (gh "nvim-treesitter/nvim-treesitter"), version = 'main' })
