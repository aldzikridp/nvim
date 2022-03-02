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

local signs = { Error = "✖ ", Warning = " ", Hint = " ", Information = "ℹ " }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

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

local common = function(bufnr)
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {focusable = false, border = "single"})
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})
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
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({float={focusable=false, border = "single"}})<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next({float={focusable=false, border = "single"}})<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<leader>ft', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float({focusable=false, border = "single"})<CR>', opts)
  vim.o.signcolumn='yes'
end
local on_attach = function(client, bufnr)
  common(bufnr)
end
local on_attachTS = function(client, bufnr)
  common(bufnr)
  local ts_utils = require("nvim-lsp-ts-utils")
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  ts_utils.setup {
    update_imports_on_move = true,
  }
end

vim.cmd [[autocmd CursorHold * lua vim.diagnostic.open_float(0,{focusable=false, border = "single"})]]

--lsp.rome.setup{
--    capabilities = capabilities,
--    on_attach = on_attach
--}
lsp.rnix.setup{
    capabilities = capabilities,
    on_attach = on_attach
}
lsp.tsserver.setup{
    capabilities = capabilities,
    on_attach = on_attachTS
}
lsp.ccls.setup{
    capabilities = capabilities,
    on_attach = on_attach
}
lsp.r_language_server.setup{
    capabilities = capabilities,
    on_attach = on_attach
}

--lsp.diagnosticls.setup {
--    capabilities = capabilities,
--    on_attach = on_attach,
--    filetypes = {"javascript", "typescript"},
--    init_options = {
--        filetypes = {javascript = "eslint", typescript = "eslint"},
--        linters = {
--            eslint = {
--                sourceName = "eslint",
--                command = "./node_modules/.bin/eslint",
--                rootPatterns = {".eslint.js", "package.json"},
--                debounce = 100,
--                args = {
--                    "--cache",
--                    "--stdin",
--                    "--stdin-filename",
--                    "%filepath",
--                    "--format",
--                    "json"
--                },
--                parseJson = {
--                    errorsRoot = "[0].messages",
--                    line = "line",
--                    column = "column",
--                    endLine = "endLine",
--                    endColumn = "endColumn",
--                    message = "[ESLint] ${message} [${ruleId}]",
--                    security = "severity"
--                },
--                securities = {
--                    [2] = "error",
--                    [1] = "warning"
--                }
--            },
--        },
--        filetypes = {
--            javascript = "eslint",
--            typescript = "eslint"
--        }
--    }
--}
