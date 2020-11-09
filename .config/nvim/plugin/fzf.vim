let g:fzf_layout = { 'down': '40%' }
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-j': 'split',
	\ 'ctrl-l': 'vsplit' 
	\ }

nmap <Leader>f :Files<CR>
nmap <Leader>g :GFiles<CR>
nmap <Leader>G :GFiles?<CR>
nmap <Leader><Tab> :Buffers<CR>
nmap <Leader>s :Rg<Space>
