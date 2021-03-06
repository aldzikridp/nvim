vim.cmd 'packadd paq-nvim'       -- Only needed once
package.loaded['paq-nvim'] = nil -- refresh package list
local paq = require('paq-nvim').paq

paq{'savq/paq-nvim', opt=true}

-- Peek inside register
paq 'gennaro-tedesco/nvim-peekup'

-- Fade inactive buff
paq 'TaDaa/vimade'

-- Tree Shitter, lol
paq 'nvim-treesitter/nvim-treesitter'

-- Telescope
paq 'nvim-lua/plenary.nvim'
paq 'nvim-lua/popup.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'nvim-telescope/telescope-fzy-native.nvim'

-- LSP
paq {'neovim/nvim-lspconfig', opt=true}
paq {'glepnir/lspsaga.nvim', opt=true}
paq 'hrsh7th/nvim-compe'
-- Java LSP
paq {'mfussenegger/nvim-jdtls', opt=true}

-- Icon
paq 'kyazdani42/nvim-web-devicons'

-- File manager
paq 'kyazdani42/nvim-tree.lua'

-- Easier color picking
paq{'norcalli/nvim-colorizer.lua', opt=true}

-- Statusline
--paq {'hoob3rt/lualine.nvim', opt=true}
paq 'hoob3rt/lualine.nvim'
paq 'akinsho/nvim-bufferline.lua'

-- Colorscheme
paq 'ChristianChiarulli/nvcode-color-schemes.vim'
--paq 'Iron-E/nvim-highlite'
--paq 'glepnir/zephyr-nvim'
--paq 'tjdevries/colorbuddy.vim'
--paq 'Th3Whit3Wolf/onebuddy'

-- Easier Kybindings
paq 'tjdevries/astronauta.nvim'
