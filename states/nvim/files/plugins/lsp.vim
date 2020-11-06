command! LspHover lua vim.lsp.buf.hover()<CR>
command! LspDisable lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>

" LSP config, in lua
lua require("lsp")
setlocal omnifunc=v:lua.vim.lsp.omnifunc
