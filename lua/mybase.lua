local tab_width = 2
vim.api.nvim_set_option('softtabstop',tab_width)
vim.api.nvim_set_option('shiftwidth',tab_width)
vim.api.nvim_set_option('tabstop',tab_width)
vim.api.nvim_set_option('autoindent',true)
vim.api.nvim_set_option('autoread',true)
vim.api.nvim_set_option('backup',false)
vim.api.nvim_set_option('breakindent',true)
vim.api.nvim_set_option('cmdheight',2)
vim.api.nvim_set_option('encoding','UTF-8')
vim.api.nvim_set_option('errorbells',false)
vim.api.nvim_set_option('expandtab',true)
vim.api.nvim_set_option('fileformat','unix')
vim.api.nvim_set_option('fileformats','unix,dos')
vim.api.nvim_set_option('hidden',true)
vim.api.nvim_set_option('history',500)
vim.api.nvim_set_option('hlsearch',true)
vim.api.nvim_set_option('relativenumber',true)
--vim.api.nvim_set_option('number',true)
vim.api.nvim_set_option('ignorecase',true)
vim.api.nvim_set_option('inccommand','split')
vim.api.nvim_set_option('incsearch',true)
vim.api.nvim_set_option('laststatus',3)
vim.api.nvim_set_option('lazyredraw',true)
vim.api.nvim_set_option('linebreak',true)
vim.api.nvim_set_option('magic',true)
vim.api.nvim_set_option('matchtime',2)
vim.api.nvim_set_option('mouse','a')
vim.api.nvim_set_option('ruler',true)
vim.api.nvim_set_option('scrolloff',5)
vim.api.nvim_set_option('showmatch',true)
vim.api.nvim_set_option('showmode',false)
vim.api.nvim_set_option('smartcase',true)
vim.api.nvim_set_option('smartindent',false)
vim.api.nvim_set_option('smarttab',true)
vim.api.nvim_set_option('termguicolors',true)
vim.api.nvim_set_option('timeoutlen',500)
vim.api.nvim_set_option('visualbell',false)
vim.api.nvim_set_option('wb',false)
vim.api.nvim_set_option('wrap',true)
vim.o.cursorline=true
vim.api.nvim_win_set_option(0,'relativenumber',true)
--vim.api.nvim_win_set_option(0,'number',true)
vim.o.signcolumn='yes'
-- If updatetime set to low e.g <4000 PLEASE DISABLE SWAPFILE
vim.o.updatetime=500
vim.api.nvim_set_option('swapfile',false)
vim.api.nvim_set_option('nrformats','unsigned')
vim.api.nvim_command('filetype plugin on')


-- Sign
local signs = { Error = " ✖", Warn = " ", Hint = " ", Info = " ℹ" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

