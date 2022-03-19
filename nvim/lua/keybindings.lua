local map = require("utils").map

vim.g.mapleader = " "

--- save
map("n", "<C-s>", ":w<cr>")

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
map("n", "<Tab>", "<cmd>BufferNext<CR>")
map("n", "<S-Tab>", "<cmd>BufferPrevious<CR>")

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
   l = {
        name = "lsp",
        r = {"<cmd>lua require'telescope.builtin'.lsp_references{}<CR>", "references"},
        d = {"<cmd>lua vim.lsp.buf.definition()<CR>", "definition"},
        R = {"<cmd>lua vim.lsp.buf.rename()<CR>", "rename"},
        s = {"<cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>", "go to symbol"},
        e = {"<cmd>lua require'telescope.builtin'.diagnostics{}<CR>", "errors"},
        n = {"<cmd>lua vim.diagnostic.goto_next()<CR>", "next problem"},
        p = {"<cmd>lua vim.diagnostic.goto_prev()<CR>", "prev problem"},
        a = {"<cmd>lua vim.lsp.buf.code_action()<CR>", "code action"}
    },
    c = {
        name = "+comment",
        c = {"<Plug>kommentary_line_default", "line"},
        m = {"<Plug>kommentary_motion_default", "motion"},
        v = {
            "<Plug>kommentary_visual_default",
            "section",
            mode = "v"
        }
    },
    b = {
        name = "+buffers",
        b = {"<cmd>Telescope buffers<cr>", "all buffers"},
        d = {"<cmd>bd<CR>", "close Buffer"}
    },
    f = {
        name = "+file",
        f = {"<cmd>Telescope find_files<cr>", "find files"},
        j = {"<cmd>Telescope grep_string<cr>", "find word"},
        g = {"<cmd>Telescope live_grep<cr>", "grep"},
        n = {"<cmd>enew<cr>", "new file"},
        s = {"<cmd>Telescope current_buffer_fuzzy_find<cr>", "search in file"},
    },
    h = {"<cmd>nohlsearch<cr>", "clear search"},
    e = {"<cmd>NvimTreeToggle<CR>", "explorer"},
    g = {
        name = "git",
        s = {"<cmd>lua require'telescope.builtin'.git_status{}<CR>", "status"},
        c = {"<cmd>lua require'telescope.builtin'.git_commits{}<CR>", "commits"},
        d = {"<cmd>Gvdiffsplit<cr>", "diffsplit"}
    },
    w = {
        name = "window",
        v = {"<cmd>vsplit<cr>", "vertical split"},
        h = {"<cmd>split<cr>", "horizontal split"},
        c = {"<cmd>close<cr>", "close"}
    },
    p = {
        name = "packer",
        s = {"<cmd>PackerSync<cr>", "sync"},
        i = {"<cmd>PackerInstall<cr>", "install"},
        c = {"<cmd>PackerCompile<cr>", "compile"},
        l = {"<cmd>PackerClean<cr>", "clean"}
    },
    v = {
        name = "vim",
        r = {":so $MYVIMRC<cr>", "reload init.lua"},
        e = {":e $MYVIMRC<cr>", "edit init.lua"},
    }
}, {
    prefix = "<leader>"
})
