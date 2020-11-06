" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'ntpeters/vim-better-whitespace'
Plug 'machakann/vim-sandwich'
Plug 'sheerun/vim-polyglot'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'


" Treesitter
" Plug 'nvim-treesitter/nvim-treesitter'
" Plug 'nvim-treesitter/nvim-treesitter-refactor'
" Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" Plug 'nvim-treesitter/playground'
" Plug 'romgrk/nvim-treesitter-context'

" " Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Themes
" Plug 'casperstorm/sort-hvid.vim'
" Plug '/Users/crs/Source/Private/sort-hvid.vim'
Plug 'chriskempson/base16-vim'
" Plug 'romainl/Apprentice'

" Formatters
" Plug 'sbdchd/neoformat'

" Configure LSP
" Plug 'neovim/nvim-lspconfig'

" LSP Diagnostics
" Plug 'nvim-lua/diagnostic-nvim'

" Completion source for buffers
" Plug 'steelsojka/completion-buffers'

" LSP/Treesitter completion
" Plug 'nvim-lua/completion-nvim'

" Linting
" Plug 'dense-analysis/ale'

call plug#end()

