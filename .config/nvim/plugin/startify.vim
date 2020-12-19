let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

let g:startify_bookmarks = [ 
	\ '~/.config/zsh', 
	\ '~/.config/nvim',
	\ '~/projects/wesoft/webankrecon/WeBankRecon.Api',
	\ '~/projects/wesoft/webankrecon/WeBankRecon.Viia',
	\ '~/projects/wesoft/sparrow/applications/Sparrow',
	\ '~/projects/wesoft/Organizations',
	\ ]

let g:startify_lists = [
	\ { 'type': 'files',     'header': ['   Recent files']            },
	\ { 'type': 'sessions',  'header': ['   Sessions']       },
	\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
	\ { 'type': 'commands',  'header': ['   Commands']       },
	\ ]
