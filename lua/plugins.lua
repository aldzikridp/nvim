vim.cmd 'packadd paq-nvim'       -- Only needed once
package.loaded['paq-nvim'] = nil -- refresh package list
local Pq = require('paq-nvim')
local paq = Pq.paq

paq{'savq/paq-nvim', opt=true}

-- Peek inside register
paq 'gennaro-tedesco/nvim-peekup'

-- Fade inactive buff
paq 'TaDaa/vimade'

-- Tree Shitter, lol
paq 'nvim-treesitter/nvim-treesitter'

-- Telescope, find the star
paq 'nvim-lua/popup.nvim'
paq 'nvim-lua/plenary.nvim'
paq 'nvim-telescope/telescope.nvim'
paq 'nvim-telescope/telescope-fzy-native.nvim'

-- LSP, I suck without it
paq 'neovim/nvim-lspconfig'
paq 'glepnir/lspsaga.nvim'
paq 'hrsh7th/nvim-compe'

-- Icon
paq 'kyazdani42/nvim-web-devicons'

-- CHADTree > NERDTree
paq 'kyazdani42/nvim-tree.lua'

-- Easier color picking
paq{'norcalli/nvim-colorizer.lua', opt=true}

-- Statusline
paq {'glepnir/galaxyline.nvim', branch='main'}

-- Colorscheme
paq 'glepnir/zephyr-nvim'
--paq 'tjdevries/colorbuddy.vim'
--paq 'Th3Whit3Wolf/onebuddy'

-- Easier Kybindings
paq 'tjdevries/astronauta.nvim'
