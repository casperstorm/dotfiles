local cmd = vim.cmd

-- colors
cmd('let g:nvcode_termcolors=256') -- configure nvcode-color-schemes
cmd('syntax on') -- syntax highlighting
cmd('colorscheme catppuccin-macchiato')
cmd([[
  if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
  endif
]])

-- hover diagnostics
cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- auto format
cmd([[
autocmd BufWritePre *.rs,*.lua lua vim.lsp.buf.formatting_sync(nil, 200)
]])
cmd([[
autocmd BufWritePre * lua vim.lsp.buf.format({ filter = function(client) return client.name ~= "tsserver" end })
]])

-- update stale but unmodified buffers
cmd([[
set autoread
autocmd FocusGained * checktime
]])
