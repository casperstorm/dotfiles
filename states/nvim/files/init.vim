scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "


" Remap leader key to ,
let g:mapleader=" "

" Line numbers
set number! relativenumber!

" Yank and paste with the system clipboard
set clipboard=unnamed

" Hides buffers instead of closing them
set hidden

" Highlight current cursor line
set cursorline

" Insert spaces when TAB is pressed.
set expandtab

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" do not wrap long lines by default
set nowrap

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=2

" Mouse support (for when im really lazy)
set mouse=a

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Updatetime
set updatetime=300

" ============================================================================ "
" ===                                STATUSBAR                             === "
" ============================================================================ "


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=%{&fileformat}
set statusline+=\ %p%%


" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color `support
set termguicolors

" Theme
colorscheme base16-gruvbox-dark-hard

" Set floating window to be slightly transparent
set winbl=10

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/colorizer.vim
source ~/.config/nvim/plugins/better-whitespace.vim
" source ~/.config/nvim/plugins/ultisnips.vim

" LSP
" source ~/.config/nvim/plugins/lsp.vim
" source ~/.config/nvim/plugins/completion.vim

" luafile ~/.config/nvim/lua/treesitter.lua
" luafile ~/.config/nvim/lua/colorizer.lua

" Rust.vim
let g:rustfmt_autosave = 1
" let g:rust_fold = 1

" colorizer

" Neoformat
" au BufWritePre *.js,*.ts,*.scss,*.jsx,*.tsx Neoformat

" Disable ale
" let g:ale_disable_lsp = 1
" let g:ale_fix_on_save = 1
" let g:ale_fixers = {}
" let g:ale_fixers['javascript'] = ['eslint', 'prettier']
" let g:ale_fixers['javascriptreact'] = ['eslint', 'prettier']
" let g:ale_fixers['typescript'] = ['eslint', 'prettier']
" let g:ale_fixers['typescriptreact'] = ['eslint', 'prettier']
" let g:ale_fixers['rust'] = ['rustfmt']
" let b:ale_rust_rustfmt_options = '--edition 2018'

" map <leader>g] :ALENextWrap<cr>
" map <leader>g[ :ALEPreviousWrap<cr>
" map <leader>f :ALEFix<cr>

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" Quick window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Search
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>


" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.config/nvim/backups " Don't put backups in current dir
set backup
set noswapfile
