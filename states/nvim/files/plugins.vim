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

" Plug 'tpope/vim-abolish'
Plug 'ntpeters/vim-better-whitespace'
Plug 'machakann/vim-sandwich'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Shougo/echodoc.vim'
Plug 'sheerun/vim-polyglot'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'SirVer/ultisnips'
" Plug 'mattn/emmet-vim'
" Plug 'junegunn/vim-peekaboo'

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/gruvbox-material'
" Plug 'casperstorm/sort-hvid.vim'
Plug 'lokaltog/vim-monotone'
Plug 'jaredgorski/fogbell.vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'owickstrom/vim-colors-paramount'
Plug 'robertmeta/nofrils'
Plug '/Users/crs/Source/Private/sort-hvid.vim'
Plug 'franbach/miramare'
Plug 'wadackel/vim-dogrun'
Plug 'alessandroyorba/sierra'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/diagnostic-nvim'

" Completion
Plug 'steelsojka/completion-buffers'
Plug 'nvim-lua/completion-nvim'

call plug#end()

