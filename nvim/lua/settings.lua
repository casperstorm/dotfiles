local cmd = vim.cmd
local set = vim.opt

cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
cmd('set inccommand=split') -- Make substitution work in realtime
set.hidden = true -- Required to keep multiple buffers open multiple buffers
set.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
cmd('let &titleold="' .. TERMINAL .. '"')
set.titlestring = "%<%F%=%l/%L - nvim"
vim.wo.wrap = false -- Display long lines as just one line
cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
set.pumheight = 10 -- Makes popup menu smaller
set.fileencoding = "utf-8" -- The encoding written to file
set.cmdheight = 1 -- More space for displaying messages
cmd('set colorcolumn=99999') -- fix indentline for now
set.mouse = "a" -- Enable your mouse
set.splitbelow = true -- Horizontal splits will automatically be below
set.termguicolors = true -- set term gui colors most terminals support this
set.splitright = true -- Vertical splits will automatically be to the right
set.conceallevel = 0 -- So that I can see `` in markdown files
cmd('set ts=4') -- Insert 2 spaces for a tab
cmd('set sw=4') -- Change the number of space characters inserted for indentation
cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true -- set numbered lines
vim.wo.relativenumber = true -- set relative number
vim.wo.cursorline = true -- Enable highlighting of the current line
set.showtabline = 0 -- Always show tabs
set.showmode = false -- We don't need to see things like -- INSERT -- anymore
set.backup = false -- This is recommended by coc
set.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
set.updatetime = 300 -- Faster completion
set.timeoutlen = 100 -- By default timeoutlen is 1000 ms
set.clipboard = "unnamedplus" -- Copy paste between vim and everything else
cmd('filetype plugin on') -- filetype detection
