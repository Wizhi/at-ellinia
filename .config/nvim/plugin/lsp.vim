highlight link LspDiagnosticsSignError Error
highlight link LspDiagnosticsSignWarning Todo
"highlight link LspDiagnosticsSignInfo
"highlight link LspDiagnosticsSignHint

sign define LspDiagnosticsSignError text=>> texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=-- texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=I texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=H texthl=LspDiagnosticsSignHint linehl= numhl=

lua << EOF
	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			underline = true,
			virtual_text = false,
			signs = true,
			update_in_insert = true,
		}
	);

	local lsp = require('nvim_lsp');
	local ncm2 = require('ncm2');

	lsp.rust_analyzer.setup({
		on_init = ncm2.register_lsp_source
	});
EOF
