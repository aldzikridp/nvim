require('lualine').setup{
options = {
          theme = 'onedark',
          icons_enabled = true,
},
sections = {
    lualine_a = { {'mode', upper = true} },
              lualine_b = { {'branch', icon = ''}},
              lualine_c = { {'filename', file_status = true} ,{'diagnostics', sources = { 'nvim_lsp'}}},
              lualine_x = { 'encoding', 'fileformat', 'filetype' },
              lualine_y = { 'progress' },
              lualine_z = { 'location'  },

      }
}
--lualine.options.'diagnostics' = {
--    sources = 'nvim_lsp',
--}
