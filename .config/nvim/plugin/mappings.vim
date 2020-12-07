" https://www.reddit.com/r/vim/comments/1vdrxg/space_is_a_big_key_what_do_you_map_it_to/cerq68d/
map <Space> <Leader>

nnoremap <silent> <C-q> :wincmd q<CR>

nnoremap <silent> <Leader>h :call WinMoveOrSplit('h')<CR>
nnoremap <silent> <Leader>j :call WinMoveOrSplit('j')<CR>
nnoremap <silent> <Leader>k :call WinMoveOrSplit('k')<CR>
nnoremap <silent> <Leader>l :call WinMoveOrSplit('l')<CR>
nnoremap <silent> <Leader>H :wincmd H<CR>
nnoremap <silent> <Leader>K :wincmd K<CR>
nnoremap <silent> <Leader>L :wincmd L<CR>
nnoremap <silent> <Leader>J :wincmd J<CR>
nnoremap <silent> <Leader><C-j> :wincmd q<CR>
