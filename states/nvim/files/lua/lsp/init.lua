local nvim_lsp = require('lspconfig')

-- Keybindings for LSPs
vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "<leader>k", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "<leader>g]", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "<leader>g[", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
vim.fn.nvim_set_keymap("n", "<leader>ge", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true, silent = true})

local on_attach = function(client, bufnr)
  print("'" .. client.name .. "' language server started" );
  require"completion".on_attach(client)
  -- require"diagnostic".on_attach(client, bufnr)
end

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = 'clipply',
        overrideCommand = {
          'cargo',
          'clippy',
          '--workspace',
          '--message-format=json',
          '--all-targets',
        },
      },
    }
  }
}

nvim_lsp.diagnosticls.setup {
  on_attach = on_attach_vim,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
    "css",
    "scss",
    "markdown",
  },
  init_options = {
    linters = {
      eslint = {
        command = "eslint",
        rootPatterns = {".git", ".eslintrc.cjs", ".eslintrc", ".eslintrc.json", ".eslintrc.js"},
        debounce = 100,
        args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
        sourceName = "eslint",
        parseJson = {
          errorsRoot = "[0].messages",
          line = "line",
          column = "column",
          endLine = "endLine",
          endColumn = "endColumn",
          message = "[eslint] ${message} [${ruleId}]",
          security = "severity",
        },
        securities = {[2] = "error", [1] = "warning"},
      },
      markdownlint = {
        command = "markdownlint",
        rootPatterns = {".git"},
        isStderr = true,
        debounce = 100,
        args = {"--stdin"},
        offsetLine = 0,
        offsetColumn = 0,
        sourceName = "markdownlint",
        securities = {undefined = "hint"},
        formatLines = 1,
        formatPattern = {"^.*:(\\d+)\\s+(.*)$", {line = 1, column = -1, message = 2}},
      },
    },
    filetypes = {
      javascript = "eslint",
      javascriptreact = "eslint",
      typescript = "eslint",
      typescriptreact = "eslint",
      ["typescript.tsx"] = "eslint",
      markdown = "markdownlint",
    },
    formatters = {},
    formatFiletypes = {},
  },
}
