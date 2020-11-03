 " Complete parentheses for functions
let g:completion_enable_auto_popup = 1
let g:completion_enable_auto_paren = 1
let g:completion_auto_change_source = 1
let g:completion_chain_complete_list = [
    \{'complete_items': ['lsp']},
    \{'complete_items': ['buffers']}
\]

 " Work with endwise
let g:completion_confirm_key = "\<C-y>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" let g:completion_enable_snippet = 'UltiSnips'


inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-Space> completion#trigger_completion(

autocmd BufEnter * lua require'completion'.on_attach()
