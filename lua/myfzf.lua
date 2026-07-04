local keymap = require('keymap')

local function isGnuFind()
  if vim.loop.os_uname().sysname == "Linux" then
    return [[printf "%s\0" */ | parallel -0 "find {} -type f -not -path '*/\.git/*'"]]
  else
    return "fd"
  end
end

require'fzf-lua'.setup {
  winopts = {
    preview = { default = 'bat' },
  },
  previewers = {
    bat = {
      theme = 'TwoDark'
    },
  },
  files = {
    multiprocess = true,
    cmd = "fd"
  },
  grep = { multiprocess = true },
  git = { files = { multiprocess = true } },
}

keymap.setKeymap("<leader>ff", "<Cmd>lua require('fzf-lua').files()<CR>")
keymap.setKeymap("<leader>fg", "<Cmd>lua require('fzf-lua').live_grep_native()<CR>")
keymap.setKeymap("<leader>fc", "<Cmd>lua require('fzf-lua').lgrep_curbuf()<CR>")
keymap.setKeymap("<leader>fb", "<Cmd>lua require('fzf-lua').buffers()<CR>")
keymap.setKeymap("<leader>fh", "<Cmd>lua require('fzf-lua').help_tags()<CR>")
keymap.setKeymap("<leader>fr", "<Cmd>lua require('fzf-lua').registers()<CR>")
keymap.setKeymap("<leader>fm", "<Cmd>lua require('fzf-lua').marks()<CR>")
keymap.setKeymap("<leader>fp", "<Cmd>lua require('fzf-lua').grep_project()<CR>")
