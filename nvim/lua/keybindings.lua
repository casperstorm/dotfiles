local map = require("utils").map

vim.g.mapleader = " "

--- window movement
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

--- hop
map("n", "s", "<cmd>HopWord<CR>")

--- LSP
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")

--- telescope configuration
map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
map("n", ";", "<cmd>Telescope buffers<cr>")

--- tabs
map("n", "<Tab>", "<cmd>bn<CR>")
map("n", "<S-Tab>", "<cmd>bp<CR>")

-- move lines up and down in visual mode
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- indentation control in visual mode
map('v', '>', '>gv', {
    noremap = true,
    silent = true
})
map('v', '<', '<gv', {
    noremap = true,
    silent = true
})

-- when jumping to bottom, center the page
map('n', 'G', 'Gzz', {
    noremap = true,
    silent = true
})

-- hop.nvim configuration
map('n', 'f',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
    , {})
map('n', 'F',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
    , {})
map('o', 'f',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
    , {})
map('o', 'F',
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>"
    , {})

-- x, without yank
map('n', 'x', '"_x', {})
map('n', 'X', '"_X', {})
map('v', 'x', '"_x', {})
map('v', 'X', '"_X', {})

-- whichkey
local wk = require("which-key")
wk.register({
    ["/"] = { "<Plug>kommentary_visual_default", "comment", mode = "v" },
    p = { '"_dP<CR>', "paste", mode = "v" },
}, {
    prefix = "<leader>"
})

wk.register({
    [" "] = { "<cmd>Telescope find_files<cr>", "all files" },
    ["/"] = { "<Plug>kommentary_line_default", "comment" },
    e = { "<cmd>NvimTreeToggle<CR>", "explorer" },
    h = { "<cmd>nohlsearch<cr>", "clear search" },
    w = { "<cmd>w!<CR>", "save" },
    W = { "<cmd>wa!<CR>", "save all" },
    c = {
        name = "color",
        b = {
            function()
                vim.o.background = vim.o.background == "dark" and "light" or "dark"
            end
            , "toggle background dark/light"
        },
        t = { "<cmd>Telescope colorscheme<CR>", "themes" }
    },
    l = {
        name = "lsp",
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "code action" },
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "definition" },
        e = { "<cmd>lua require'telescope.builtin'.diagnostics{}<CR>", "errors" },
        f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "format" },
        n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "next problem" },
        p = { "<cmd>lua vim.diagnostic.goto_prev()<CR>", "prev problem" },
        r = { "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>", "references" },
        R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "rename" },
        s = { "<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>", "go to symbol" },
    },
    r = {
        name = "rust",
        r = { "<cmd>RustRunnables<CR>", "runnables" },
        d = { "<cmd>RustOpenExternalDocs<CR>", "open docs" },
        i = { "<cmd>RustToggleInlayHints<CR>", "toggle inlay hints" },

    },
    f = {
        name = "find",
        f = { "<cmd>Telescope find_files<cr>", "all files" },
        b = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "find in buffer" },
        k = { "<cmd>Telescope keymaps<cr>", "keymap" },
        m = { "<cmd>Telescope marks<cr>", "marks" },
        g = { "<cmd>Telescope live_grep<cr>", "grep" },
        w = { "<cmd>Telescope grep_string<cr>", "find word" },
    },
    b = {
        name = "+buffers",
        f = { "<cmd>Telescope buffers<cr>", "find" },
        d = { "<cmd>bd<CR>", "close" },
    },
    g = {
        name = "git",
        b = { "<cmd>Git blame<cr>", "blame" },
        c = { "<cmd>lua require'telescope.builtin'.git_commits{}<CR>", "commits" },
        d = { "<cmd>Gvdiffsplit<cr>", "diffsplit" },
        s = { "<cmd>lua require'telescope.builtin'.git_status{}<CR>", "status" },
    },
    j = {
        name = "json",
        f = { "<cmd>:%!jq .<CR>", "format" },
        c = { "<cmd>:%!jq -c .<CR>", "compress" },

    },
    p = {
        name = "packer",
        c = { "<cmd>PackerCompile<cr>", "compile" },
        i = { "<cmd>PackerInstall<cr>", "install" },
        l = { "<cmd>PackerClean<cr>", "clean" },
        s = { "<cmd>PackerSync<cr>", "sync" },
    },
    s = {
        name = "spelling",
        s = { "<cmd>:set spell!<CR>", "toggle spell check" },
    },
    t = {
        name = "tabs",
        c = { "<cmd>BufferCloseAllButCurrent<cr>", "close all but current" },
    },
}, {
    prefix = "<leader>"
})
