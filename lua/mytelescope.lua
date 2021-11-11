require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzf')

local function setKeymap(key, command)
    return vim.api.nvim_set_keymap("n", key, command, {noremap = true, silent = true})
end

setKeymap("<leader>ff", "<Cmd>lua require('telescope.builtin').find_files()<CR>")
setKeymap("<leader>fg", "<Cmd>lua require('telescope.builtin').live_grep()<CR>")
setKeymap("<leader>fb", "<Cmd>lua require('telescope.builtin').buffers()<CR>")
setKeymap("<leader>fh", "<Cmd>lua require('telescope.builtin').help_tags()<CR>")
