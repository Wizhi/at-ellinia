set wildignore+=src/*/bin,src/*/obj
set colorcolumn=120

" Show type information automatically when the cursor stops moving.
" Note that the type is echoed to the Vim command line, and will overwrite
" any other messages in this space including e.g. ALE linting messages.
"autocmd CursorHold *.cs OmniSharpTypeLookup

" The following commands are contextual, based on the cursor position.
nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
nmap <silent> <buffer> <Leader>u <Plug>(omnisharp_find_usages)
nmap <silent> <buffer> <Leader>i <Plug>(omnisharp_find_implementations)
nmap <silent> <buffer> <Leader>pd <Plug>(omnisharp_preview_definition)
nmap <silent> <buffer> <Leader>pi <Plug>(omnisharp_preview_implementations)
nmap <silent> <buffer> <Leader>v <Plug>(omnisharp_type_lookup)
"nmap <silent> <buffer> <Leader>d <Plug>(omnisharp_documentation)
nmap <silent> <buffer> <Leader>t <Plug>(omnisharp_find_symbol)
"nmap <silent> <buffer> <Leader>fx <Plug>(omnisharp_fix_usings)
nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

" Navigate up and down by method/property/field
nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
" Find all code errors/warnings for the current solution and populate the quickfix window
nmap <silent> <buffer> <Leader>gcc <Plug>(omnisharp_global_code_check)
" Contextual code actions (uses fzf, CtrlP or unite.vim when available)
nmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)
xmap <silent> <buffer> <Leader>ca <Plug>(omnisharp_code_actions)

nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

nmap <silent> <buffer> <Leader>r <Plug>(omnisharp_rename)

nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
