set updatetime=100
set completeopt=noinsert,menuone,noselect
set number relativenumber
set wildignore=''

set termguicolors
set background=dark

colorscheme one

let g:gitgutter_sign_allow_clobber = 0
"let g:gitgutter_sign_priority = 5

augroup RelativeLineToggle
	autocmd!
	autocmd InsertEnter * set norelativenumber
	autocmd InsertLeave * set relativenumber
augroup END

let g:EditorConfig_exclude_patterns = ['fugitive://.*']
