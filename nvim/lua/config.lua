local cmd = vim.cmd

-- colors
cmd('let g:nvcode_termcolors=256') -- configure nvcode-color-schemes
cmd('syntax on') -- syntax highlighting
cmd('colorscheme kanagawa')
cmd([[
  if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
  endif
]])


-- no diagnostics in cargo dir
cmd([[
augroup RustDisableDiag
    au!
    autocmd BufRead,BufNewFile ~/.cargo/* echo 'disabling diagnostics in this buffer'
augroup END
]])

-- hover diagnostics
cmd([[
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- auto format
cmd([[
autocmd BufWritePre *.rs,*.lua lua vim.lsp.buf.formatting_sync(nil, 200)
]])

-- update stale but unmodified buffers
cmd([[
set autoread
autocmd FocusGained * checktime
]])
