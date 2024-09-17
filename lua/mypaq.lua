local function clone_paq()
  local path = vim.fn.stdpath("data") .. "/site/pack/paqs/start/paq-nvim"
  local is_installed = vim.fn.empty(vim.fn.glob(path)) == 0
  if not is_installed then
    vim.fn.system { "git", "clone", "--depth=1", "https://github.com/savq/paq-nvim.git", path }
    return true
  end
end

local function bootstrap_paq(packages)
  local first_install = clone_paq()
  vim.cmd.packadd("paq-nvim")
  local paq = require("paq")
  if first_install then
    vim.notify("Installing plugins... If prompted, hit Enter to continue.")
  end

  -- Read and install packages
  paq(packages)
  paq.install()
end

-- Call helper function
bootstrap_paq {
  "savq/paq-nvim",
  "akinsho/bufferline.nvim",
  "hrsh7th/nvim-cmp",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "rafamadriz/friendly-snippets",
  "ibhagwan/fzf-lua",
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "l3mon4d3/luasnip",
  "lukas-reineke/indent-blankline.nvim",
  "neovim/nvim-lspconfig",
  "nvim-tree/nvim-tree.lua",
  "nvim-treesitter/nvim-treesitter-refactor",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-lua/plenary.nvim",
  "folke/tokyonight.nvim",
  "lewis6991/gitsigns.nvim",
  "oysandvik94/curl.nvim",
  --"rest-nvim/rest.nvim"
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  -- List your packages
}
