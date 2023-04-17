local lsp = require'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  signs = true,
})

-- LSP settings
local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('split')

local myborder = "single"
local float_opt = { focusable = false, border = myborder}
local float_win = { float = float_opt }
_G.mydiagnostic = {}

_G.mydiagnostic.open_float = function()
  float_opt.scope = "cursor"
  return vim.diagnostic.open_float(0, float_opt)
end

_G.mydiagnostic.goto_next = function()
  return vim.diagnostic.goto_next(float_win)
end

_G.mydiagnostic.goto_prev = function()
  return vim.diagnostic.goto_prev(float_win)
end

local common = function(bufnr)
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, float_opt)
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = myborder})
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua mydiagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua mydiagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>ft', '<cmd>lua vim.lsp.buf.format({async=true})<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua mydiagnostic.open_float()<CR>', opts)
  vim.o.signcolumn='yes'
  vim.api.nvim_create_autocmd({"CursorHold"},{
    command = "lua mydiagnostic.open_float()",
  })
end


local on_attach = function(client, bufnr)
  common(bufnr)
end

local langservers = { 'rnix', 'ccls', 'r_language_server', 'rust_analyzer' }
for _, langserver in ipairs(langservers) do
  lsp[langserver].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

require'lspconfig'.clangd.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = { "clangd", "--query-driver=/run/current-system/sw/bin/gcc" },
}

lsp.tsserver.setup{
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      common(bufnr)
      local ts_utils = require("nvim-lsp-ts-utils")
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      ts_utils.setup {
        update_imports_on_move = true,
      }
    end

}

lsp.texlab.setup{
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    texlab = {
      rootDirectory = vim.fn.getcwd(),
      build = {
        args = { "-pdflua", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "latexmk",
        forwardSearchAfter = true,
        onSave = true
      },
      forwardSearch = {
        executable = "zathura",
        args = {"--synctex-forward", "%l:1:%f", "%p"}
      }
    }
  }
}
