local M = {}

function M.setKeymap(key, command)
    return vim.api.nvim_set_keymap("n", key, command, {noremap = true, silent = true})
end

return M
