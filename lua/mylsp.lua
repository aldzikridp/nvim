function lspsagainit()
    require('lspsaga').init_lsp_saga{
        error_sign = '✖',
        warn_sign = '⚠',
        hint_sign = '➤',
        infor_sign = 'ℹ',
    }
    vim.api.nvim_exec(
    [[
    nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
    nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
    vnoremap <silent><leader>ca <cmd>'<,'>lua require('lspsaga.codeaction').range_code_action()<CR>
    nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
    nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
    nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
    nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
    nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
    nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
    nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
    nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
    nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
    nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
    ]],
    false)
    require'nvim-treesitter.configs'.setup { hightlight = { enable = true }}
end
vim.api.nvim_exec(
[[
if has('nvim-0.5')
  augroup lspjava
    au!
    au FileType java packadd nvim-jdtls | lua require('jdtls').start_or_attach({cmd = {'jdtls'}})
  augroup end
  augroup lspsagainit
    au!
    au FileType java packadd lspsaga.nvim | lua lspsagainit()
  augroup end
endif
]],
false)
