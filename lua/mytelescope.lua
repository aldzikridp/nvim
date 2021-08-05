require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
vim.api.nvim_exec(
[[
nnoremap <silent><leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <silent><leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <silent><leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <silent><leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
]],false)
