let g:NERDTreeRespectWildIgnore=1

augroup NERDTree
	autocmd!

	" Automatically close NERDTree if it's the last tab
	autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

map <Leader>n :NERDTreeToggle<CR>
