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

Plug 'tpope/vim-abolish'
Plug 'ntpeters/vim-better-whitespace'
Plug 'machakann/vim-sandwich'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
Plug 'sheerun/vim-polyglot'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'justinmk/vim-sneak'

" Themes
Plug 'davidosomething/vim-colors-meh'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/gruvbox-material'
" Plug 'casperstorm/sort-hvid.vim'
Plug 'lokaltog/vim-monotone'
Plug 'jaredgorski/fogbell.vim'
Plug 'huyvohcmc/atlas.vim'
Plug 'https://git.sr.ht/~romainl/vim-bruin'
Plug 'owickstrom/vim-colors-paramount'
Plug 'robertmeta/nofrils'
Plug 'axvr/photon.vim'
Plug 'ewilazarus/preto'
Plug 'hardselius/warlock'
Plug '/Users/crs/Source/Private/sort-hvid.vim'

" LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-lua/telescope.nvim'

call plug#end()


" " Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect

" " Avoid showing message extra message when using completion
" set shortmess+=c

" " Show diagnostics on 'hover'
" autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()


" " Mappings
" nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
" nmap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> gr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
" nmap <leader>gi <cmd>lua vim.lsp.buf.implementation()<CR>
" nmap <leader>gy <cmd>lua vim.lsp.buf.type_definition()<CR> 
" nmap <leader>sr <cmd>lua vim.lsp.buf.rename()<CR> 
" nmap <leader>gl <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>

" " diagnostic-nvim
" let g:diagnostic_auto_popup_while_jump = 1
" let g:diagnostic_enable_underline = 1
" let g:diagnostic_show_sign = 0
" let g:diagnostic_enable_virtual_text = 1

" nnoremap <leader>? :OpenDiagnostic<CR>
" nnoremap <leader>g[ :PrevDiagnosticCycle<CR>
" nnoremap <leader>g] :NextDiagnosticCycle<CR>

" augroup LSPCursor
" 	autocmd!
" 	autocmd CursorHold,CursorHoldI <buffer> :lua vim.lsp.buf.hover()
" augroup END

" lua require 'nvim_lsp'.rust_analyzer.setup{on_attach=require'diagnostic'.on_attach}
" lua require 'nvim_lsp'.tsserver.setup{on_attach=require'diagnostic'.on_attach}
