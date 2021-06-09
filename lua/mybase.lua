--vim.o.softtabstop = 4
vim.o.autoindent = true
vim.o.autoindent = true
vim.o.autoread = true
vim.o.backup = false
vim.o.breakindent = true
vim.o.cmdheight = 2
vim.o.completeopt = "menuone,noselect" --required for nvim-compe
vim.o.encoding = "UTF-8"
vim.o.errorbells = false
vim.o.expandtab = true
vim.o.hidden = true
vim.o.history = 500
vim.o.hlsearch = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.incsearch = true
vim.o.laststatus = 2
vim.o.lazyredraw = true
vim.o.linebreak = true
vim.o.magic = true
vim.o.matchtime = 2
vim.o.mouse = 'a'
vim.o.ruler = true
vim.o.scrolloff = 5
vim.o.shiftwidth = 4
vim.o.showmatch = true
vim.o.showmode = false
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.swapfile = false
--vim.o.syntax="on"
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.visualbell = false
vim.o.wb = false
vim.o.wrap = true
vim.wo.cursorline = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.api.nvim_command('filetype plugin on')
vim.api.nvim_exec(
[[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]],
false)
