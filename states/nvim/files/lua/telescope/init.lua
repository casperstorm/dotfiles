vim.api.nvim_set_keymap(
    "n",
    "<Leader>gs",
    "<cmd>lua require('telescope.builtin').lsp_document_symbols{}<CR>",
    {
        noremap = true,
        silent = true,
    }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>gr",
    "<cmd>lua require('telescope.builtin').lsp_references{}<CR>",
    {
        noremap = true,
        silent = true,
    }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>gf",
    "<cmd>lua require('telescope.builtin').quickfix{}<CR>",
    {
        noremap = true,
        silent = true,
    }
)

