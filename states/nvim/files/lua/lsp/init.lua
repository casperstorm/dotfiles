-- local diagnostic = require('diagnostic')
local nvim_lsp = require('nvim_lsp')
-- local configs = require('nvim_lsp/configs')
-- local util = require('nvim_lsp/util')

local on_attach = function(client, bufnr)
  -- diagnostic.on_attach(client, bufnr)

  -- Keybindings for LSPs
  vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
end

-- nvim_lsp.vimls.setup{
--   on_attach = on_attach,
-- }
nvim_lsp.tsserver.setup{
  on_attach = on_attach,
}
-- nvim_lsp.html.setup{
--   on_attach = on_attach,
-- }
-- nvim_lsp.cssls.setup{
--   on_attach = on_attach,
-- }
nvim_lsp.rust_analyzer.setup{
  on_attach = on_attach,
}
-- nvim_lsp.diagnosticls.setup{
--   on_attach=custom_attach,
--   filetypes={ 'rust' },
--   init_options = {
--     linters = {},
--     filetypes = {},
--     formatters = {
--       rustfmt = {command = "rustfmt", args = {"%filepath"}},
--     },
--     formatFiletypes = {
--       rust = "rustfmt",
--     },
--   }
-- }


