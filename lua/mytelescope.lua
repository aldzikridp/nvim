require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
local astro = require("astronauta.keymap")
local nnoremap = astro.nnoremap
nnoremap {"<Leader>ff","<CMD>lua require('telescope.builtin').find_files()<CR>"}
nnoremap {"<Leader>fg","<CMD>lua require('telescope.builtin').live_grep()<CR>"}
nnoremap {"<Leader>fb","<CMD>lua require('telescope.builtin').buffers()<CR>"}
nnoremap {"<Leader>fh","<CMD>lua require('telescope.builtin').help_tags()<CR>"}
