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
map('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
map('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
map('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})
map('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>", {})

-- whichkey
local wk = require("which-key")
wk.register({
    ["/"] = {"<Plug>kommentary_visual_default", "comment", mode = "v"},
}, {
    prefix = "<leader>"
})

wk.register({
   ["/"] = {"<Plug>kommentary_line_default", "comment"},
   e = {"<cmd>NvimTreeToggle<CR>", "explorer"},
   h = {"<cmd>nohlsearch<cr>", "clear search"},
   w = {"<cmd>w!<CR>", "save" },
   l = {
        name = "lsp",
        a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "code action"},
        d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "definition"},
        e = {"<cmd>lua require'telescope.builtin'.diagnostics{}<CR>", "errors"},
        f = {"<cmd>lua vim.lsp.buf.formatting()<cr>", "format"},
        n = {"<cmd>lua vim.diagnostic.goto_next()<CR>", "next problem"},
        p = {"<cmd>lua vim.diagnostic.goto_prev()<CR>", "prev problem"},
        r = {"<cmd>lua require'telescope.builtin'.lsp_references{}<CR>", "references"},
        R = {"<cmd>lua vim.lsp.buf.rename()<CR>", "rename"},
        s = {"<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>", "go to symbol"},
    },
    f = {
        name = "find",
        f = {"<cmd>Telescope find_files<cr>", "all files" },
        b = {"<cmd>Telescope current_buffer_fuzzy_find<CR>", "find in buffer" },
        k = {"<cmd>Telescope keymaps<cr>", "keymap" },
        m = {"<cmd>Telescope marks<cr>", "marks" },
        p = {"<cmd>Telescope colorscheme<cr>", "colorschemes" },
        t = {"<cmd>Telescope live_grep<cr>", "text" },
        w = {"<cmd>Telescope grep_string<cr>", "word under cursor"},
    },
    b = {
        name = "+buffers",
        f = {"<cmd>Telescope buffers<cr>", "find"},
        d = {"<cmd>bd<CR>", "close"},
    },
    g = {
        name = "git",
        b = {"<cmd>Git blame<cr>", "blame"},
        c = {"<cmd>lua require'telescope.builtin'.git_commits{}<CR>", "commits"},
        d = {"<cmd>Gvdiffsplit<cr>", "diffsplit"},
        s = {"<cmd>lua require'telescope.builtin'.git_status{}<CR>", "status"},
    },
    p = {
        name = "packer",
        c = {"<cmd>PackerCompile<cr>", "compile"},
        i = {"<cmd>PackerInstall<cr>", "install"},
        l = {"<cmd>PackerClean<cr>", "clean"},
        s = {"<cmd>PackerSync<cr>", "sync"},
    },
}, {
    prefix = "<leader>"
})
