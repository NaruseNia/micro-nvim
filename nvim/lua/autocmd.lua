vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf ---@type number
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
			vim.keymap.set("n", "<leader>i", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
			end, { buffer = bufnr })
		end
	end,
})

-- Copilot suggetion
vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuOpen",
	callback = function()
		vim.b.copilot_suggestion_hidden = true
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "BlinkCmpMenuClose",
	callback = function()
		vim.b.copilot_suggestion_hidden = false
	end,
})
