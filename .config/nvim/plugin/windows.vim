" http://www.agillo.net/simple-vim-window-management/
function! WinMoveOrSplit(direction)
	let t:curwin = winnr()

	exec 'wincmd ' . a:direction

	if (t:curwin == winnr())
		if (match(a:direction,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec 'wincmd ' . a:direction
	endif
endfunction
