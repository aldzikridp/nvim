vim.o.termguicolors = true
vim.o.syntax="on"
vim.o.laststatus = 2
vim.o.inccommand = "split"
vim.o.showmode = false
vim.o.history = 500
vim.o.autoread = true
vim.o.scrolloff = 5
vim.o.ruler = true
vim.o.cmdheight = 2
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.lazyredraw = true
vim.o.magic = true
vim.o.showmatch = true
vim.o.matchtime = 2
vim.o.errorbells = false
vim.o.visualbell = false
vim.o.timeoutlen = 500
vim.o.encoding = "UTF-8"
vim.o.backup = false
vim.o.wb = false
vim.o.swapfile = false
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.mouse = 'a'
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.wrap = true
vim.o.autoindent = true
vim.wo.cursorline = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.o.autoindent = true
vim.o.smartindent = true
vim.api.nvim_command('filetype plugin on')
vim.api.nvim_exec(
[[
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]],
false)
