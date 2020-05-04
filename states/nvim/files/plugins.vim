
" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

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

" === Editing Plugins === "
" Case-preserving find and replace
Plug 'tpope/vim-abolish'

" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" The set of operator and textobject plugins to search/select/edit sandwiched
Plug 'machakann/vim-sandwich'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" === Syntax Highlighting === "
Plug 'sheerun/vim-polyglot'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Hex colors
Plug 'norcalli/nvim-colorizer.lua'

" Indentguides
Plug 'Yggdroot/indentLine'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'ayu-theme/ayu-vim'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Common navigation of tmux and nvim windows
Plug 'christoomey/vim-tmux-navigator'

" === Wiki === "
Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()
