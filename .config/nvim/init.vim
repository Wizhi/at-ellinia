set updatetime=100
set completeopt=noinsert,menuone,noselect
set relativenumber
set wildignore=""

set termguicolors
let base16colorspace=256

colorscheme $BASE16_THEME

function! UseTabs()
	set tabstop=4	  " Size of a hard tabstop (ts).
	set shiftwidth=4  " Size of an indentation (sw).
	set noexpandtab   " Always uses tabs instead of space characters (noet).
	set autoindent	  " Copy indent from current line when starting a new line (ai).

	"autocmd BufWrite * retab!
endfunction

function! UseSpaces()
	set tabstop=4	  " Size of a hard tabstop (ts).
	set shiftwidth=4  " Size of an indentation (sw).
	set expandtab	  " Always uses spaces instead of tab characters (et).
	set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
	set autoindent	  " Copy indent from current line when starting a new line.
	set smarttab	  " Inserts blanks on a <Tab> key (as per sw, ts and sts).

	"autocmd BufWrite * retab
endfunction

call UseTabs()

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

let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-j': 'split',
			\ 'ctrl-l': 'vsplit' }

augroup cleaning
	"autocmd BufWritePre * %s/\s\+$//e " Remove trailing whitespace
	"autocmd BufWritePre * %s/\($\n\s*\)\+\%$// " Remove trailing empty lines
augroup END

augroup interface
	autocmd!

	autocmd VimResized * wincmd =
augroup END

" Remap <Leader>
" https://www.reddit.com/r/vim/comments/1vdrxg/space_is_a_big_key_what_do_you_map_it_to/cerq68d/
map <Space> <Leader>

nmap <Leader>h :call WinMoveOrSplit('h')<CR>
nmap <Leader>j :call WinMoveOrSplit('j')<CR>
nmap <Leader>k :call WinMoveOrSplit('k')<CR>
nmap <Leader>l :call WinMoveOrSplit('l')<CR>
nmap <leader>H :wincmd H<CR>
nmap <leader>K :wincmd K<CR>
nmap <leader>L :wincmd L<CR>
nmap <leader>J :wincmd J<CR>
nmap <leader><C-j> :wincmd q<CR>
