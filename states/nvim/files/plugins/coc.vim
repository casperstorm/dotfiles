" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Statusline
let g:coc_status_error_sign = "e"
let g:coc_status_warning_sign = "w"

set statusline+=\ %{coc#status()}

" Enable prettier
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

let g:coc_explorer_global_presets = {
\   'floating': {
\      'position': 'floating',
\   },
\ }

let g:coc_global_extensions = [
  \ 'coc-explorer',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-rust-analyzer',
  \ ]

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

hi! CocErrorSign ctermfg=red guifg=#BF616A
hi! CocWarningSign ctermfg=red guifg=#D08770
hi! CocInfoSign ctermfg=yellow guifg=#B48EAD

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

nmap <leader>n :CocCommand explorer --preset floating<CR>
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>g] <Plug>(coc-diagnostic-next)
nmap <leader>gf <Plug>(coc-fix-current)
nmap <leader>sr <Plug>(coc-rename)
nnoremap <silent> <leader>cs :<C-u>CocList -I -N --top symbols<CR>

