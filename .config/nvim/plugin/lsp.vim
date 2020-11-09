let g:diagnostic_enable_virtual_text = 0
let g:diagnostic_enable_underline = 1

"highlight link LspDiagnosticsHint
"highlight link LspDiagnosticsInfo
highlight link LspDiagnosticsWarning Todo
highlight link LspDiagnosticsError Error

"highlight link LspDiagnosticsUnderlineHint
"highlight link LspDiagnosticsUnderlineInfo
highlight link LspDiagnosticsUnderlineWarning Todo
highlight link LspDiagnosticsUnderlineError Error

call sign_define("LspDiagnosticsHintSign", {"text" : "H", "texthl" : "LspDiagnosticsHint"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "I", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "--", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsErrorSign", {"text" : ">>", "texthl" : "LspDiagnosticsError"})

lua <<EOF
	local lsp = require('nvim_lsp');
	local diagnostic = require('diagnostic');
	local ncm2 = require('ncm2');

	lsp.rust_analyzer.setup({
		on_init = ncm2.register_lsp_source,
		on_attach = diagnostic.on_attach
	});
EOF
