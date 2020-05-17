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

nmap <leader>n :CocCommand explorer --preset floating<CR>
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>cr <Plug>(coc-references)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>ct <Plug>(coc-type-definition)
nmap <silent> <leader>cp <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>cn <Plug>(coc-diagnostic-next)
nnoremap <silent> <leader>cs :<C-u>CocList -I -N --top symbols<CR>
