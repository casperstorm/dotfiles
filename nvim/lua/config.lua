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
vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

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
