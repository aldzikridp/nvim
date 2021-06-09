--vim.cmd 'packadd paq-nvim'       -- Only needed once
package.loaded['paq-nvim'] = nil -- refresh package list
local paq = require('paq-nvim').paq
require 'paq-nvim' {

    'savq/paq-nvim';

    -- Peek inside register;
    --'gennaro-tedesco/nvim-peekup';

    -- Fade inactive buff;
    --'TaDaa/vimade';

    -- Tree Shitter, lol;
    'nvim-treesitter/nvim-treesitter';

    -- Telescope;
    'nvim-lua/plenary.nvim';
    'nvim-lua/popup.nvim';
    'nvim-telescope/telescope.nvim';
    'nvim-telescope/telescope-fzy-native.nvim';

    -- LSP;
    {'neovim/nvim-lspconfig', opt=true};
    {'glepnir/lspsaga.nvim', opt=true};
    'hrsh7th/nvim-compe';
    -- Java LSP;
    {'mfussenegger/nvim-jdtls', opt=true};

    -- Icon;
    'kyazdani42/nvim-web-devicons';

    -- File manager;
    'kyazdani42/nvim-tree.lua';

    -- Easier color picking;
    {'norcalli/nvim-colorizer.lua', opt=true};

    -- Statusline;
    --{'hoob3rt/lualine.nvim', opt=true};
    'hoob3rt/lualine.nvim';
    'akinsho/nvim-bufferline.lua';

    -- Colorscheme;
    --'ChristianChiarulli/nvcode-color-schemes.vim';
    --'Iron-E/nvim-highlite';
    --'glepnir/zephyr-nvim';
    --{'Th3Whit3Wolf/one-nvim', opt=true};
    'Th3Whit3Wolf/one-nvim';
    'bluz71/vim-nightfly-guicolors';
    --'navarasu/onedark.nvim';

    -- Easier Kybindings;
    'tjdevries/astronauta.nvim';
}
